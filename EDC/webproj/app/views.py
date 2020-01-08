from django.shortcuts import render
from django.http import HttpRequest, HttpResponse
from lxml import etree
import glob
from webproj.settings import STATIC_ROOT


def imc(request):
    assert isinstance(request, HttpRequest)
    if('peso' in request.POST and 'altura' in request.POST):
        peso = request.POST['peso']
        altura = request.POST['altura']
        if(peso and altura):
            return render(
                request,
                'imc.html',
                {
                    peso,
                    altura
                }
            )
    else:
        return render(request, 'imc.html', {})

def course(request, course):
    schema = etree.XMLSchema(etree.parse(STATIC_ROOT + '/xml/curso.xsd'))
    doc = etree.parse(STATIC_ROOT + '/xml/{}.xml'.format(course))

    content = ''
    root = doc.getroot()
    for elem in root:
        if elem.text and elem.text.rstrip():
            content += elem.tag + ':' + elem.text.rstrip() + '\n'

    return render(request, 'course.html', {
        'course': course.upper(),
        'valid': schema.validate(doc),
        'content': getHtmlFromXml(root)
    })
    # print()

def courses(request):
    cursos = [i.split('/')[-1].split('.xml')[0] for i in glob.glob(STATIC_ROOT + "/xml/*.xml")]
    return render(request, 'courses.html', {
        'courses': [{'name': c, 'display': c.upper()} for c in cursos]
    })


def getHtmlFromXml(xml, level = 0):
    html = ''
    if len(xml) > 1:
        for el in xml:
            html += getHtmlFromXml(el, level + 1)
        if html:
            html = (' ' * level) + '<div {}>{}:</div>\n'.format('class="course--title"' + 'style="margin-left: {}"'.format(str((level - 1 if level > 0 else 0) * 1) + 'rem'), xml.tag.upper()) + html
    else:
        if xml.text  and xml.text.rstrip():
            html += (' ' * level) + '<div {}><span {}>{}</span>: ''<span>{}</span></div>\n'.format('style="margin-left: {}"'.format(str((level - 1 if level > 1 else 1) * 1) + 'rem'), 'class="course--subtitle"', xml.tag, xml.text.rstrip())
    return html

# 'style="margin-left: {}"'.format(str(level * 10) + 'px')
