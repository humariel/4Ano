function [avg_delay] = avg_delay_mm1(lambda, C)

B = 0.16*64 + 0.22*1518 + (1-0.22-0.16)*((65+1517)/2);
b = 8*B;

mu = C / b;

avg_delay = 1e3 * 1./(mu-lambda);

end

