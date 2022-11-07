L = imread('./src/image.tif');
disp(size(L))

height = size(L, 1);

Blue  = L(1 : height / 3, :);
Green = L(height / 3 + 1 : 2 * height / 3, :);
Red   = L(2 * height / 3 + 1 : height, :);

imwrite(Red,   './src/red.tif');
imwrite(Green, './src/green.tif');
imwrite(Blue,  './src/blue.tif');