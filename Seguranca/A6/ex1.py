from PyKCS11 import *

lib = '/usr/local/lib/libpteidpkcs11.so'

pkcs11 = PyKCS11.PyKCS11Lib()
pkcs11.load(lib)
slot = pkcs11.getSlotList()[0]

classes = {
CKO_PRIVATE_KEY : 'private key',
CKO_PUBLIC_KEY : 'public key',
CKO_CERTIFICATE : 'certificate'
}

session = pkcs11.openSession(slot)
objects = session.findObjects()
for obj in objects:
    l = session.getAttributeValue(obj, [CKA_LABEL])[0]
    c = session.getAttributeValue( obj, [CKA_CLASS])[0]
    print("Object with label " + l + ", of class " + classes[c])