function [avg_delay] = avg_delay_mg1(lambda, C)

B = 0.16*64 + 0.22*1518 + (1-0.22-0.16)*((65+1517)/2);
b = 8*B;

mu = C / b;

ES = 1./mu;
ES2 = 8^2*(0.16*64^2 + 0.22*1518^2) ./ C.^2;

%+ (1-0.22-0.16)*((65+1517)/2)^2
p = (1-0.22-0.16)/length(65:1517);

for i=65:1517
    ES2 = ES2 + 8^2*(p*i^2)./ C.^2;
end
avg_delay = ( lambda.*ES2 ./ (2*(1-lambda.*ES))  + ES )* 1e3;

end

