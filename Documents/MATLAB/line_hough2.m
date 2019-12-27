function imh = line_hough2(im)
% hough transform
% Feng Jiang CS390S demo
[ro,co] = size(im);
[a,b,v] = find(im>0);
rho_mx = ceil(sqrt(ro^2+co^2));
%theta = -90:90;
nim = zeros(ro,co);
imh = zeros(rho_mx*2+1,181);

for i=1:length(a)
    for theta = -90:90
       r = a(i)*cos(theta/180*pi)+b(i)*sin(theta/180*pi);
       r = floor(r);
       r = r+rho_mx+1;
       imh(r,theta+90+1) = imh(r,theta+90+1)+1;
    end
end


            