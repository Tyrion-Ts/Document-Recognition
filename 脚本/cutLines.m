function [ ] = cutLines( r2 )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%r2=imread('r2.bmp');
level=graythresh(r2);
bw=~im2bw(r2,level);
vp=sum(bw,2);
vt=quantile(vp,0.5);
flag=0;
arr=[];
n=1;
for k=1:size(vp,1)
   if(vp(k)<= vt && flag==0)
       arr(2*n-1)=k;
       flag=1;
   end
   if(vp(k)>vt && flag==1)
       arr(2*n)=k;
       flag=0;
       n=n+1;
   end
end
arrg=[];
for k=1:n-1
   arrg(k)=int16((arr(2*k-1)+arr(2*k))/2);
end

for k=1:size(arrg,2)-1
    if(arrg(k+1)-arrg(k)>=12)
        tmp=r2(arrg(k):arrg(k+1),:);
        figure,imshow(tmp);
    end
end
if(int16(size(arr,2)/2)*2 ~= size(arr,2))
   % imshow(r2);
   tmp=r2(arrg(size(arrg,2)):arr(size(arr,2)),:);
   figure,imshow(tmp);
end

end

