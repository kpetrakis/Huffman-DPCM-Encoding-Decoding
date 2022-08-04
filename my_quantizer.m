function [ y_out,centers ] = my_quantizer( y,N,min_value,max_value )

levels=2^N;
D=(2*max_value)/levels;
partition=[min_value:D:max_value];
centers=[min_value+D/2:D:max_value];
centers=[min_value centers max_value];
y_out=sum(partition<y)+1;
%centers;

end

