from django.shortcuts import render

# Create your views here.


def sendInfo(request):
    if 'peso' in request.POST and 'altura' in request.POST:
        peso = request.POST['peso']
        altura = request.POST['altura']

        if peso and altura:
            try:
                peso = float(peso)
                altura = float(altura)
                return render(request, 'sendResult.html', {'imc': peso / (pow(altura, 2))})
            except ValueError:
                return render(request, 'sendInfo.html', {})

    return render(request, 'sendInfo.html', {})


def sendResult(request):
    return render(request, 'sendResult.html', {})