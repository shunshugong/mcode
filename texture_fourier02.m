%%%% 纹理的傅立叶频谱分析方法
I1=imread('06.jpg');
figure,subplot(231),imshow(I1)
F1=fft2(I1);
F1t=fftshift(F1);
F1s=mat2gray(log(1+abs(F1t)));
subplot(232),imshow(F1s)
%%%% 下面按不同角度对频谱求和
[m,n]=size(F1t);
m0=round(m/2+1);
n0=round(1+n/2);
angle=linspace(0,pi,101);
prob=zeros(1,100);
for i=1:m
    for j=1:n
        if j~=n0
            r=round(atan((i-m0)/(j-n0))*100/pi);
            if r<0
                r=r+100;
            end
            prob(r+1)=prob(r+1)+abs(F1t(i,j));
        else
            if i~=m0
                prob(51)=prob(51)+abs(F1t(i,j));
            end
        end        
    end
end
subplot(233),plot(angle(2:end),prob(1:100));

I2=imread('07.jpg');
subplot(234),imshow(I2)
F2=fft2(I2);
F2t=fftshift(F2);
F2s=mat2gray(log(1+abs(F2t)));
subplot(235),imshow(F2s)
%%%% 下面按不同角度对频谱求和
[m,n]=size(F2t);
m0=round(1+m/2);
n0=round(1+n/2);
angle=linspace(0,pi,101);
prob=zeros(1,100);
for i=1:m
    for j=1:n
        if j~=n0
            r=round(atan((i-m0)/(j-n0))*100/pi);
            if r<0
                r=r+100;
            end
            prob(r+1)=prob(r+1)+abs(F2t(i,j));
        else
            if i~=m0
                prob(51)=prob(51)+abs(F2t(i,j));
            end
        end        
    end
end
subplot(236),plot(angle(2:end),prob(1:100));

