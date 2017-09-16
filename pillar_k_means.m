function [image] = pkms(I)

I = weinerFilter(I);
I = resizeImg(I);
imwrite(I,'noised.jpg');


ab =im2double(I(:,:));
nrows = size(ab,1);             
ncols = size(ab,2);
ab = reshape(ab,[1 nrows*ncols]);
C=3;

%
%Call Pillar K-Means Function
%
[cls_idx cluster_center] = pilkmns(ab',C);
%input the output of Pillar K-means
o=reshape(cls_idx,nrows,ncols);
oo=double(~mat2gray(o));
oo=medfilt2(oo,[3 3]);
%
%Structuring element like sqaure or diamond are called in this case.
%
se=strel('diamond',2);
img=imdilate(oo,se);


image = img;
