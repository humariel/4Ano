from lxml import etree
import glob

cursos = [i.split('/')[-1] for i in glob.glob("static/xml/*.xml")]
schema = etree.XMLSchema(etree.parse('static/xml/curso.xsd'))

current = {
    'doc': None,
    'index': None
}
current_doc = None
current_index = None

while True:
    print('{}\n1. Leitura Doc XML\n2. Validar Doc XML\n3. Mostrar Info Curso\n0. Sair'.format('***MENU***' if current['index'] == None else '{} selecionado'.format(cursos[current['index']])))
    option = int(input('Escolha uma opção: '))
    print()

    if option == 0:
        exit(0)
    elif option == 1:
        for i in range(len(cursos)):
            print('{} - {}'.format(i + 1, cursos[i]))
        option = int(input('Escolha uma opção: '))
        current['doc'] = etree.parse('static/xml/{}'.format(cursos[option - 1]))
        current['index'] = option - 1
    elif option == 2:
        if not current['doc']:
            print("Escolha um ficheiro xml primeiro!\n")
        else:
            print("{} {} valido".format(cursos[current['index']], 'é' if schema.validate(current['doc']) else 'não é'))
    elif option == 3:
        if not current_doc:
            print("Escolha um ficheiro xml primeiro!\n")

'''
doc = etree.parse('static/xml/lei.xml')

if schema.validate(doc):
    root = doc.getroot()
    for elem in root:
        if elem.text and elem.text.rstrip():
            print(elem.tag + ':' + elem.text.rstrip() + '\n')
else:
    print('Nâo validado')
'''

