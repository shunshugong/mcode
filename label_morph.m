% 数字图像处理第6次实验课实验题4

% 问题1:观察图像"Fig9.07.jpg"，用形态学方法去掉其中长宽小于10的方块；
I1=imread('Fig9.07.jpg');
se=strel('square',10);
J1=imopen(I1,se);
figure, set(gcf,'name','形态学方法去掉长宽小于10的方块')
subplot(121), imshow(I1);
subplot(122), imshow(J1)

% 问题2：观察图像"Fig9.16.jpg"，用形态学方法填充圆环中的孔；
I2=imread('Fig9.16.jpg');
J2=imfill(I2,'hole');
figure, set(gcf,'name','形态学方法填充圆环中的孔')
subplot(121), imshow(I2);
subplot(122), imshow(J2)

% 问题3：观察图像"Fig0921.jpg"，用形态学方法提取其轮廓；
I3=imread('Fig0921.jpg');
J3=im2bw(I3);
J3=bwperim(J3,4);
figure, set(gcf,'name','形态学方法提取轮廓')
subplot(121), imshow(I3);
subplot(122), imshow(J3)

% 问题4： 观察图像"blood1.tif"，用形态学方法求红细胞数量。
% 红细胞粘连，
I4=imread('blood1.tif');
J4=histeq(I4);
J4=medfilt2(J4,[5,5]);
J4=~im2bw(J4);  % 先二值化，然后取反
se=strel('disk',5);
J4=imopen(J4,se);  % 去掉较小的个体，保留较大的红细胞
[J4, N]= bwlabel(J4, 8);  % bwlabel用于标记二值图中的连通分量的个数，8表示8连通
figure,set(gcf,'name', '用形态学方法求红细胞数量')
subplot(121), imshow(I4);
subplot(122), imshow(J4);
title(['连通分量的个数为',num2str(N)]);