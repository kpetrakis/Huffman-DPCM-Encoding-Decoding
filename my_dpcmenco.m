function [ indx, quanterr ] = my_dpcmenco( N,sig, centers, partition, predictor )

if nargin < 4
     error(message('comm:dpcmenco:NotEnoughInputs'));
 end

if (length(centers)-1) ~= length(partition)
    error(message('comm:dpcmenco:InvalidPartitionSize'));
end;

if length(predictor) < 2
    error(message('comm:dpcmenco:InvalidPredictorSize'));
end
% To sistima DPCM ston pompo exei ti morfi:
%                       e                   quanterr
%   Input signal   -->+-----Quantization------|-------
%                     ^-                      V
%                     |---------------------->+
%                 out |<----Predictor<--------| inp

len_predictor = length(predictor) - 1;
predictor = predictor(2:len_predictor+1);
predictor = predictor(:)';
len_sig = length(sig);

x = zeros(len_predictor, 1);
for i = 1 : len_sig;
    out = predictor * x;
    e = sig(i) - out;
    % index
    indx(i) = my_quantizer(e,N,-3.5,3.5);
    quanterr(i) = centers(indx(i));
    inp = quanterr(i) + out;
    % renew the estimated output
    x = [inp; x(1:len_predictor-1)];
end;
    

end

