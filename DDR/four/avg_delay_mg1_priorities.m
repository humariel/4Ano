function [avg_delay_data, avg_delay_voip] = avg_delay_mg1_priorities(lambda_data, lambda_voip, C)
%data
B_data = 0.16*64 + 0.22*1518 + (1-0.22-0.16)*((65+1517)/2); %average size of a packet
b_data = 8*B_data; % in bits

mu_data = C / b_data;
ES_data = 1./mu_data;

ES2_data = 8^2*(0.16*64^2 + 0.22*1518^2) ./ C.^2;

p = (1-0.22-0.16)/length(65:1517);

for i=65:1517
    ES2_data = ES2_data + 8^2*(p*i^2)./ C.^2;
end

%voip
B_voip = (110+130)/2; %average size of a packet
b_voip = 8*B_voip; % in bits

mu_voip = C/ b_voip;
ES_voip = 1./mu_voip;

p = 1/length(110:130);
ES2_voip = zeros(1,length(C));
for j=110:130
    ES2_voip = ES2_voip + 8^2*(p*j^2)./C.^2;
end

%queue avg delay
ro_data = lambda_data./mu_data
ro_voip = lambda_voip./mu_voip
avg_delay_queue_data = ( lambda_data.*ES2_data + lambda_voip.*ES2_voip ) ./ ( 2*(1- ro_voip).*(1- ro_voip - ro_data) );
avg_delay_queue_voip = ( lambda_data.*ES2_data + lambda_voip.*ES2_voip ) ./ ( 2*(1-ro_voip) );

%avg delays
avg_delay_data = (ES_data + avg_delay_queue_data) * 1e3;

avg_delay_voip = (ES_voip + avg_delay_queue_voip) * 1e3;

end

