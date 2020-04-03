function [AvgAvail, MinAvail]= simulatorFunction(N,S,W,dlt,T,AP,pl)
% [AvgAvail, MinAvail]= simulatorFunction(N,AP,S,W,dlt,T,pl)
% Input parameters:
%  N -   no. of mobile nodes
%  S -   maximum absolute speed of mobile nodes (in km/h)
%  W -   radio range (in meters)
%  dlt - time slot duration (in seconds)
%  T -   no. of time slots of the simulation
%  AP -  matrix with one row per AP node and 2 columns where the
%        first column has the horizontal coordinates and the
%        second column has the vertical coordinates of the AP nodes
%  pl -  plot option: 0 - nothing;
%                     1 - nodes' movement;
%                     2 - nodes' movement and connectivity
% Output parameters:
%  AvgAvail - average availability among all mobile nodes
%  MinAvail - minimum availability among all mobile nodes

    % Initialize Mobile Node position and speed vectors:
    [pos,vel]= InitializeState(N,S);
    % Initialize statistical counters:
    counter= InitializeCounter(N);
    L= [];
    C= [];
    
    %h= waitbar(0,'Running simulation...');
    
    % Simulation cycles:
    for iter= 1:T
        
        %waitbar(iter/T,h);
        
        % Update Mobile Node position and speed vectors:
        [pos,vel]= UpdateState(pos,vel,dlt);
        % Compute L with the node pairs with direct wireless links:
        L= ConnectedList(pos,W,AP);
        % Compute C with the nodes with Internet Access:
        C= ConnectedNodes(L,N,AP);
        % Update statistical counters:
        counter= UpdateCounter(C,counter);
        % Simulation visualization:    
        visualize(N,AP,pos,L,C,pl,W)
    end
    
    %delete(h)
    
    % Compute final result: 
    [AvgAvail, MinAvail]= results(T,counter);
end

function [pos,vel]= InitializeState(N,S)
    pos = [500*rand(N,1) 200*rand(N,1)];
    abs_dir= S*rand(N,1)/3.6;
    angle_dir= 2*pi*rand(N,1);
    vel= [abs_dir.*cos(angle_dir) abs_dir.*sin(angle_dir)];
end

function counter= InitializeCounter(N)
    counter = zeros(1,N);
end

function [pos,vel]= UpdateState(pos,vel,dlt)
    N= size(pos,1);
    pos = pos + dlt*vel;
    aux= [500*ones(N,1) 200*ones(N,1)];
    vel(pos>aux) = -vel(pos>aux);
    pos(pos>aux)= aux(pos>aux);
    aux= zeros(N,2);
    vel(pos<aux) = -vel(pos<aux);
    pos(pos<aux)= 0;
end

function counter= UpdateCounter(C,counter)
    counter = counter + C;
end

function L= ConnectedList(pos,W,AP)
    nodes_and_aps = [pos;AP];
    len = size(nodes_and_aps,1);
    L = [];
    for i = 1:len-1
        for j = i+1:len
             if sqrt( (nodes_and_aps(i,1)-nodes_and_aps(j,1))^2 + (nodes_and_aps(i,2)-nodes_and_aps(j,2))^2 ) <= W
                 L = [L; i j];
             end
        end
    end
end

function C= ConnectedNodes(L,N,AP)
    C = false(1,N);
    if isempty(L)
        return
    end
    s = L(:,1);
    t = L(:,2);
    G = graph(s,t,[],N+size(AP,1));    
    d = distances(G, N+1:N+size(AP,1), 1:N);
    if size(d,1) == 1
        C = d<inf;
    else
        C = min(d)<inf;
    end

end

function [AverageAvailability, MinimumAvailability]= results(T,counter)
    AverageAvailability = sum(counter)/(T*size(counter,2));
    MinimumAvailability = min(counter)/T;
end

function visualize(N,AP,pos,L,C,plotar,W)
    if plotar==0
        return
    end
    nAP= size(AP,1);
    plot(AP(1:nAP,1),AP(1:nAP,2),'s','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',12)
 
    centers = [AP(1:nAP,1) AP(1:nAP,2)];
    viscircles(centers, W+zeros(nAP,1)); % to show the circles of range around the APs
    
    hold on
    plot(pos(1:N,1),pos(1:N,2),'o','MarkerEdgeColor','r','MarkerFaceColor','r')
    if plotar==2
        pos=[pos;AP];
        for i=1:size(L,1)
            plot([pos(L(i,1),1) pos(L(i,2),1)],[pos(L(i,1),2) pos(L(i,2),2)],'b')
        end
        plot(pos(C,1),pos(C,2),'o','MarkerEdgeColor','b','MarkerFaceColor','b')
    end
    axis([0 500 0 200])
    grid on
    set(gca,'xtick',0:50:500)
    set(gca,'ytick',0:50:200)
    set(gcf, 'Position',  [900, 900, 600, 220])
    drawnow
    hold off
end

