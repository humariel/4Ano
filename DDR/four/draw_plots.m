function draw_plots(lambda,C,file)

res = load(file).res;
loss = res(:,1);
avg_delay = res(:,3);
max_delay = res(:,5);
tt = res(:,7);

figure(1)
plot(lambda, loss);
ylim([0 40]);
xlim([min(lambda) max(lambda)]);
title('Packet loss(%) per packet rate');
ylabel('Packet Loss(%)');
xlabel('Packet Rate/Packets per Second');

figure(2)
plot(lambda, avg_delay);
hold on
plot(lambda, max_delay)
ylim([0 max(max_delay)*1.1]);
xlim([min(lambda) max(lambda)]);
title('Delays per packet rate');
ylabel('(ms)');
xlabel('Packet Rate/Packets per Second');
legend('Average Delay', 'Maximum Delay', 'location', 'southwest');


figure(3)
plot(lambda, tt);
ylim([0 C*1.1]);
xlim([min(lambda) max(lambda)]);
title('Transm.Through.(Mbps) per packet rate');
ylabel('Transm.Through.(Mbps)');
xlabel('Packet Rate/Packets per Second');

end

