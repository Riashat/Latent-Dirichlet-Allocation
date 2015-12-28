clear all
clc
load kos_doc_data.mat

D = max(A(:,1));    %number of documents in A
W = max([A(:,2)]);  % number of unique words in A

A_total_words = sum(A(:,3));

beta = zeros(1,W);
word_id = [1:W]';
for i = 1:W %W = 6906
     j = word_id(i) == A(:,2);
     s = sum(A(j,3));
     beta(i) = s/A_total_words;
end
% 
% sllhb = 0;
% sllhd = 0;
% doc2001 = B(1:232,:);
% for i = 1:W
%       j = word_id(i) == doc2001(:,2);
%       s = sum(doc2001(j,3));
%       sllhd = sllhd + log(beta(i)^s);
%       j = word_id(i) == B(:,2);
%       s = sum(B(j,3));
%       sllhb = sllhb + log(beta(i)^s);
% end

%plot bar
[B,I] = sort(beta,'descend')
b = B(1:20)
i = I(1:20)

names = []

for elm = i
    names = [names V(i)];
end

axis([0 1 0 20])

barh(b)
set(gca, 'ytick', 1:20)
set(gca,'yticklabel',names)