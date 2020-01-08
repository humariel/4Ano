function onInput(event) {
    const peso = document.getElementById('peso').value
    const altura = document.getElementById('altura').value / 100
    const valueElem = document.getElementById('imc_value')
    if(peso && altura) {
        const imc = peso / (Math.pow(altura, 2))

        const {background, text} =
            imc < 18.5
                ? {background: 'orange', text: 'Abaixo do peso ideal' }
                : imc < 25
                    ? {background: 'green', text: 'Peso ideal' }
                    : imc < 30
                        ? {background: 'orange', text: 'Excesso de peso' }
                        : {background: `red`, text: 'Obesidade' }

        valueElem.innerHTML = imc.toFixed(2) + ' de IMC: ' + text
        valueElem.style.backgroundColor = background

    } else {
        valueElem.innerHTML = 'Introduza os valores'
        valueElem.style.backgroundColor = 'rgba(0, 0, 255, .7)'
    }
}


setTimeout(() => {
    document.getElementById('peso').addEventListener('input', onInput)
    document.getElementById('altura').addEventListener('input', onInput)
}, 0)