function [PL , PL_VOIP, APD , APD_VOIP, MPD , MPD_VOIP, TT] = simulator3(lambda,C,f,n,P)
% INPUT PARAMETERS:
%  lambda - packet rate (packets/sec)
%  C      - link bandwidth (Mbps)
%  f      - queue size (Bytes)
%  P      - number of packets (stopping criterium)
% OUTPUT PARAMETERS:
%  PL   - packet loss (%)
%  APD  - average packet delay (milliseconds)
%  MPD  - maximum packet delay (milliseconds)
%  TT   - transmitted throughput (Mbps)

%Events:
ARRIVAL= 0;        % Arrival of a packet            
DEPARTURE= 1;      % Departure of a packet
ARRIVAL_VOIP= 2;   % Arrival of VoIP packet
DEPARTURE_VOIP= 3; % Departure of VoIP packet

%State variables:
State = 0;          % 0 - connection free; 1 - connection busy
QueueOccupation= 0; % Occupation of the queue (in Bytes)
Queue= [];          % Size and arriving time instant of each packet in the queue

%Statistical Counters:
TotalPackets= 0;       % No. of packets arrived to the system
LostPackets= 0;        % No. of packets dropped due to buffer overflow
TotalPackets_VOIP= 0;       % No. of VoIP packets arrived to the system
LostPackets_VOIP= 0;        % No. of VoIP packets dropped due to buffer overflow
TransmittedPackets= 0; % No. of transmitted packets
TransmittedPackets_VOIP= 0; % No. of VoIP transmitted packets
TransmittedBytes= 0;   % Sum of the Bytes of transmitted packets
Delays= 0;             % Sum of the delays of transmitted packets
MaxDelay= 0;           % Maximum delay among all transmitted packets
Delays_VOIP= 0;             % Sum of the delays of VoIP transmitted packets
MaxDelay_VOIP= 0;           % Maximum delay among all VoIP transmitted packets

%Auxiliary variables:
% Initializing the simulation clock:
Clock= 0;

% Initializing the List of Events with the first ARRIVAL:
EventList = [ARRIVAL , Clock + exprnd(1/lambda) , GeneratePacketSize() , 0];
%n vezes
for i=1:n
    EventList = [EventList; ARRIVAL_VOIP , Clock + unifrnd(0,0.02) , randi([110,130]) , 0];
end

%Similation loop:
while TransmittedPackets+TransmittedPackets_VOIP<P    % Stopping criterium
    EventList= sortrows(EventList,2);    % Order EentList by time
    Event= EventList(1,1);               % Get first event and 
    Clock= EventList(1,2);               %   and
    PacketSize= EventList(1,3);          %   associated
    ArrivalInstant= EventList(1,4);      %   parameters.
    EventList(1,:)= [];                  % Eliminate first event
    switch Event
        case ARRIVAL                     % If first event is an ARRIVAL
            TotalPackets= TotalPackets+1;
            EventList = [EventList; ARRIVAL , Clock + exprnd(1/lambda) , GeneratePacketSize() , 0];
            if State==0
                State= 1;
                EventList = [EventList; DEPARTURE , Clock + 8*PacketSize/(C*10^6) , PacketSize , Clock];
            else
                if QueueOccupation + PacketSize <= f
                    Queue= [Queue;PacketSize , Clock, DEPARTURE];
                    QueueOccupation= QueueOccupation + PacketSize;
                else
                    LostPackets= LostPackets + 1;
                end
            end
        case ARRIVAL_VOIP
            TotalPackets_VOIP= TotalPackets_VOIP+1;
            EventList = [EventList; ARRIVAL_VOIP , Clock + unifrnd(0.016,0.024) , randi([110,130]) , 0];
            if State==0
                State= 1;
                EventList = [EventList; DEPARTURE_VOIP , Clock + 8*PacketSize/(C*10^6) , PacketSize , Clock];
            else
                if QueueOccupation + PacketSize <= f
                    Queue= [Queue;PacketSize , Clock, DEPARTURE_VOIP];
                    QueueOccupation= QueueOccupation + PacketSize;
                else
                    LostPackets_VOIP= LostPackets_VOIP + 1;
                end
            end
        case DEPARTURE                     % If first event is a DEPARTURE        
            TransmittedBytes= TransmittedBytes + PacketSize;
            Delays= Delays + (Clock - ArrivalInstant);
            if Clock - ArrivalInstant > MaxDelay
                MaxDelay= Clock - ArrivalInstant;
            end
            TransmittedPackets= TransmittedPackets + 1;
            if QueueOccupation > 0
                Queue = sortrows(Queue, 3, 'descend');
                EventList = [EventList; Queue(1,3) , Clock + 8*Queue(1,1)/(C*10^6) , Queue(1,1) , Queue(1,2)];
                QueueOccupation= QueueOccupation - Queue(1,1);
                Queue(1,:)= [];
            else
                State= 0;
            end
        case DEPARTURE_VOIP
            TransmittedBytes= TransmittedBytes + PacketSize;
            Delays_VOIP= Delays_VOIP + (Clock - ArrivalInstant);
            if Clock - ArrivalInstant > MaxDelay_VOIP
                MaxDelay_VOIP= Clock - ArrivalInstant;
            end
            TransmittedPackets_VOIP= TransmittedPackets_VOIP + 1;
            if QueueOccupation > 0
                EventList = [EventList; Queue(1,3) , Clock + 8*Queue(1,1)/(C*10^6) , Queue(1,1) , Queue(1,2)];
                QueueOccupation= QueueOccupation - Queue(1,1);
                Queue(1,:)= [];
            else
                State= 0;
            end
    end
end

%Performance parameters determination:
PL= 100*LostPackets/TotalPackets;      % in %
PL_VOIP=  100*LostPackets_VOIP/TotalPackets_VOIP;      % in %
APD= 1000*Delays/TransmittedPackets;   % in milliseconds
MPD= 1000*MaxDelay;                    % in milliseconds
APD_VOIP= 1000*Delays_VOIP/TransmittedPackets_VOIP;   % in milliseconds
MPD_VOIP= 1000*MaxDelay_VOIP;                    % in milliseconds
TT= 10^(-6)*TransmittedBytes*8/Clock;  % in Mbps

end

function out= GeneratePacketSize()
    aux= rand();
    if aux <= 0.16
        out= 64;
    elseif aux >= 0.78
        out= 1518;
    else
        out = randi([65 1517]);
    end
end
