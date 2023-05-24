import sys
import string
import math

plain_alphabet = "SGLBIZHJMFTRXAVKNQPDWYCUOE"
ciphe_alphabet = "XLEMFHIWOVNYRUDQCJPASGBTKZ"

file = sys.argv[1]
f = open(file, 'r')
message = f.read()
f.close()

cipher_message = ""
zenith = 0
nadir = 13

for char in message:
    if not (char.isalpha()):
        cipher_message += char
        continue
    #the only difference is that we locate the ciphertext character on the left/cipher alphabet. This is possible because alphabet permuting is identical in both processes.
    index_of_ciphe = ciphe_alphabet.find(char.upper())
    cipher_message += plain_alphabet[index_of_ciphe]
    
#shift cipher alphabet / left alphabet
    #shift the cipher character to the zenith position
    ciphe_alphabet = ciphe_alphabet[index_of_ciphe:] + ciphe_alphabet[:index_of_ciphe]
    #shift the character after the cipher character to the nadir, pushing the letters in front of it forward
    ciphe_alphabet = ciphe_alphabet[0] + ciphe_alphabet[2:nadir + 1] + ciphe_alphabet[1] + ciphe_alphabet[nadir + 1:]
    #print(ciphe_alphabet)

#shift plain alphabet / right alphabet
    #shift the plaintext character to the zenith position
    plain_alphabet = plain_alphabet[index_of_ciphe:] + plain_alphabet[:index_of_ciphe]
    #remove the first character and place it at the end
    plain_alphabet = plain_alphabet[1:] + plain_alphabet[0]
    #shift the second character after the plaintext character to the nadir, pushing the letters in front of it forward
    plain_alphabet = plain_alphabet[0:2] + plain_alphabet[3:nadir + 1] + plain_alphabet[2] + plain_alphabet[nadir + 1:]

print(cipher_message)

