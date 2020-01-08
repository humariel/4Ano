import os
import json
import sys
import base64
from cryptography import x509
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes, hmac, serialization
from cryptography.x509.oid import NameOID
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives.serialization import load_der_public_key, load_pem_private_key
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives.serialization import Encoding
from cryptography.hazmat.primitives.asymmetric import (
    padding, rsa, utils
)
import datetime
import random

from PyKCS11 import *
lib = '/usr/local/lib/libpteidpkcs11.so'
pkcs11 = PyKCS11.PyKCS11Lib()
pkcs11.load( lib )
slots = pkcs11.getSlotList()

# Json objecto to string encoded in UTF8
def json_to_string(obj):
    return json.dumps(obj,ensure_ascii=False,separators=(',',':')).encode()

def create_symmetric_key():
    key_length = 192//8 #192 bits -> 24 bytes
    secret_key = os.urandom(key_length)
    return secret_key, base64.b64encode(secret_key).decode()

def create_and_encrypt_symmetric_key(pem, returnEncoded = False):    
    secret_key, encoded_secret_key = create_symmetric_key()
    cipheredkey = encrypt_with_public_key(base64.b64decode(pem), secret_key)

    return base64.b64encode(secret_key).decode() if returnEncoded else secret_key, cipheredkey

def sign_with_symetric_key(data, key):
    h = hmac.HMAC(key, hashes.SHA256(), backend=default_backend())
    h.update(data)
    return base64.b64encode(h.finalize())

def verify_signature(data, signature, key):
    try:
        h = hmac.HMAC(key, hashes.SHA256(), backend=default_backend())
        h.update(data.encode())
        h.verify(signature)
        return True
    except:
        return False

def generate_rsa_pair():
    priv_key = rsa.generate_private_key(backend=default_backend(), public_exponent=65537, key_size=2048)
    public_key = priv_key.public_key()
    pem = priv_key.private_bytes(encoding=serialization.Encoding.PEM, format=serialization.PrivateFormat.TraditionalOpenSSL, encryption_algorithm=serialization.NoEncryption())
    subject = issuer = x509.Name([
        x509.NameAttribute(NameOID.COUNTRY_NAME, u"US"),
        x509.NameAttribute(NameOID.STATE_OR_PROVINCE_NAME, u"California"),
        x509.NameAttribute(NameOID.LOCALITY_NAME, u"San Francisco"),
        x509.NameAttribute(NameOID.ORGANIZATION_NAME, u"My Company"),
        x509.NameAttribute(NameOID.COMMON_NAME, u"mysite.com"),
    ])
    cert = x509.CertificateBuilder().subject_name(
        subject
    ).issuer_name(
        issuer
    ).public_key(
        public_key
    ).serial_number(
        x509.random_serial_number()
    ).not_valid_before(
        datetime.datetime.utcnow()
    ).not_valid_after(
        datetime.datetime.utcnow() + datetime.timedelta(days=10)
    ).add_extension(
        x509.SubjectAlternativeName([x509.DNSName(u"localhost")]),
        critical=False,
    ).sign(priv_key, hashes.SHA256(), default_backend())

    return pem, cert.public_bytes(serialization.Encoding.PEM)

def encrypt_with_public_key(pem,  data):
    certificate = x509.load_pem_x509_certificate(pem, default_backend())
    public_key = certificate.public_key()

    return base64.b64encode(public_key.encrypt(
        data,
        padding.OAEP(
            mgf=padding.MGF1(algorithm=hashes.SHA1()),
            algorithm=hashes.SHA1(),
            label=None
        )
    )).decode()

def decrypt_with_private_key(priv_key, data, encodedKey = False, returnEncoded = False):
    data = base64.b64decode(data)
    if encodedKey:
        priv_key = base64.b64decode(priv_key)

    priv_key = load_pem_private_key(
        priv_key,
        password=None,
        backend=default_backend()
    )

    decrypted_data = priv_key.decrypt(
        data,
        padding.OAEP(
            mgf=padding.MGF1(algorithm=hashes.SHA1()),
            algorithm=hashes.SHA1(),
            label=None
        )
    )
    
    return base64.b64encode(decrypted_data).decode() if returnEncoded else decrypted_data

