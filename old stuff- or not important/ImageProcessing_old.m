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

%image with glucose
I_no_g = imread('C:\Users\Yael\Desktop\final project\Image processing\PC3\PC3_NoGlucose_1.tif');
figure;
subplot(1,2,1), imshow(I_no_g)
title('PC3 without glucose')

% adjusting the I_no_g image
J_no_g = imadjust(I_no_g,[0 adjustment],[]);
subplot(1,2,2), imshow(J_no_g)
title('PC3 without glucose-post adjustment')

% background image with the intencity adjustment
control = imread('C:\Users\Yael\Desktop\final project\Image processing\PC3\PC3_Control.tif');
J_control = imadjust(control,[0 adjustment],[]);

%% Cell Detection Code %%
% for image with glucose 
%% Step 2: Detect Entire Cell %%

[~,threshold] = edge(J_g,'sobel');
fudgeFactor = 0.5;
BWs = edge(J_g,'sobel',threshold * fudgeFactor);

figure, imshow(BWs), title('Binary Gradient Mask');

%% Step 3: Dilate the Image %%
% Create two perpindicular linear structuring elements 
% by using strel function.
se90 = strel('line',1,90);
se0 = strel('line',1,0);
% Dilate the binary gradient mask using the vertical structuring
% element followed by the horizontal structuring element.
% The imdilate function dilates the image.
BWsdil = imdilate(BWs,[se90 se0]);
figure, imshow(BWsdil), title('Dilated Gradient Mask');
%% Step 4: Fill Interior Gaps %%
% The dilated gradient mask shows the outline of the cell quite nicely,
% but there are still holes in the interior of the cell. 
% To fill these holes, use the imfill function.
BWdfill = imfill(BWsdil,'holes');
figure, imshow(BWdfill), title('Binary Image with Filled Holes');
%% Step 5: Remove Connected Objects on Border %%
% The cell of interest has been successfully segmented,
% but it is not the only object that has been found. 
%Any objects that are connected to the border of the image
% can be removed using the imclearborder function.
%To remove diagonal connections, set the connectivity in the
% imclearborder function to 4.
BWnobord = imclearborder(BWdfill,4);
figure, imshow(BWnobord), title('Cleared Border Image');
%% Step 6: Smooth the Object %%
% Finally, in order to make the segmented object look natural,
% smooth the object by eroding the image twice with a diamond 
% structuring element. Create the diamond structuring element
% using the strel function.
seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
figure, imshow(BWfinal), title('Segmented Image');
%% Step 7: Visualize the Segmentation %%
% You can use the labeloverlay function to display the mask over 
% the original image.
figure, imshow(labeloverlay(J_g,BWfinal)), title('Mask Over Original Image');
% An alternate method to display the segmented object is to draw
% an outline around the segmented cell. 
% Draw an outline by using the bwperim function.
BWoutline = bwperim(BWfinal);
Segout = J_g; 
Segout(BWoutline) = 255; 
figure, imshow(Segout), title('Outlined Original Image');