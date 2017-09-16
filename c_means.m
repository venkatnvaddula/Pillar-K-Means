function [image] = cMeans(I) 

I=resizeImg(I);
if size(I,3)>1
    I=rgb2gray(I);
end


[M N]=size(I);    
data=double(reshape(I,[size(I,1)*size(I,2) 1]));
n=3;
[center, U, obj_fcn] =fcm(data, n);
%assigning the max values as the cluster center
maxU = max(U);
data = data';
wholeD = zeros(size(data));
for k = 1:n
    indexk = (U(k,:) == maxU);
    %elementwise multiplication with the data and index
    Ik = indexk.*data;
    Ik = reshape(Ik,M,N);
    result{k} = Ik;
    %%wholeG(indexk) = k-1;
end   
%
%Random Intialisation of the Cluster Center
%
mean_cluster_val = zeros(3,1);
%
%Iterating till cluster center doesn't change
%
for k = 1:n
    mean_cluster_val(k) = mean(center(k));
end
[mean_cluster_val,idx] = sort(mean_cluster_val);
img=result{idx(end)};
img=medfilt2(img,[2 2]);
%
%Display the output of the image
%
image = img;