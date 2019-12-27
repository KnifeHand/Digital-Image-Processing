function psnr_Value = PSNR(A,B)
% PSNR (Peak Signal to noise ratio)

if (size(A) ~= size(B))
   error('The size of the 2 matrix are unequal')
   psnr_Value = NaN;
   return; 
elseif (A == B)
   disp('Images are identical: PSNR has infinite value')
   psnr_Value = Inf;
   return;   
else

    maxValue = double(max(A(:))); %% this is L 

    % Calculate MSE, mean square error.
    [rows columns] = size(A);  %% this is M and N
    mseImage = (double(A) - double(B)) .^ 2;
    mse = sum(mseImage(:)) / (rows * columns);

    % Calculate PSNR (Peak Signal to noise ratio)
    psnr_Value = 10 * log10( maxValue^2 / mse);
end
end

