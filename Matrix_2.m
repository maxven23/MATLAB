n = round(input('Input n: '));
A = round(rand(n) * 100)
C = sort(A(:));
B = zeros(n);

flag = 'up';
i = 1;
j = n;
min_i = 1;
min_j = 1;
max_i = n;
max_j = n;
B(1, 1:n-1) = C(1:n-1);
k = n;
while k < n*n
    while i < max_i
       B(i, j) = C(k);
       i = i + 1;
       k = k + 1;
    end
    max_j = max_j - 1;
    
    while j > min_j
       B(i, j) = C(k);
       j = j - 1;
       k = k + 1;
    end
    min_i = min_i + 1;
    
    while i > min_i
       B(i, j) = C(k); 
       i = i - 1;
       k = k + 1;
    end
    min_j = min_j + 1;
    
    while j < max_j
       B(i, j) = C(k);
       j = j + 1;
       k = k + 1;
    end
    max_i = max_i - 1;
end

B(i, j) = C(k)

imagesc(A);
colorbar;
figure;
imagesc(B);
colorbar;