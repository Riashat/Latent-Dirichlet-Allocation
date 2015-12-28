load kos_doc_data.mat
A_docs = max(A(:,1));
B_docs = max(B(:,1));
Tot_docs = A_docs + B_docs; %total docs count A U B
A_total_words = sum(A(:,3));
B_total_words = sum(B(:,3));
Tot_words = A_total_words + B_total_words; %total words A U B
A_unique_words = unique(A(:,2));
B_unique_words = unique(B(:,2));
Union = [A ; B];
U_unique_words = unique(Union(:,2)); % Unique words present in A U B


%element comparison
uniq_doc2001 = unique(B(1:232,2));
A_unique_words = unique(A(:,2));
difference_words = setdiff(uniq_doc2001, A_unique_words);
num_unique_words_in_B = setdiff(unique(B(:,2)), unique(A(:,2)));
