from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.hazmat.backends import default_backend
import sys

keyFile = sys.argv[1]
password = sys.argv[2]
filei = open(sys.argv[3], "rb")
fileo = open(sys.argv[4], "wb+")

# Load key pair to a PEM file protected by a password
with open(keyFile, "rb") as kf:
    privKey = serialization.load_pem_private_key(kf.read(), bytes(password, "utf-8"), default_backend())
kf.close()

# Calculate the maximum amount of data we can encrypt with OAEP + SHA256
maxLen = privKey.key_size // 8
while True:
    ciphertext = filei.read(maxLen)

    # Encrypt the plaintext using OAEP + MGF1 ( SHA256 ) + SHA256
    if len(ciphertext) % maxLen == 0 and len(ciphertext) > 0:
        plaintext = privKey.decrypt(ciphertext, padding.OAEP(padding.MGF1(hashes.SHA256()), hashes.SHA256(), None))
        fileo.write(plaintext)
    else:
        break

filei.close()
fileo.close()

