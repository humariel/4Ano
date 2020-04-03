%script to plot the requested graphs
%when running, leave only one section uncommented

res = load('res.mat').res;
N = [20; 40; 60; 80;];
S = [3; 6];
W = [40; 60; 80];
AP = {[250 100];[150 100; 350 100];[50 50; 250 100; 450 150] };

% plot the impact of the radio range (W) on availability
% here we plot for every amount of N and AP configuration
% we fixate on those values and see how the availability changes with W

count = 1;
for i=1:length(N)
    for j=1:length(AP)
        % only retrieving availability values (no confidence intervals)
        y = res(i, 1, :, j, [2,4]);
        %resize mat to be a 3*2 to have average avail in collumn 1
        %and minimum avail in collumn 2
        y = reshape(y,length(W),2);
        %tranpose y to plot it
        y = y';
        figure(count)
        bar(W, y);
        legend('Average confidence', 'Minimum confidence', 'location', 'northwest')
        title(['Impact of W with N=',num2str(N(i)),' and ',num2str(j), ' APs'])
        hold on
        count = count + 1;
    end
end

%% plot the impact of the amount of mobile Nodes (N) on availability
% here we plot for every amount of W and AP configuration
% we fixate on those values and see how the availability changes with N

% count = 1;
% for i=1:length(W)
%     for j=1:length(AP)
%         % only retrieving availability values (ignoring confidence interval for now)
%         y = res(:, 1, i, j, [2,4]);
%         %resize mat to be a 4*2 to have average avail in collumn 1
%         %and minimum avail in collumn 2
%         y = reshape(y,length(N),2);
%         %tranpose y to plot it
%         y = y';
%         figure(count)
%         bar(N, y);
%         legend('Average', 'Minimum', 'location', 'northwest')
%         title(['Impact of N with W=',num2str(W(i)),' and ',num2str(j), ' APs'])
%         hold on
%         count = count + 1;
%     end
% end

%% plot the impact of the amount of AP's on availability
% here we plot for every amount of N and W
% we fixate on those values and see how the availability changes with AP configurations

% count = 1;
% for i=1:length(N)
%     for j=1:length(W)
%         % only retrieving availability values (ignoring confidence interval for now)
%         y = res(i, 1, j, :, [2,4]);
%         %resize mat to be a 3*2 to have average avail in collumn 1
%         %and minimum avail in collumn 2
%         y = reshape(y,length(AP),2);
%         %tranpose y to plot it
%         y = y';
%         figure(count)
%         bar(1:length(AP), y);
%         legend('Average', 'Minimum', 'location', 'northwest')
%         title(['Impact of number of APs with N=',num2str(N(i)),' and W= ',num2str(W(j))])
%         hold on
%         count = count + 1;
%     end
% end
