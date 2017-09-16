function [perc] = edge_det(im1, im2)

img1 = im1;
img2 = im2;

o1 = imresize(img1,[300 300]);
o2 = imresize(img2,[300 300]);

imwrite(o1,'img1.jpg');
imwrite(o2,'img2.jpg');

p1 = imread('img1.jpg');
p2 = imread('img2.jpg');

[x y z] = size(p1);
if(z == 1)
    ;
else
    p1 = rgb2gray(p1);
end

[x y z] = size(p2);
if(z==1)
    ;
else
    p2 = rgb2gray(p2);
end

e1 = edge(p1,'prewitt');
e2 = edge(p2,'prewitt');

matchedData = 0;
matchedData1 = 0;

whitePoints = 0;
blackPoints = 0;
x = 0;
y = 0;
l = 0;
m = 0;

for a = 1:1:256
    for b = 1:1:256
        if(e1(a,b)==1)
            whitePoints = whitePoints+1;
        else
            blackPoints = blackPoints+1;
        end
    end
end

for i = 1:1:256
    for j = 1:1:256
        if(e1(i,j)==1 && e2(i,j)==1)
            matchedData = matchedData+1;
        else
            matchedData1 = matchedData1+1;
        end
    end
end

totaldata = whitePoints;
totalMatchedPercentage = (matchedData/totaldata)*100;

om = min(o1);
sm = min(o2);

if om == 255
    totalMatchedPercentage = 0;
elseif sm == 255
    totalMatchedPercentage = 0;
end

perc = totalMatchedPercentage;