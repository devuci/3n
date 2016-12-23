
function A = ECOfilter(W,directed)

%INPUT:
% W = Weighted square similarity matrix
% directed = 1/0
%OUTPUT:
%A = filtered adjacency matrix
%Written by Fabrizio De Vico Fallani 23/12/2016
%Reference "A topological criterion to filter information in complex brain
%networks, De Vico Fallani et al, Plos Comp Biol, 2017

%%%

N=size(W,1);

if directed
    numcon=3*N;
    ind=find(W);
else
    W=triu(W);
    numcon=1.5*N;
    ind=find(triu(W));
end

if numcon>length(ind)
    error('Input matrix is too sparse')
end

sorind=sortrows([ind W(ind)],-2);

W(sorind(numcon+1:end,1))=0;

if directed
    A=double(logical(W));
else
    A=double(logical(W+W'));
end