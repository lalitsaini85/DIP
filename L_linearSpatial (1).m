im = imread('C:\Users\GLAU\Desktop\download.jfif');
om = im;

im = double(im);
gs = rgb2gray(im);
[m n] = size(gs);
s = input('Enter the size of the mask: ');
c = (s+1)/2;
f = ones(s);
fs = 0;
for i = 1:s
    for j = 1:s
        f(i,j) = input('enter mask value: ');
        fs = fs+f(i,j);
    end
end
i2 = im;
i3 = im;
i4 = im;
i5 = im;
i6 = im;
i7 = im;
lap = ones(4);
for i = 1:4
    for j = 1:4
        lap(i,j) = input('enter laplace 4 value: ');
    end
end

for i = c:m-c+1
    for j = c:n-c+1
        sum = 0;
        i4(i,j) = min(min(im(i-c+1:i-c+s,j-c+1:j-c+s)));
        i5(i,j) = max(max(im(i-c+1:i-c+s,j-c+1:j-c+s)));
        i6(i,j) = median(median(im(i-c+1:i-c+s,j-c+1:j-c+s)));
        for k = 1:s
            for l = 1:s
                sum = sum + im(i-c+k,j-c+l)*f(k,l);
            end
        end
        i2(i,j) = sum/(s*s);
        i3(i,j) = sum/fs;
    end
end

subplot(3,3,1);
imshow(om);title('original image');
subplot(3,3,2);
imshow(gs);title('after gray scale');
subplot(3,3,3);
imshow(i2);title('image afte spatial filter');
subplot(3,3,4);
imshow(i3);title('weighted image');
subplot(3,3,5);
imshow(i4);title('min image');
subplot(3,3,6);
imshow(i5);title('max image');
subplot(3,3,7);
imshow(i6);title('median image');