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

level = graythresh(J_g);
c = imbinarize(J_g, level);
figure, imshow(c), title('Binary Gradient Mask');


%% Step 3: Dilate the Image %%
% Create two perpindicular linear structuring elements 
% by using strel function.

%0.1 - 15
se90 = strel('line',1,90);
se0 = strel('line',1,0);
% Dilate the binary gradient mask using the vertical structuring
% element followed by the horizontal structuring element.
% The imdilate function dilates the image.
BWsdil = imdilate(c,[se90 se0]);
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

BWnobord = imclearborder(BWdfill,1);
%'Cleared Border Image'
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
Segout(BWoutline) = 500000; 
figure, imshow(BWoutline), title('Outlined  Image');
figure, imshow(Segout), title('Outlined Original Image');

%% counting how many cells we have %%
[centers,radii] = imfindcircles(BWfinal,[40 100], 'Sensitivity',0.935,'Method','twostage');
imshow(BWfinal)
%delete(h)
h = viscircles(centers,radii,'Color','m');
length(centers)
%% calculating the intensity %%
meanGrayLevel_J_g = mean2(J_g);
meanGrayLevel_back = mean2(J_control);
intensity = (meanGrayLevel_J_g - meanGrayLevel_back)/meanGrayLevel_J_g


%%
sum=0;
num_of_pix=0;

for i=1:length(J_g(:,1))
    for j=1:length(J_g(1,:))
        if BWfinal(i,j)==1
            sum=sum+double(J_g(i,j));
            num_of_pix=num_of_pix+1;
        end
        
    end
end
mean_2=sum/num_of_pix
intensity2 = (mean_2 - meanGrayLevel_back)/mean_2

%%