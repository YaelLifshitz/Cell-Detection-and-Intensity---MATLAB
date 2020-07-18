%image with glucose option 1
B16_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\B16\b16glucose_1.tif');
% adjusting the I_g image
B16_j_g1 = imadjust(B16_g1,[0 adjustment],[]);

PSF = fspecial('motion',21,11);
Idouble = im2double(B16_j_g1);
blurred = imfilter(Idouble,PSF,'conv','circular');
imshow(blurred)
title('Blurred Image')

se = strel('disk',15)
background = imopen(blurred,se);
imshow(background)

I2 = blurred - background;
imshow(I2)

I3 = imadjust(I2);
imshow(I3)

bw = imbinarize(I3);
bw = bwareaopen(bw,50);
imshow(bw)
