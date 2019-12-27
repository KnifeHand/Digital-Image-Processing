clc
clear all
close all


 im =imread('./test/face_good.bmp');
  figure,imshow(im);
   im =  imread('./test/face_dark.bmp');
   figure,imshow(im);title('face');
 im = double(im);

ims1 = (im(:,:,1)>95) & (im(:,:,2)>40) & (im(:,:,3)>20);
ims2 = (im(:,:,1)-im(:,:,2)>15) | (im(:,:,1)-im(:,:,3)>15);
ims3 = (im(:,:,1)-im(:,:,2)>15) & (im(:,:,1)>im(:,:,3));
ims = ims1 & ims2 & ims3;
figure,imshow(ims);title('skin detected');



 imf=imread('./test/face_dark.bmp');
 figure,imshow(imf);title('dark face');
 imluv = colorspace('Luv<-rgb',imf);
 L=imluv(:,:,1);
 U=imluv(:,:,2);
 V=imluv(:,:,3);
 figure,imagesc(L); axis image;axis off; title('L','fontsize',14);
%  figure,imhist(L./max(max(L)));  
 Lhist=myhist(L);
%  Lhist=Lhist./max(max(Lhist));
 figure,plot(Lhist);
%  [count,Lhist]=imhist(L);
 varV=zeros(256,1); 
 
 %% try find the biggest change within the histogram (using 10 local neighbors)
 for i=11:246
if Lhist(i)+Lhist(i+1)+Lhist(i+2)+Lhist(i+3)+Lhist(i+4)+Lhist(i+5)>0
      varV(i)= abs(Lhist(i-10)+Lhist(i-8)+Lhist(i-6)-Lhist(i)+Lhist(i+6)+Lhist(i+8)+Lhist(i+10));
end
 end
 
 [value, location]=max(varV);
 T = location;
 
[co,ro]=size(L);
 mask=ones(co,ro);
for x=1:co
   for y=1:ro
       if x==1 || y==1
           mask(x,y)=0;
       elseif  L(x,y)>T
           mask(x,y)=0; 
       end
   end
end


ims = ims1 & ims2 & ims3 & mask;
figure,imshow(ims);title('skin detected after deleted background');
 

for i=1:co
    for j=1:ro
        if ims(i,j)==0
            im(i,j,:)=0;
        end
        
    end
end
figure,imshow(im./255);
i=i;