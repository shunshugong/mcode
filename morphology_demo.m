%%%%%%%%  形态学基本运算demo
A=imread('fig0910.tif');
figure,subplot(131),imshow(A)
title('original image');
B=strel('disk',15);   %%%%%%  生成圆形结构元素
A1=imdilate(A,B);    %%%  膨胀
subplot(232),imshow(A1)
title('dilation');
A2=imerode(A,B);     %%%  腐蚀
subplot(233),imshow(A2)
title('erosion');
A3=imopen(A,B);      %%% 开运算
subplot(235),imshow(A3)
title('opening');
A4=imclose(A,B);     %%%  闭运算
subplot(236),imshow(A4)
title('closing');
