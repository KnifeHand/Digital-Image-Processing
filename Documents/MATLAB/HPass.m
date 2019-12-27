%This function is a frequncy domain high-pass filter
function nim = HPass(im,d0,n)

[ro,co] = size(im);
cco = floor((co+1)/2);
cro = floor((ro+1)/2);

D = zeros(ro,co);
for u = 1:ro
    v = 1:co;
    D(u,:) = sqrt((u-cro)^2+(v-cco).^2);
end;

H = 1./(1+(d0./(D+1e-16)).^(2*n));
 

imf = fftshift(fft2(im));
nimf = imf.*H;
nim = ifft2(nimf);
nim = abs(nim);
