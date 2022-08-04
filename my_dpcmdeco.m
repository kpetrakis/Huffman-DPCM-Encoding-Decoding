function [ sig,quanterr ] = my_dpcmdeco( indx, centers, predictor )

if nargin < 3
    error(message('comm:dpcmdeco:NotEnoughInputs'));
end;

% To sistima DPCM sto dekti exei ti morfi:
%             e                   quanterr
%   INDX   -->------Quantization------+-----------------------|--->sig
%                                     ^                       V
%                                 out |<----Predictor<--------| inp

len_predictor = length(predictor) - 1;
predictor = predictor(2:len_predictor+1);
predictor = predictor(:)';
len_sig = length(indx);

quanterr = indx;
quanterr = centers(indx);

x = zeros(len_predictor, 1);
for i = 1 : len_sig;
    out = predictor * x;
    sig(i) = quanterr(i) + out;
    % renew the estimated output
    x = [sig(i); x(1:len_predictor-1)];
end;

end

