function [ bw2,r2 ] = removeLines( bw ,r )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
bw2=bw;
r2=r;
vp=sum(bw,2);
vt=quantile(vp,0.998);
flag=0;
arr=[];
n=1;
for k=1:size(vp,1)
    if(vp(k)>=vt && flag==0)
       flag=1;
       arr(2*n-1)=k;
    end
    if(vp(k)<=vt && flag==1)
        flag=0;
        arr(2*n)=k;
        n=n+1;
    end
end
for k=1:n-1
   bw2(arr(2*k-1)-1:arr(2*k)+1,:)=0;
   r2(arr(2*k-1)-1:arr(2*k)+1,:)=255;
end

end

