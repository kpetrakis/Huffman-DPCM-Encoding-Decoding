function enco = huffmanenco(sig, dict)

if (~iscell(sig) )
	[m,n] = size(sig);
	sig = mat2cell(sig, ones(1,m), ones(1,n) );
end
dictLength = size(dict,1);

idxCode = 1;
for i = 1 : length(sig)
    
    % gia kathe timi, psaxnw diadoxika sto leksiko
    % gia na vrw ton antistoixo kwdiko
    tempcode = [];
    for j = 1 : dictLength
        if( sig{i} == dict{j,1} )
            tempcode = dict{j,2};
            break;
        end
    end
    
    lenCode = length(tempcode);
    enco(idxCode : idxCode+lenCode-1) = tempcode;
    idxCode = idxCode + lenCode;
end

