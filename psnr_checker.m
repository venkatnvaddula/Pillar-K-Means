function [psnr] = psnr_value(a,b)

img = double(a);
img1 = double(b);

    maxValue = double(max(img(:)));
    %mean squared error
    mseImg = (double(img) - double(img1)).^2;
    [r c] = size(img);
    mse = sum(mseImg(:))/(r*c);
    psnrValue = 10*log10(256^2/ mse);
    rootMse = sqrt(mse);
    string = psnrValue;
p = num2str(string);
psnr = p;
