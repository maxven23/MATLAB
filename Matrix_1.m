 n = round(input('Input n: '));

A = round(rand(n) * 100)

B = reshape(sort(A(:)), n, n)

imagesc(A);
colorbar;
figure;
imagesc(B);
colorbar;