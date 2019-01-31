%读取
img=imread('D:\LenovoCloud1/test.png');
im=rgb2gray(img);
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(im), hy, 'replicate');
Ix = imfilter(double(im), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
%开运算防止过度分割
se=strel('disk',20);
i2=imopen(im,se);figure,imshow(i2)
i2(i2<50)==0;
imshow(i2)
%计算前景
fgm = imregionalmax(i2);
se2 = strel(ones(5,5));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);
fgm4 = bwareaopen(fgm3, 20);
It1 = img(:, :, 1);
It2 = img(:, :, 2);
It3 = img(:, :, 3);
It1(fgm4) = 255; It2(fgm4) = 0; It3(fgm4) = 0;
new = cat(3, It1, It2, It3);
bw=imbinarize(i2);
D=bwdist(bw);
DL = watershed(D);
bgm = DL == 0;
figure,imshow(bgm)
gradmag2 = imimposemin(gradmag, bgm | fgm4);
L = watershed(gradmag2);
Lrgb = label2rgb(L, 'jet', 'w', 'shuffle');
figure,imshow(Lrgb);
himage = imshow(Lrgb);
set(himage, 'AlphaData', 0.3);
% It1 = img(:,:, 1);
% It2 = img(:, :, 2);
% It3 = img(:, :, 3);
% fgm5 = imdilate(L == 0, ones(3, 3)) | bgm | fgm4;
% It1(fgm5) = 255; It2(fgm5) = 0; It3(fgm5) = 0;
% I4 = cat(3, It1, It2, It3);