def sign_with_private_key(priv_key, data, encodedKey = True):
    if encodedKey:
        priv_key = base64.b64decode(priv_key)

    priv_key = load_pem_private_key(
        priv_key,
        password=None,
        backend=default_backend()
    )

    signature = priv_key.sign(
        data,
        padding.PSS(
            mgf=padding.MGF1(hashes.SHA256()),
            salt_length=padding.PSS.MAX_LENGTH
        ),
        hashes.SHA256()
    )
    return base64.b64encode(signature).decode()

def verify_with_public_key(certificate, data, signature, isDer = False, isSc = False):
    certificate = base64.b64decode(certificate)
    signature = base64.b64decode(signature)

    certificate = x509.load_der_x509_certificate(certificate, default_backend()) if isDer else x509.load_pem_x509_certificate(certificate, default_backend())
    public_key = certificate.public_key()

    try:
        public_key.verify(
            signature,
            data,
            padding.PKCS1v15() if isSc else padding.PSS(
                mgf= padding.MGF1(hashes.SHA256()),
                salt_length=padding.PSS.MAX_LENGTH
            ),
            hashes.SHA1() if isSc else hashes.SHA256()
        )
        return True
    except:
        return False

def encrypt_with_symetric_key(data, key):
    if type(data) is dict:
        data = json_to_string(data)
    iv=b"k"*16
    try:
        encryptor = Cipher(
            algorithms.AES(key), 
            modes.CFB(iv), 
            backend=default_backend()
        ).encryptor()
        data = encryptor.update(data)+encryptor.finalize()
        return base64.b64encode(data)
    except:
        print('ERROR ciphering',sys.exc_info())

def decrypt_with_symetric_key(datain,key):
    data = base64.b64decode(datain)
    iv=b"k"*16 #constant but with no security issues
    try:
        decryptor = Cipher(
            algorithms.AES(key), 
            modes.CFB(iv), 
            backend=default_backend()
        ).decryptor()
        data = decryptor.update(data) + decryptor.finalize()
        return data
    except:
        print('ERROR chiphering',sys.exc_info())
        return {'error': 404}

def getCitizenCardInfo(certificate):
    certificate = base64.b64decode(certificate)
    certificate = x509.load_der_x509_certificate(certificate, default_backend())
    commonname = certificate.subject.get_attributes_for_oid(NameOID.COMMON_NAME)[0].value
    serialnumber = certificate.subject.get_attributes_for_oid(NameOID.SERIAL_NUMBER)[0].value
    return {
        "name": commonname, 
        "serialnumber": serialnumber
    }

# Creates a symetric key and ciphers it with the server public key, and ciphers the CC information with the said key
def get_register_data(certificate, username = None):
    key, cipheredkey = create_and_encrypt_symmetric_key(certificate)
    priv_key, pem = generate_rsa_pair()

    if not username:
        slot = pkcs11.getSlotList(tokenPresent=True)[0]
        session = pkcs11.openSession( slot )

        privKey = session.findObjects([(CKA_CLASS, CKO_PRIVATE_KEY),(CKA_LABEL, 'CITIZEN AUTHENTICATION KEY')])[0]   
        cc_cert = session.findObjects([(CKA_CLASS, CKO_CERTIFICATE)])[0]
        cc_certDer = bytes(session.getAttributeValue( cc_cert, [CKA_VALUE], True )[0])

        dataToSign = base64.b64encode(json_to_string({
            'cc_der':base64.b64encode(cc_certDer).decode(),
            'pem': base64.b64encode(pem).decode(),
            'cipheredkey': cipheredkey
        }))

        signature = base64.b64encode(bytes(session.sign(privKey, dataToSign, Mechanism(CKM_SHA1_RSA_PKCS)))).decode()
        session.closeSession()

    else:
        dataToSign = base64.b64encode(json_to_string({
            'username': username,
            'pem': base64.b64encode(pem).decode(),
            'cipheredkey': cipheredkey
        }))
        signature = sign_with_private_key(priv_key, dataToSign, encodedKey = False) 

    return ({ 
        'data': dataToSign.decode(),
        'signature': signature
    }, base64.b64encode(priv_key).decode(), base64.b64encode(key).decode())

