from django.test import TestCase

# Create your tests here.

from lxml import etree


def validateXML(xml, xsd):
    schema = etree.XMLSchema(etree.parse(xsd))
    doc = etree.parse(xml)

    if schema.validate(doc):
        print('XML is validated')

def getInfos(xml):
    doc = etree.parse(xml)
    root = doc.getroot()
    for e in root.iter():
        print('%s - %s' % (e.tag, e.text))


user_input = None
while True:
    print('')
    print('1. Leitura Doc XML')
    print('2. Vaidacao Doc XML')
    print('3. Mostrar Info Curso')
    print('0. Sair')
    user_input = int(input('A sua opcao: '))
    current_doc = None

    if user_input == 1:
        current_doc = input('Nome do XML: ')
    elif user_input == 2:
        print()
        if current_doc:
            xsd = input('Ficheiro XSD: ')
            validateXML(current_doc, xsd)
        else:
            print('Leia um ficheiro primeiro!')
    elif user_input == 3:
        print()
        if current_doc:
            getInfos(current_doc)
        else:
            print('Leia um ficheiro primeiro!')
    elif user_input == 0:
        print('Thank you come again!')
        exit(0)
    else:
        print('Invalid option. Try again.')

