N = [20; 40; 60; 80;];
S = [3; 6];
W = [40; 60; 80];
AP = {[250 100];[150 100; 350 100];[50 50; 250 100; 450 150] };

numIter = 10;
avg = zeros(numIter,1);
min = avg;
alpha = 0.1;
res = zeros(size(N,1), size(S,1), size(W,1), size(AP,1), 4);

for N_conf = 1:size(N,1)
    for S_conf = 1:size(S,1)
        for W_conf = 1:size(W,1)
            for AP_conf = 1:size(AP,1)
                tic
                fprintf('N --> %d | S --> %d | W --> %d | Nº of APs --> %d\n', N(N_conf), S(S_conf), W(W_conf), AP_conf)
                for i= 1:numIter
                    fprintf('.')
                    [avg(i), min(i)] = simulatorFunction( N(N_conf), S(S_conf), W(W_conf), 1, 7200, AP{AP_conf}, 0 );
                end
                fprintf('\n')
                mean_avg = mean(avg);
                mean_min = mean(min);
                conf_int_avg = norminv(1-alpha/2)*sqrt(var(avg)/numIter);
                conf_int_min = norminv(1-alpha/2)*sqrt(var(min)/numIter);
                tmp = [mean_avg; conf_int_avg; mean_min; conf_int_min];
                for j=1:size(tmp,1)
                    res(N_conf, S_conf, W_conf, AP_conf,j) = tmp(j);
                end
                toc
            end
        end
    end
end

save('res.mat', 'res');

%suggested ap locations
% N = [20; 40; 60; 80;];
% S = [3];
% W = [40; 60; 80];
% AP = {[50 100; 250 100; 450 100]; [75 75; 250 125;425 75] };
% 
% numIter = 10;
% avg = zeros(numIter,1);
% min = avg;
% alpha = 0.1;
% sug_res = zeros(size(N,1), size(S,1), size(W,1), size(AP,1), 4);
% for N_conf = 1:size(N,1)
%     for S_conf = 1:size(S,1)
%         for W_conf = 1:size(W,1)
%             for AP_conf = 1:size(AP,1)
%                 tic
%                 fprintf('N --> %d | S --> %d | W --> %d | AP config --> %d of 2\n', N(N_conf), S(S_conf), W(W_conf), AP_conf)
%                 for i= 1:numIter
%                     fprintf('.')
%                     [avg(i), min(i)] = simulatorFunction( N(N_conf), S(S_conf), W(W_conf), 1, 7200, AP{AP_conf}, 0 );
%                 end
%                 fprintf('\n')
%                 mean_avg = mean(avg);
%                 mean_min = mean(min);
%                 conf_int_avg = norminv(1-alpha/2)*sqrt(var(avg)/numIter);
%                 conf_int_min = norminv(1-alpha/2)*sqrt(var(min)/numIter);
%                 tmp = [mean_avg; conf_int_avg; mean_min; conf_int_min];
%                 for j=1:size(tmp,1)
%                     sug_res(N_conf, S_conf, W_conf, AP_conf,j) = tmp(j);
%                 end
%                 toc
%                 
%             end
%         end
%     end
% end
% 
% save('sug_res.mat', 'sug_res');

%%
numIter = 10;
alpha = 0.1;
avg = zeros(numIter,1);
min = avg;
for i=1:numIter
    fprintf('.')
    % N=80 a tentar so com 8, esta quase quase quase
    %[avg(i), min(i)] = simulatorFunction( 80, 3, 60, 1, 7200, [40 20;40 170;175 30;175 170;325 30;325 170;460 20;460 180], 0); 
    %for N=60
    %[avg(i), min(i)] = simulatorFunction( 60, 3, 60, 1, 7200, [40 40; 40 160; 140 40; 140 160; 250 40; 250 160; 360 40; 360 160; 460 40; 460 160], 0);
    %for N=40
    %[avg(i), min(i)] = simulatorFunction( 40, 3, 60, 1, 7200, [30 40; 30 160; 90 100; 135 20; 135 180; 200 100; 250 20; 250 180; 300 100; 365 20; 365 180; 410 100; 470 40; 470 160], 0);
end
mean_avg = mean(avg);
mean_min = mean(min);
conf_int_avg = norminv(1-alpha/2)*sqrt(var(avg)/numIter);
conf_int_min = norminv(1-alpha/2)*sqrt(var(min)/numIter);
tmp = [mean_avg; conf_int_avg; mean_min; conf_int_min]


