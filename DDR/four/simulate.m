function simulate(lambda, C, f, numSims, P, file)

packet_loss = zeros(numSims,1);
avg_delay = packet_loss;
max_delay = packet_loss;
tt = packet_loss;

res = zeros(size(lambda,2), 8);

alpha = 0.1;

for i = 1:size(lambda,2)
    tic
    fprintf('lambda --> %d | C  --> %d | f --> %d\n', lambda(i), C(i), f(i))
    for j= 1:numSims
        [packet_loss(j), avg_delay(j), max_delay(j), tt(j)] = simulator1(lambda(i), C(i), f(i), P);
    end
    fprintf('\n')
    
    mean_packet_loss = mean(packet_loss);
    mean_avg_delay = mean(avg_delay);
    mean_max_delay = mean(max_delay);
    mean_tt = mean(tt);
    
    conf_packet_loss = confidence_interval(packet_loss, alpha, numSims);
    conf_avg_delay = confidence_interval(avg_delay, alpha, numSims);
    conf_max_delay = confidence_interval(max_delay, alpha, numSims);
    conf_tt = confidence_interval(tt, alpha, numSims);
    res(i,:) = [mean_packet_loss, conf_packet_loss, mean_avg_delay, conf_avg_delay, mean_max_delay, conf_max_delay, mean_tt, conf_tt];
    toc
end

save(file, 'res');

end