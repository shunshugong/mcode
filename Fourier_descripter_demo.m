%%%%%%  �߽�ĸ���Ҷ��������ع�demo
clear
close all;
A=imread('H.bmp');
A=im2bw(A);
figure,subplot(241),imshow(A),title('��ĸH');
[num,x,y]=mycontour(A);  %%% �������
B=zeros(size(A));
for k=1:num 
    B(x(k),y(k))=1;
end
subplot(242),imshow(B),title('�߽�')
B=x+y*sqrt(-1);     %%%% �γ���������
fd=fft(B);
%%%%%%  �ø���Ҷ����ӽ����ع�
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
    subplot(2,4,2+k),imshow(K),title(['����',num2str(n),'���ع�'])
end