n = round(input('Input n: '));
m = round(input('Input m: '));
A = round(rand(n, m) * 100)
C = sort(A(:));
length(C)
B = zeros(n, m);

i = 1;
j = m;
min_i = 1;
min_j = 1;
max_i = n;
max_j = m;
B(1, 1:m-1) = C(1:m-1);
k = m;
while k < n*m
    while i < max_i && (k < n*m)
       B(i, j) = C(k);
       i = i + 1;
       k = k + 1;
    end
    max_j = max_j - 1;
    
    while j > min_j && (k < n*m)
       B(i, j) = C(k);
       j = j - 1;
       k = k + 1;
    end
    min_i = min_i + 1;
    
    while i > min_i && (k < n*m)
       B(i, j) = C(k); 
       i = i - 1;
       k = k + 1;
    end
    min_j = min_j + 1;
    
    while (j < max_j) && (k < n*m)
       B(i, j) = C(k);
       j = j + 1;
       k = k + 1;
    end
    max_i = max_i - 1;
end

B(i, j) = C(k)

imagesc(A);
title('Unsorted');
colorbar;

figure;
imagesc(B);
title('Sorted');
colorbar;