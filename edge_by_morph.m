%%%%%% ����̬ѧ������ȡ��Ե
I=imread('fig0921.tif');
figure,subplot(121),imshow(I);
if ~islogical(I)   %%  uint8 ת���� logical
    I = I ~= 0;
end
se=strel('disk',2);
I_eroded=imerode(I,se);
I_edge=I & ~I_eroded;
subplot(122),imshow(I_edge)
I3=bwperim(I);
figure,imshow(I3,4)