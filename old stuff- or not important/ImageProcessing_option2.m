adjustment=0.01;
% loading the image to the program
%image with glucose
I_g = imread('C:\Users\Yael\Desktop\final project\Image processing\PC3\PC3_Glucose_1.tif');
figure;
subplot(1,2,1), imshow(I_g)
title('PC3+glucose')

% adjusting the I_g image
J_g = imadjust(I_g,[0 adjustment],[]);
subplot(1,2,2), imshow(J_g)
title('PC3+glucose-post adjustment')

%To be able to extract the dimmer cells, it is necessary to perform some local contrast adjustments
I1 = adapthisteq(J_g);
figure, imshow(I1), title('local contrast adjustments')

%Objects on the borders can be caused by noise and 
%other artifacts. We can eliminate objects on the borders of the image like this:
I2 = imclearborder(I1);
figure, imshow(I2), title('eliminate objects on the borders of the image')

%Additionally, we can remove noise by adaptive filtering, using a small window
%(in this case 5x5 pixels). The changes are barely noticeable to the human eye,
%but they greatly reduce the number of incorrect cells found:
I3 = wiener2(I2, [5 5]);
figure, imshow(I3), title('remove noise by adaptive filtering')








