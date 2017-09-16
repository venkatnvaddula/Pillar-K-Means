function [image] = wein(I)

img = I;
img = rgb2gray(img);
img = resizeImg(img);
J = imnoise(img,'gaussian',0,0.025);

img1 = wiener2(J,[5 5]);
img1 = resizeImg(img1);
imwrite(img1,'noise.jpg');

image = img1;