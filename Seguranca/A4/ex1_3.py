import os
import sys
from cryptography.hazmat.primitives . ciphers import Cipher , algorithms , modes
from cryptography.hazmat.primitives import padding
from cryptography.hazmat.backends import default_backend
def main () :
    if len(sys.argv) < 4:
        print("Usage: python3 ex1_2.py <key_file> <input_file> <output_file> <optional: algorithm(AES or DES)(AES is default)>")
        return

    # Read key from key file and setup secretKey with the key to encrypt
    key_f = open(sys.argv[1], "rb")
    secretKey = key_f.read()

    # Setup cipher : AES in CBC mode , w/ a random IV and PKCS #7 padding ( similar to PKCS #5)
    if len(sys.argv) == 5 and sys.argv[4]=="DES":
        algorithm = algorithms.TripleDES
        print("Using 3DES")
    else:
        algorithm = algorithms.AES
        print("Using AES")
    iv = os.urandom (algorithm.block_size // 8)
    cipher = Cipher(algorithm(secretKey) , modes.CBC(iv) , default_backend() )
    encryptor = cipher.decryptor()
    padder = padding.PKCS7( algorithm.block_size ).padder()

    # Open input file for reading and output file for writing
    input_f = open(sys.argv[2], "rb")
    output_f = open(sys.argv[3], "wb")

    # Write the contents of iv in the output file
    output_f.write(iv)
    while True : # Cicle to repeat while there is data left on the input file
        # Read a chunk of the input file to the plaintext variable
        plaintext = input_f.read()

        # Use for the chunk length a multiple of the AES data block size
        if not plaintext or len(plaintext) % algorithm.block_size != 0:
            ciphertext = padder.update(encryptor.update(plaintext)) + padder.finalize()
            # Write the contents of ciphertext in the output file
            output_f.write(ciphertext)
            break
        else :
            ciphertext = padder.update(encryptor.update(plaintext))
            # Write the ciphertext in the output file
            output_f.write(ciphertext)
    print("Done.")


if __name__ == "__main__":
    main()