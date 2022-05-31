a=imread('cameraman.tif');
h =zeros(256,2);
for i = 1:256
    h(i,1) = i-1;
end

for i = 1:256
    for j = 1:256
        h(a(i,j)+1,2) = h(a(i,j)+1,2)+1;
    end
end
b =zeros(256,7);
for i = 1:256
    b(i,1) = i-1;
end
for i = 1:256
    b(i,2) = h(i,2);
end
for i=1:256
    b(i,3) = b(i,2)./(256*256);
end
b(1,4) = b(1,3);
for i = 2:256
    b(i,4) = b(i,3)+b(i-1,4);
end
for i = 1:256
    b(i,5) = b(i,4)*255;
end
for i=1:256
    b(i,6) = round(b(i,5),0);
end
for i = 2:256
    if(b(i,6)==b(i-1,6))
        b(i,7) = b(i,2)+b(i-1,2);
    else
        b(i,7) = b(i,2);
    end
end

nh = zeros(256,256);
for i = 1:255
    for j = 1:255
        for k = 1:255
            if(a(j,k)== (i-1))
                nh(j,k) = b(i-1,6);
            end
        end
    end
end

nh = cast(nh,"unit8");        
    
subplot(2,2,1);
bar(h(:,1),h(:,2));
subplot(2,2,2);
imhist(a);
subplot(2,2,3);
bar(b(:,6),b(:,7));
subplot(2,2,4);
imhist(nh);
