%%%% 傅里叶频谱的分布将偏置于与纹理垂直的方向上
Image=imread('eight.tif');
PSF1=fspecial('motion',40,30);
g=imfilter(Image,PSF1,'circular','same');
figure,subplot(221),imshow(g),title('Blurred Image');
Fg=fft2(g);
Ftg=fftshift(Fg);
Ftgp=mat2gray(2*log(1+abs(Ftg)));
subplot(222),imshow(Ftgp),title('frequency spectrum');

PSF2=fspecial('motion',40,120);
g=imfilter(Image,PSF2,'circular','same');
subplot(223),imshow(g),title('Blurred Image');
Fg=fft2(g);
Ftg=fftshift(Fg);
Ftgp=mat2gray(2*log(1+abs(Ftg)));
subplot(224),imshow(Ftgp),title('frequency spectrum');