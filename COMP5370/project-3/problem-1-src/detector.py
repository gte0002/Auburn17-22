#!/usr/bin/env python3

import dpkt, socket, sys
from dpkt.compat import compat_ord
from functools import cmp_to_key

SYN_SYNACK_RATIO = 3

def mac_addr(address):
#    Convert a MAC address to a readable/printable string

#       Args:
#           address (str): a MAC address in hex form (e.g. '\x01\x02\x03\x04\x05\x06')
#       Returns:
#           str: Printable/readable MAC address
        return ':'.join('%02x' % compat_ord(b) for b in address)

def inet_to_str(inet):
#    Convert inet object to a string

#        Args:
#            inet (inet struct): inet network address
#        Returns:
#            str: Printable/readable IP address

    # First try ipv4 and then ipv6
        try:
                return socket.inet_ntop(socket.AF_INET, inet)
        except ValueError:
                return socket.inet_ntop(socket.AF_INET6, inet)

def tcpFlags(tcp):
#Returns a list of the set flags in this TCP packet.
    ret = list()

    if tcp.flags & dpkt.tcp.TH_FIN != 0:
        ret.append('FIN')
    if tcp.flags & dpkt.tcp.TH_SYN  != 0:
        ret.append('SYN')
    if tcp.flags & dpkt.tcp.TH_RST  != 0:
        ret.append('RST')
    if tcp.flags & dpkt.tcp.TH_PUSH != 0:
        ret.append('PSH')
    if tcp.flags & dpkt.tcp.TH_ACK  != 0:
        ret.append('ACK')
    if tcp.flags & dpkt.tcp.TH_URG  != 0:
        ret.append('URG')
    if tcp.flags & dpkt.tcp.TH_ECE  != 0:
        ret.append('ECE')
    if tcp.flags & dpkt.tcp.TH_CWR  != 0:
        ret.append('CWR')
    
    return ret


def compare_IPs(ip1, ip2):
#ip1 < ip2 return negative
#if equal return 0
#ip1 > ip2 return positive
    return sum(map(int, ip1.split('.'))) - sum(map(int, ip2.split('.')))

#############
#Arg Parsing#
#############

# Must include a pcap to read from.
if len(sys.argv) <= 1:
    print ("{0}: needs a filepath to a PCAP file".format(sys.argv[0]))
    sys.exit(-1)

# Try to open the pcap file and create a pcap.Reader object.
try:
    f = open(sys.argv[1], 'rb')
    pcap = dpkt.pcap.Reader(f)

except (IOError, KeyError):
    print ("Cannot open file:", sys.argv[0])
    sys.exit(-1)

#############
### Main ####
#############
suspects = dict() # Dictionary of suspects. suspect's IP: {# SYNs, # SYN-ACKs}
curPacket = 0     # Current packet number.

# Analyze captured packets.
for ts, buf in pcap:
    curPacket += 1

    # Ignore malformed packets
    try:
        eth = dpkt.ethernet.Ethernet(buf)
    except (dpkt.dpkt.UnpackError, IndexError):
        continue

    # Packet must include IP protocol to get TCP
    ip = eth.data
    if not ip:
        continue

    # Skip NON TCP packets
    tcp = ip.data
    if type(tcp) != dpkt.tcp.TCP:
        continue

    # Get all of the set flags in this TCP packet
    tcpFlag = tcpFlags(tcp)

    srcIP = inet_to_str(ip.src)
    dstIP = inet_to_str(ip.dst)

    # Fingerprint possible suspects.
    if {'SYN'} == set(tcpFlag):          # A 'SYN' request.
        if srcIP not in suspects: suspects[srcIP] = {'SYN': 0, 'SYN-ACK': 0}
        suspects[srcIP]['SYN'] += 1
    elif {'SYN', 'ACK'} == set(tcpFlag): # A 'SYN-ACK' reply.
        if dstIP not in suspects: suspects[dstIP] = {'SYN': 0, 'SYN-ACK': 0}
        suspects[dstIP]['SYN-ACK'] += 1

# Remove unlikely suspects based on ratio of SYNs to SYN-ACKs.
#for s in suspects.keys():
for s in list(suspects):
    if suspects[s]['SYN'] < (suspects[s]['SYN-ACK'] * SYN_SYNACK_RATIO):
        del suspects[s]

# Output
print ("Analyzed", curPacket, "packets:")

if not suspects:
    print ('no suspicious packets detected...')

for s in sorted(list(suspects), key=cmp_to_key(compare_IPs)):
    syns = suspects[s]['SYN']
    synacks = suspects[s]['SYN-ACK']

    print ("{0:15} had {1} SYNs and {2} SYN-ACKs".format(s, syns, synacks))
