function [ r2 ] = myRotate( r , rot_angle )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
r2=imrotate(r,rot_angle);
for n=1:size(r2,1)
   for m=1:size(r2,2)
      if(r2(n,m)==0)
         r2(n,m)=255; 
      end
   end
end

end

