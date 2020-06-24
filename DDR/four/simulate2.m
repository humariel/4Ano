function simulate2(lambda, C, f,n, numSims, P, file)

packet_loss = zeros(numSims,1);
packet_loss_voip = zeros(numSims,1);
avg_delay = packet_loss;
avg_delay_voip = packet_loss_voip;
max_delay = packet_loss;
max_delay_voip = packet_loss_voip;
tt = packet_loss;

res = zeros(size(lambda,2), 14);

alpha = 0.1;

for i = 1:size(lambda,2)
    tic
    fprintf('lambda --> %d | C  --> %d | f --> %d\n', lambda(i), C(i), f(i))
    for j= 1:numSims
        [packet_loss(j), packet_loss_voip(j), avg_delay(j), avg_delay_voip(j), max_delay(j), max_delay_voip(j), tt(j)] ...
            = simulator2(lambda(i), C(i), f(i), n(i), P);
    end
    
    mean_packet_loss = mean(packet_loss);
    mean_packet_loss_voip = mean(packet_loss_voip);
    mean_avg_delay = mean(avg_delay);
    mean_avg_delay_voip = mean(avg_delay_voip);
    mean_max_delay = mean(max_delay);
    mean_max_delay_voip = mean(max_delay_voip);
    mean_tt = mean(tt);
    
    conf_packet_loss = confidence_interval(packet_loss, alpha, numSims);
    conf_packet_loss_voip = confidence_interval(packet_loss_voip, alpha, numSims);
    conf_avg_delay = confidence_interval(avg_delay, alpha, numSims);
    conf_avg_delay_voip = confidence_interval(avg_delay_voip, alpha, numSims);
    conf_max_delay = confidence_interval(max_delay, alpha, numSims);
    conf_max_delay_voip = confidence_interval(max_delay_voip, alpha, numSims);
    conf_tt = confidence_interval(tt, alpha, numSims);
    res(i,:) = [mean_packet_loss, conf_packet_loss, mean_packet_loss_voip, conf_packet_loss_voip, mean_avg_delay, conf_avg_delay, ...
        mean_avg_delay_voip, conf_avg_delay_voip, mean_max_delay, conf_max_delay, mean_max_delay_voip, conf_max_delay_voip, mean_tt, conf_tt];
    toc
    fprintf('\n')
end

save(file, 'res');

end