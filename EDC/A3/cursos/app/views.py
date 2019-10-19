from django.shortcuts import render
from lxml import etree
from BaseXClient import BaseXClient
import xmltodict
import json

# Create your views here.
root = etree.parse("/home/gabriel/UA/4Ano/EDC/A3/cursos/app/xml/cursos.xml")
session = BaseXClient.Session('localhost', 1984, 'admin', 'admin')


def home(request):
    querytxt = "<root>{ for $x in collection('edc')//curso return $x/nome}</root>"
    c = session.query(querytxt).execute()
    cursos = [{'nome': c, 'display': c.upper()} for c in xmltodict.parse(c)['root']['nome']]
    return render(request, "home.html", {'cursos': cursos})


def curso(request, nome):
    querytxt = "<root>{ for $x in collection('edc')//curso[nome = '" + nome + "'] return" \
                " ($x/nome, $x/codigo, $x/grau, $x/departamentos, $x/areascientificas, $x/local)}</root>"
    curso = session.query(querytxt).execute()
    dic = xmltodict.parse(curso, encoding="iso-8859-1")['root']
    deps = dic['departamentos']['departamento']
    print(isinstance(deps, list))
    areas = dic['areascientificas']['areacientifica']
    print(areas)
    return render(request, 'curso.html', {'nome': dic['nome'],
                                           'codigo': dic['codigo'],
                                           'grau': dic['grau'],
                                           'departamentos':  [x for x in deps] if isinstance(deps, list) else [deps],
                                           'areascientificas': [x for x in areas] if isinstance(areas, list) else [areas],
                                           'local': dic['local']})
