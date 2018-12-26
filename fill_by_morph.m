%%%%%%%  用形态学运算进行区域填充  %%算法有错
A=imread('fig9.16.jpg');
A=dither(A);
figure, subplot(121), imshow(A);
B=strel('disk',15);
startx=266;starty=142;
P=zeros(size(A));
P(starty,startx)=1;
PB=imdilate(P,B);
A=double(A);
AC=1-A;  %%%% A的补集
A1=double(PB).*AC;
flag=1;
while flag
    AB=imdilate(A1,B);
    A2=double(AB).*AC;
    if sum(abs(double(A2)-double(A1)))==0
        flag=0;
    else
        A1=A2;
    end
end
A3=A2+A;
subplot(122),imshow(A3)
     
