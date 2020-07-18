I_g = imread('C:\Users\Yael\Desktop\final project\Image processing\PC3\PC3_Glucose_1.tif');
J_g = imadjust(I_g,[0 adjustment],[]);
imshow(J_g)
% Contrast adjustment helps to see and understand the %image data better. We are using an automatic method such %as adapthisteq.
%adapthisteq implements a technique called contrast-limited adaptive histogram equalization, or CLAHE.
I_eq = adapthisteq(J_g);
imshow(I_eq)
% We apply a threshold
bw = im2bw(I_eq, graythresh(I_eq));
imshow(bw)
%Let's clean that up and then overlay the perimeter on the original image
bw2 = imfill(bw,'holes');
bw3 = imopen(bw2, ones(5,5));
bw4 = bwareaopen(bw3, 40);
bw4_perim = bwperim(bw4);
overlay1 = imoverlay(I_eq, bw4_perim, [.3 1 .3]);
imshow(overlay1)
%In order to improve the separation of the blobs we use %marker-based watershed segmentation.
%With this method, we have to find a way to "mark" at %least a partial group of connected pixels inside each %object to be segmented.
%You also have to mark the background.
%We will use the bright objects (nuclei).
%The extended maxima operator can be used to identify %groups of pixels that are significantly higher than %their immediate surrounding.
mask_em = imextendedmax(I_eq, 30);
imshow(mask_em)
%Let's clean that up and then overlay it.
mask_em = imclose(mask_em, ones(5,5));
mask_em = imfill(mask_em, 'holes');
mask_em = bwareaopen(mask_em, 40);
overlay2 = imoverlay(I_eq, bw4_perim | mask_em, [.3 1 .3]);
imshow(overlay2)
%Complement the image so that the peaks become valleys. %We do this because we are about to apply the watershed %transform, which identifies low points, not high points.
I_eq_c = imcomplement(I_eq);
%Modify the image so that the background pixels and the %extended maxima pixels are forced to be the only local %minima in the image.
I_mod = imimposemin(I_eq_c, ~bw4 | mask_em);
% Compute the watershed transform.
L = watershed(I_mod);
I_eq = adapthisteq(J_g);
bw = im2bw(I_eq, graythresh(I_eq));
s = regionprops(bw, I_eq, {'Centroid','WeightedCentroid'});
imshow(label2rgb(L))
title('Weighted (red) and Unweighted (blue) Centroids');
hold on
numObj = numel(s);
for k = 1 : numObj
plot(s(k).WeightedCentroid(1), s(k).WeightedCentroid(2), 'r*');
plot(s(k).Centroid(1), s(k).Centroid(2), 'bo');
end
hold off
s = regionprops(bw, I_eq, {'Centroid','PixelValues','BoundingBox'});
%imshow(I_eq);
%imshow(bw);
imshow(label2rgb(L))
title('Standard Deviation of Regions');
hold on
for k = 1 : numObj
s(k).StandardDeviation = std(double(s(k).PixelValues));
if s(k).StandardDeviation > 20
text(s(k).Centroid(1),s(k).Centroid(2), ...
sprintf('%2.1f', s(k).StandardDeviation), ...
'EdgeColor','b','Color','r');
end
end
hold off