function[code] = my_huffmandict(signal,p)

[p,s]=sort(p);      %sortarw ton pinaka pithanotitwn p kai krataw to index
for i=1:length(p)   
   c{i}=[i];        %index gia kathe pithanotita
   code{i}='';       %codes gia diaforetikes pithanotites
end
while size(c,2)-1
	[p,i]=sort(p);
	c=c(i);
    for loop1 = [c{1}]      %vazw 0 sto elaxisto klado
        code{loop1} = ['0' code{loop1}];  
    end
    for loop1 = [c{2}]      %vazw 1 sto 2o elaxisto klado
        code{loop1} = ['1' code{loop1}];
    end
    c{2} = [c{1} c{2}]; c(1) = [];  %sigxwneusi
    p(2) = p(1) + p(2); p(1)=[];    %sigxwneusi
end
[~, s] = sort(s);   %epanaferw to arxiko sorting
code=code(s);  %epanaferw to sorting me vasi tin arxiki eisodo
%signal=signal(s);

for i=1:length(signal)
    code(2,i)={signal(i)};
end
code([1,2],:)=code([2,1],:);
code=code';