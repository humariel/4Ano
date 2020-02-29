%2.a
p = 1e-2;
d = 8*100;
ex2a = (nchoosek(d,0)*(1-p)^d)*100

%2.b
p = 1e-3;
d = 8*1000;
ex2b = (nchoosek(d,1)*p*(1-p)^(d-1))*100

%2.c
d = 200*8;
p = 1e-4;
tmp = nchoosek(d,0)*(1-p)^d;
ex2c = (1 - tmp)*100

%2.d
x = logspace(-8,-2,100);
d = 100*8;
y1 = (nchoosek(d,0)*(1-x).^d)*100;
d = 200*8;
y2 = (nchoosek(d,0)*(1-x).^d)*100;
d = 1000*8;
y3 = (nchoosek(d,0)*(1-x).^d)*100;
plot(x,y1,x,y2,x,y3);
legend("100 Bytes", "200 Bytes", "1000 Bytes", "location", "northeast") 

%2.e
x = linspace(0,1600,100);

p = 1e-4;
y1 = ((1-p).^x);
p = 1e-3;
y2 = ((1-p).^x);
p = 1e-2;
y3 = ((1-p).^x);
figure(2)
plot(x,y1,x,y2,x,y3)
axis([0,1600, 0,1]);
legend("ber 1e-4", "ber 1e-3", "ber 1e-2", "location", "southwest");
