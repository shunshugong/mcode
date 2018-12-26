%%%%%%  边界的傅立叶描绘子与重构demo
clear
close all;
A=imread('H.bmp');
A=im2bw(A);
figure,subplot(241),imshow(A),title('字母H');
[num,x,y]=mycontour(A);  %%% 获得轮廓
B=zeros(size(A));
for k=1:num 
    B(x(k),y(k))=1;
end
subplot(242),imshow(B),title('边界')
B=x+y*sqrt(-1);     %%%% 形成虚数点列
fd=fft(B);
%%%%%%  用傅立叶描绘子进行重构
for k=1:6
    n=round(num/2^k);    
    fd(round(n/2)+1:round(n/2)+num-n)=0;
    iff=ifft(fd);
    ifdx=round(real(iff));
    ifdy=round(imag(iff));
    K=zeros(size(A));
    for m=1:num
        K(ifdx(m),ifdy(m))=1;
    end
    subplot(2,4,2+k),imshow(K),title(['采用',num2str(n),'项重构'])
end