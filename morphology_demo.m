%%%%%%%%  ��̬ѧ��������demo
A=imread('fig0910.tif');
figure,subplot(131),imshow(A)
title('original image');
B=strel('disk',15);   %%%%%%  ����Բ�νṹԪ��
A1=imdilate(A,B);    %%%  ����
subplot(232),imshow(A1)
title('dilation');
A2=imerode(A,B);     %%%  ��ʴ
subplot(233),imshow(A2)
title('erosion');
A3=imopen(A,B);      %%% ������
subplot(235),imshow(A3)
title('opening');
A4=imclose(A,B);     %%%  ������
subplot(236),imshow(A4)
title('closing');
