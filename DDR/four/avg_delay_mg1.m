function [avg_delay] = avg_delay_mg1(lambda, C)

B = 0.16*64 + 0.22*1518 + (1-0.22-0.16)*((65+1517)/2);
b = 8*B;

mu = C / b;

ES = 1./mu;
ES2 = 2./(mu.^2);
avg_delay = lambda.*ES2 ./ (2*(1-lambda.*ES)) * 1e3;

end

