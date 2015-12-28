load kos_doc_data.mat

%number of words
NA = sum(A(:,3,:));
NB = sum(B(:,3,:));
N = NA + NB;

%number of unique words
W = max([A(:,2); B(:,2)]);  % number of unique words
WA = size(unique(A(:,2,:)));
WB = size(unique(B(:,2,:)));

%nuber of documents
DA = max(A(:,1));            % number of documents in A
DB = max(B(:,1));            % number of documents in A
D = DA + DB;                 % number of documents in AuB

%Question B

beta = zeros(1,W);
word_id = [1:W]';
for i = 1:W %W = 6906
     j = word_id(i) == A(:,2);
     s = sum(A(j,3));
     beta(i) = s/NA;
end

sllhb = 0;
sllhd = 0;
doc2001 = B(1:232,:);
for i = 1:W
      j = word_id(i) == doc2001(:,2);
      s = sum(doc2001(j,3));
      sllhd = sllhd + log(beta(i)^s);
      j = word_id(i) == B(:,2);
      s = sum(B(j,3));
      sllhb = sllhb + log(beta(i)^s);
end

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

%%%question e
% doc2001 = B(1:232,:);
% llh = 0;
% temp = 1;
% for i = 1:232
%     word_id = doc2001(i,2);
%     count = doc2001(i,3);
%     llh = llh + count*log(beta(word_id));
%     temp = temp*factorial(count); 
% end
% comb_factor = factorial(440)/temp;
% perplexity2001 = exp(-llh/440);




%question e

%j = word_id(i) == A(:,2);

doc2001 = B(1:232,:);
word_id = [1:W]';
CA = zeros(1,W);
CD = zeros(1,W);
CB = zeros(1,W);
for i = 1:W
     j = word_id(i) == A(:,2);
     s = sum(A(j,3));
     CA(i) = s;
     j = word_id(i) == doc2001(:,2);
     s = sum(doc2001(j,3));
     CD(i) = s;
     j = word_id(i) == B(:,2);
     s = sum(B(j,3));
     CB(i) = s;
end


%doc2001
gamma_1 = CA+CD +0.1;
eta = CA + 0.1;
log_beta_gamma = sum(gammaln(gamma_1)) - gammaln(sum(gamma_1));
log_beta_eta = sum(gammaln(eta)) - gammaln(sum(eta));
llhD2001 = log_beta_gamma - log_beta_eta;
perplexityD2001 = exp(-llhD2001/440);
%B
gamma_B = CA +CB + 0.1
log_beta_gamma = sum(gammaln(gamma_B)) - gammaln(sum(gamma_B));
log_beta_eta = sum(gammaln(eta)) - gammaln(sum(eta));
llhB = log_beta_gamma - log_beta_eta;
perplexityB = exp(-llhB/NB);





% 
%f
llh_D = -log(W^440);
perD = exp(-llh_D/440);
llh_B = -log(W^NB);
perB = exp(-llh_B/NB);





