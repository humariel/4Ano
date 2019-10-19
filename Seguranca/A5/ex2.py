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
pubKey = privKey.public_key()
kf.close()

# Calculate the maximum amount of data we can encrypt with OAEP + SHA256
maxLen = (pubKey.key_size // 8) - 2 * hashes.SHA256.digest_size - 2

while True:
    # Read for plaintext no more than maxLen bytes from the input file
    plaintext = filei.read(maxLen)

    # Encrypt the plaintext using OAEP + MGF1 ( SHA256 ) + SHA256
    # Write ciphertext in the ouput file
    if len(plaintext) % maxLen == 0 and len(plaintext) > 0:
        ciphertext = pubKey.encrypt(plaintext, padding.OAEP(padding.MGF1(hashes.SHA256()), hashes.SHA256(), None))
        fileo.write(ciphertext)
    else:
        ciphertext = pubKey.encrypt(plaintext, padding.OAEP(padding.MGF1(hashes.SHA256()), hashes.SHA256(), None))
        fileo.write(ciphertext)
        break

filei.close()
fileo.close()

