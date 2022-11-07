getRGB
R = imread('./src/red.tif');
G = imread('./src/green.tif');
B = imread('./src/blue.tif');

subplot(1, 3, 1);
imshow(R);
title('Red');

subplot(1, 3, 2);
imshow(G);
title('Green');

subplot(1, 3, 3);
imshow(B);
title('Blue');

figure;
subplot(1, 2, 1);
L = cat(3, R, G, B);
imshow(L);
title('Merged');

subplot(1, 2, 2);
L = merge_imgs(R, G, B);
imshow(L);
title('Aligned & Merged');
