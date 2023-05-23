import sys
import string
import math

plain_alphabet = "SGLBIZHJMFTRXAVKNQPDWYCUOE"
cipher_alphabet = "XLEMFHIWOVNYRUDQCJPASGBTKZ"

file = sys.argv[1]
f = open(file, 'r')
message = f.read()
f.close()

for char in message: 
    print(plain_alphabet.find(char.upper()))

