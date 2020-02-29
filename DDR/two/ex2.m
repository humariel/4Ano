%2.a
p0 = 1/(1 + (1/180 + 1/180*20/40 + 1/180*20/40*10/20 + 1/180*20/40*10/20*5/2))
p1 = p0*1/180
p2 = p0*(1/180*20/40)
p3 = p0*(1/180*20/40*10/20)
p4 = p0*(1/180*20/40*10/20*5/2)
%2.b
ps = [p0 p1 p2 p3 p4];
errors = [1e-6 1e-5 1e-4 1e-3 1e-2];
avg_bit_error = sum(errors .* ps) / sum(ps) %sum(ps) é 1 neste caso
%2.c
t0 = 1/1 * 60
t1 = 1/(180+20) * 60
t2 = 1/(40+10) * 60
t3 = 1/(5+20) * 60
t4 = 1/2 * 60
%2.d
pint = p3 + p4
%2.e
ps = [p3 p4];
errors = [1e-3 1e-2];
avg_bit_error_int = sum(errors.*ps) / sum(ps) % neste caso sum(ps) já não é 1
%2.f
p4to3 = 20/(20+5);
p4to5 = 1-p4to3;
p5to4 = 1;
avgTime=0;
for i=0:9
    avgTime=avgTime + (p4to5*p5to4)^i * p4to3*(t3+(t3+t4)*i);
end