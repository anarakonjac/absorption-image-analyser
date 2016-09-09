% applyFourierFilter_sp1.m
% Assumes filter_sp1 exists
% Fourier filter should have the same dimensions as the main image and
% should be tailored for a particular ROI and binning setting.
% Script outputs a Fourier filtered version of A

load([FFpathname_sp1 FFfilename_sp1]);

image_size = size(A);

deltax = 1;
deltay = 1;
kx1 = mod(1/2 + (0:(image_size(1) - 1))/image_size(1),1) - 1/2;
kx = kx1*(2*pi*deltax);
kx = sort(kx);

ky1 = mod(1/2 + (0:(image_size(2) - 1))/image_size(2),1) - 1/2;
ky = ky1*(2*pi*deltay);
ky = sort(ky);

% This is the bit that actually does anything:
A_ft = fftshift(fft2(A));
A_filtered = filter_sp1.*A_ft;
A = real(ifft2(ifftshift(A_filtered)));