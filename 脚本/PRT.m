img=imread('r4.jpg');
r=img(:,:,1);
%see gauss
gfilter=fspecial('gaussian',[3 3],1.6);
rx=imfilter(r,gfilter,'replicate');

level=graythresh(r);
bw=~im2bw(r,level);

[bw2 r2]=removeLines(bw,r);
%ok ne
se=strel('rectangle',[13 13]);
bw3=imdilate(bw2,se);
r3=r2;
for n=1:size(bw3,1)
   for m=1:size(bw3,2)
      if(bw3(n,m)==0)
           r3(n,m)=255;
      end
   end
end

%new r3 
%use canny
% thresh=[0.01 0.5];
% sigma=1.6;
% f=edge(double(bw),'canny',thresh,sigma);
thresh=[0.01 0.1];
sigma=1.6;
edg=edge(double(bw3),'canny',thresh,sigma);
avg_theta=myHough(edg);
rot_angle=avg_theta+90.0;
rot_angle
if(abs(rot_angle)<=5)
    r4=myRotate(r3,rot_angle);
else
    r4=r3;
end

cutLines(r4);



