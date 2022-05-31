imgx = [0 0 0 0 0 0 0 0 0 0
     0 1 1 0 0 0 0 1 1 0
     0 1 1 0 0 0 0 1 1 0
     0 0 0 1 1 1 1 0 0 0
     0 0 0 1 1 1 1 0 0 0
     0 0 0 1 1 1 1 0 0 0
     0 0 0 1 1 1 1 0 0 0
     0 1 1 1 1 1 1 1 1 0
     0 1 1 0 0 0 0 1 1 0
     0 0 0 0 0 0 0 0 0 0
     ];

%subplot(1,2,1);
%imshow(i);
im = imread("cameraman.tif");
i1 = imgx;
[p q] = size(i1);
z = zeros(p+1,q+1);
for i = 2:p-1
    for j = 2:q-1
        z(i,j) = i1(i-1,j-1);
    end
end
subplot(1,2,1);
imshow(z);title("original image");

mat = ones(3);
[r s] = size(z);

imm = i1;
for i = 2:r-1
    for j = 2:s-1
        for k=1:3
            for l = 1:3
                if(mat(k,l)==z(i-2+k,j-2+l) && mat(k,l)==1)
                    imm(i-1,j-1)=1;
                end
            end
        end
    end
end
subplot(1,2,2);
imshow(imm);title("dilation image");
