import sys
from shellcode import shellcode

# send bytes used in target0 to output
#sys.stdout.buffer.write(b'gte0002^@  A+.')
print('gte0002\x00  A+')
