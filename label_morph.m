% ����ͼ�����6��ʵ���ʵ����4

% ����1:�۲�ͼ��"Fig9.07.jpg"������̬ѧ����ȥ�����г���С��10�ķ��飻
I1=imread('Fig9.07.jpg');
se=strel('square',10);
J1=imopen(I1,se);
figure, set(gcf,'name','��̬ѧ����ȥ������С��10�ķ���')
subplot(121), imshow(I1);
subplot(122), imshow(J1)

% ����2���۲�ͼ��"Fig9.16.jpg"������̬ѧ�������Բ���еĿף�
I2=imread('Fig9.16.jpg');
J2=imfill(I2,'hole');
figure, set(gcf,'name','��̬ѧ�������Բ���еĿ�')
subplot(121), imshow(I2);
subplot(122), imshow(J2)

% ����3���۲�ͼ��"Fig0921.jpg"������̬ѧ������ȡ��������
I3=imread('Fig0921.jpg');
J3=im2bw(I3);
J3=bwperim(J3,4);
figure, set(gcf,'name','��̬ѧ������ȡ����')
subplot(121), imshow(I3);
subplot(122), imshow(J3)

% ����4�� �۲�ͼ��"blood1.tif"������̬ѧ�������ϸ��������
% ��ϸ��ճ����
I4=imread('blood1.tif');
J4=histeq(I4);
J4=medfilt2(J4,[5,5]);
J4=~im2bw(J4);  % �ȶ�ֵ����Ȼ��ȡ��
se=strel('disk',5);
J4=imopen(J4,se);  % ȥ����С�ĸ��壬�����ϴ�ĺ�ϸ��
[J4, N]= bwlabel(J4, 8);  % bwlabel���ڱ�Ƕ�ֵͼ�е���ͨ�����ĸ�����8��ʾ8��ͨ
figure,set(gcf,'name', '����̬ѧ�������ϸ������')
subplot(121), imshow(I4);
subplot(122), imshow(J4);
title(['��ͨ�����ĸ���Ϊ',num2str(N)]);