def verify_register_data(register_data, priv_key): 
    # Carrega a data
    data = json.loads(base64.b64decode(register_data['data']))
    key = decrypt_with_private_key(priv_key, data['cipheredkey'], True, True)

    # Se nao existir der de CC o registo foi feito por username
    if 'cc_der' not in data:
        # Verifica se o certificado em pem que o cliente enviou e mesmo dele, usando o mesmo para verificar a assinatura da data de registo
        if verify_with_public_key(data['pem'], register_data['data'].encode(), register_data['signature']):
            return {
                'user': data['username'],
                'pem': data['pem'],
                'verified': False,
                'key' : key
            }
    # Se nao foi feito com o CC
    else:
        # Verifica se o certificado em der que o cliente enviou e mesmo dele, usando o mesmo para verificar a assinatura da data de registo (Assinado com CC)
        if verify_with_public_key(data['cc_der'], register_data['data'].encode(), register_data['signature'], isDer = True, isSc = True):
            return {
                'user': getCitizenCardInfo(data['cc_der']),
                'pem': data['pem'],
                'verified': True,
                'key' : key
            }

    return {'error': 404}

def sign_data(data, priv_key, certificate, cipher = True):
    if cipher:  
        key, cipheredkey = create_and_encrypt_symmetric_key(certificate)
        cipherdata = encrypt_with_symetric_key(json_to_string(data), key)  
        return { 
            'cipherdata': cipherdata.decode(),
            'signature': sign_with_private_key(priv_key, cipherdata),
            'cipheredkey': cipheredkey
        }

    else: 
        cipherdata = base64.b64encode(json_to_string(data))
        return { 
            'cipherdata': cipherdata.decode(),
            'signature': sign_with_private_key(priv_key, cipherdata),
        }

def verify_data(data, priv_key, certificate, decipher = True):
    if verify_with_public_key(certificate, data['cipherdata'].encode(), data['signature']):
        if decipher:
            key = decrypt_with_private_key(priv_key, data['cipheredkey'], encodedKey = True)
            return decrypt_with_symetric_key(data['cipherdata'], key)
        return json.loads(base64.b64decode(data['cipherdata']))

    return {'error': 404}

def shuffle_cards(cards):
    encrypted_cards = []
    key, encoded_key = create_symmetric_key()
    for card in cards:
        encrypted_cards.append(encrypt_with_symetric_key(base64.b64decode(card), key).decode())
    random.shuffle(encrypted_cards)
    
    return encoded_key, encrypted_cards


""" priv_key, pem = generate_rsa_pair()
data = encrypt_with_public_key(pem, b'yauuuuuu')
print(decrypt_with_private_key(priv_key, data))
key, cipheredkey = create_and_encrypt_symmetric_key(base64.b64encode(pem), pemEncoded = True, encoded = False)
print(key, cipheredkey)
print(decrypt_with_private_key(priv_key, cipheredkey)) """

""" print(decrypt_with_private_key(base64.b64encode(priv_key), data, True))
key, ciphered = create_and_encrypt_symmetric_key(pem)

print("CHAVE ANTES DE CIFRADA", key)

print("CHAVE DECIFRADA", decrypt_with_private_key(priv_key, base64.b64decode(ciphered))) """
""" import pprint
pp = pprint.PrettyPrinter(indent=4)
ccData, priv_key = get_register_data()
regData = verify_register_data(ccData)

print("REGISTER", regData)

data = {'id': 12312354323423465}
tmp = sign_data(data, regData['pem'], priv_key = server_key, cipher = False) """


""" data = {'asdfasdf': 2}
tmp = sign_data(data, regData['pem'], cipher = False)
print(verify_data({
    'cipherdata': tmp['cipherdata'],
    'signature': tmp['signature'],
}, priv_key, regData['pem'], decipher = False)) """


data = ['spades', '2']
data = str(data)
data = bytes(data, 'utf-8')
k,vhbajnkm = create_symmetric_key()
c = encrypt_with_symetric_key(data,k)
print(c)
print(decrypt_with_symetric_key(c, k).decode('utf-8'))