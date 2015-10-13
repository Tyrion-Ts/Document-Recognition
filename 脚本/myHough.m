function [ avg_theta ] = myHough( in )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
f=in;
[H,theta,rho]=hough(f);

peaks=houghpeaks(H,5);

lines=houghlines(f,theta,rho,peaks,'MinLength',200,'FillGap',100);

figure,imshow(f);hold on;
sum_theta=0;
for k=1:length(lines)
   xy=[lines(k).point1;lines(k).point2];
  plot(xy(:,1),xy(:,2),'Color',[.0 .0 .6],'LineWidth',5);
  sum_theta=lines(k).theta+sum_theta;
end
avg_theta=sum_theta/length(lines);

end

