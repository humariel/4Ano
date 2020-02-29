en = 1e-7; % bit error rate normal state
ei = 1e-3; % bit error rate interference state
%1.a
p = [0.99 0.999 0.9999 0.99999];
package_oneplus_errors_normal = 1 -(1*(1-en)^(128*8)); % probability of having one or more errors in a frame in normal state
package_oneplus_errors_interf = 1- (1*(1-ei)^(128*8)); % probability of having one or more errors in a frame in interference state

normal = ((package_oneplus_errors_normal*p) ./ (package_oneplus_errors_normal*p + package_oneplus_errors_interf*(1-p)))*100
interf = ((package_oneplus_errors_interf*(1-p)) ./ (package_oneplus_errors_normal*p + package_oneplus_errors_interf*(1-p)))*100

%1.b
en = 1e-7; % bit error rate normal state
ei = 1e-3; % bit error rate interference state
p = [0.99 0.999 0.9999 0.99999];
package_oneplus_errors_normal = 1 -(1*(1-en)^(128*8)); % probability of having one or more errors in a frame in normal state
package_oneplus_errors_interf = 1- (1*(1-ei)^(128*8)); % probability of having one or more errors in a frame in interference state
n = [2 3 4 5];
prob_n_errors_normal = package_oneplus_errors_normal .^ n;
prob_n_errors_inter = package_oneplus_errors_interf .^ n;

false_pos = ((prob_n_errors_normal'*p) ./ (prob_n_errors_normal'*p + (prob_n_errors_inter')*(1-p)))' * 100

%1.c
en = 1e-7; % bit error rate normal state
ei = 1e-3; % bit error rate interference state
p = [0.99 0.999 0.9999 0.99999];
package_oneplus_errors_normal = 1 -(1*(1-en)^(128*8)); % probability of having one or more errors in a frame in normal state
package_oneplus_errors_interf = 1- (1*(1-ei)^(128*8)); % probability of having one or more errors in a frame in interference state
n = [2 3 4 5];
p_n = 1 - (package_oneplus_errors_normal .^ n);
p_i = 1 - (package_oneplus_errors_interf .^ n);

false_negs = ((p_i'*(1-p)) ./ ((p_n')*p + p_i'*(1-p)))' * 100
