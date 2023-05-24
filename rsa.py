import math
import random
def calcE(t):
    fin = True
    while(fin):
        temp = random.randrange(2,t)
        if(math.gcd(t,temp)==1):
            fin = False
            return temp;
def calcD(e, t):
    fin = True
    temp = 2;
    while(fin):
        if((temp*e)%t==1):
            fin = False
            return temp;
        temp+=1
def encrypt(val, e, n):
  if val < n:
      return val ** e % n
  else:
      print("Error keylength too small for data: ",val)
      return -1
def decrypt(val, d, n):
  return val ** d % n
def pickTwoPrimes():
  primes = [239, 241, 251, 263, 269]
  c = random.sample(primes, 2)
  return c

def genKey(s):
  p,q = pickTwoPrimes()
  print("Primes: ",p,q)
  #when no modular inverse is found, try again with a different e.
  d = -1
  while(d == -1):
    n = p*q
    t = (p-1)*(q-1)
    #calculate e, which must be co-prime with t
    e = calcE(t)
    #find d, the modular inverse of e, or return -1 when none is found
    d = calcD(e,t)
  return n,e,d

MESSAGE = b'A'
n,e,d = genKey(MESSAGE)

print("n=", n, "e=", e, "d=", d)
value = int.from_bytes(MESSAGE, "big")
print("Original  :",hex(value),value, MESSAGE,);
mess =  encrypt(value,e,n)
print("Encrypted :",hex(mess),mess);
orig = decrypt(mess,d,n)
print("Decrypted :",hex(orig))
