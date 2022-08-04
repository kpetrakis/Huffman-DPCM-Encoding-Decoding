function deco = huffmandeco(comp, dict)

[m,n] = size(comp);
isSigNonNumeric = max(cellfun('isclass', {dict{:,1}}, 'char') );
deco = {};

i = 1;
while(i <= length(comp))
    tempcode = comp(i); 
    found_code = is_a_valid_code(tempcode, dict);
    while(isempty(found_code) && i < length(comp))
        i = i+1;
        tempcode = [tempcode, comp(i)];
        found_code = is_a_valid_code(tempcode, dict);
    end
    if( i == length(comp) && isempty(found_code) )
        error(message('comm:huffmandeco:CodeNotFound'));
    end
	deco{end+1} = found_code;
    i=i+1;
end

if( n == 1 )         % ean i eisodos einai stili
   deco = deco';    % kanw kai tin eksodo dianisma stili
end
if ( ~isSigNonNumeric )
    decoMat = zeros(size(deco));
    decoMat = feval(class(dict{1,1}), decoMat);  % douleuei se single precision
    for i = 1 : length(decoMat)
        decoMat(i) = deco{i};
    end
    deco = decoMat;
end

%--------------------------------------------------------------------------
% antistrofi anazitisi gia ena simvolo 
% sigkrinw to code me ta stoixeia tou codebook kai epistrefw to simvolo
% an vrethei
function found_code = is_a_valid_code(code, dict)
found_code = [];
m = size(dict);
for i=1:m(1)
    if ( isequal(code, dict{i,2}) )  
        found_code = dict{i,1};
        return;
    end
end
