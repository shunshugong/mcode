I1=imread('04.jpg');
figure,subplot(231),imshow(I1);
F1=fftshift(fft2(I1));
F1s=mat2gray(2*log(1+abs(F1)));
subplot(234), imshow(F1s);

I2=imread('05.jpg');
subplot(232),imshow(I2);
I2=rgb2gray(I2);
F2=fftshift(fft2(I2));
F2s=mat2gray(log(1+abs(F2)));
subplot(235), imshow(F2s);

I3=imread('03.jpg');
subplot(233),imshow(I3);
F3=fftshift(fft2(I3));
F3s=mat2gray(2*log(1+abs(F3)));
subplot(236), imshow(F3s);