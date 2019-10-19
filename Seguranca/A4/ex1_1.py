import sys
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
from cryptography.hazmat.backends import default_backend
# The PBKDF2 generator of Python receives as inpout the number of byes to generate ,
# instead of bits

salt = b'\ x00 '
pwd = sys.argv[1]
kdf = PBKDF2HMAC ( hashes . SHA1 () , 16 , salt , 1000 , default_backend () )
secretKey = kdf.derive ( bytes ( pwd , 'UTF -8 ') );
print(secretKey)
f = open("a", "wb")
f.write(secretKey)
f.close()
# Write secretKey in a file
