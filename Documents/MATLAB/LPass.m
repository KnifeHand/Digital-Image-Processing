
function nim = LPass(im,d0,n)
%This function is a frequncy domain low-pass filter
[ro,co] = size(im);
cco = floor((co+1)/2);
cro = floor((ro+1)/2);

D = zeros(ro,co);
for u = 1:ro
    v = 1:co;
    D(u,:) = sqrt((u-cro).^2+(v-cco).^2);
end

H = 1./(1+(D/d0).^(2*n));
figure,imagesc(H)
figure,mesh(H)


imf = fftshift(fft2(im));
nimf = imf.*H;
nim = ifft2(nimf);
nim = abs(nim);
