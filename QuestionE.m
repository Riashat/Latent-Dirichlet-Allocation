load kos_doc_data.mat

%number of words
A_total_words = sum(A(:,3,:));
B_total_words = sum(B(:,3,:));
Total_words = A_total_words + B_total_words;

%number of unique words
W = max([A(:,2); B(:,2)]);  % number of unique words
WA = size(unique(A(:,2,:)));
WB = size(unique(B(:,2,:)));

%nuber of documents
DA = max(A(:,1));            % number of documents in A
DB = max(B(:,1));            % number of documents in A
D = DA + DB;                 % number of documents in AuB


document_2001 = B(1:232,:);
id_word = [1:W]';
CA = zeros(1,W);
CD = zeros(1,W);
CB = zeros(1,W);
for i = 1:W
     j = id_word(i) == A(:,2);
     s = sum(A(j,3));
     CA(i) = s;
     j = id_word(i) == document_2001(:,2);
     s = sum(document_2001(j,3));
     CD(i) = s;
     j = id_word(i) == B(:,2);
     s = sum(B(j,3));
     CB(i) = s;
end


%calculating per-word perplexity for doc 2001
gamma_2001 = CA+CD +0.1;
n = CA + 0.1;
logB_gamma = sum(gammaln(gamma_2001)) - gammaln(sum(gamma_2001));
logB_eta = sum(gammaln(n)) - gammaln(sum(n));
log_prob_2001 = logB_gamma - logB_eta;
perplexity_2001 = exp(-log_prob_2001/440);
%calculating per-word perplexity for all documents in B
gamma_AllB = CA +CB + 0.1
logB_gamma = sum(gammaln(gamma_AllB)) - gammaln(sum(gamma_AllB));
logB_eta = sum(gammaln(n)) - gammaln(sum(n));
log_prob_AllB = logB_gamma - logB_eta;
perplexity_AllDocs = exp(-log_prob_AllB/B_total_words);



% QUESTION F HERE
log_Mult2001 = -440*log(W); 
perplexity_2001_Mult = exp (-log_Mult2001/440);
log_Mult_AllB = - B_total_words * log(W);
perplexity_AllB_Mult = exp(-log_Mult_AllB/B_total_words);
