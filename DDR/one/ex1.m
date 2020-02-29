% E -- Acertar na pergunta
% F1 -- Pergunta sobre materia estudada --> acerta
% F2 -- Pergunta sobre materia nao estudada --> responde ao calhas

x = linspace(0,100,100);

%1.a
%P(E) = P(E|F1)*P(F1) + P(E|F2)*P(F2) = p*1 + 1/n*(1-p) = p + (1-p)/n
n = 4;
%f1a = x + (1-x)/n;
ex1a = 0.6 + (1-0.6)/n

%1.b
%P(F1|E) = P(E|F1)*P(F1)/(P(E|F1)*P(F1) + P(E|F2)*P(F2))
%P(F1|E) = p*1/(1*p + (1-p)/n) = p*n/(1+(n-1)p)
n = 5;
%f2a = x./(x + (1-x)/n);
ex2a = 0.7*n/(1+(n-1)*0.7)

%plot(x,f1a,'r-',x,f2a,'g:');
%title("Ex_1")

%grid on

%1.c
f1an3 = x + (1-x)/3;
f1an4 = x + (1-x)/4;
f1an5 = x + (1-x)/5;
plot(x,f1an3, 'b',x,f1an4, 'b-',x,f1an5, 'b:')
title("Probabilidade de acertar")
axis([0,100,0,100])
legend("n=3", "n=4", "n=5", "location", "northwest")
grid on

figure(2)

%1.d
x = linspace(0,1,100);

f2an3 = x./(x + (1-x)/3);
f2an4 = x./(x + (1-x)/4);
f2an5 = x./(x + (1-x)/5);
plot(x,f2an3, 'b',x,f2an4, 'b-',x,f2an5, 'b:')
title("Probabilidade de saber a respota quando acerta")
axis([0,1,0,1])
legend("n=3", "n=4", "n=5", "location", "northwest")
grid on

