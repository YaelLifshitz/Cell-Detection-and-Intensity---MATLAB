adjustment=0.01;

T = table();

% loading the images to the program
%% PC3 with glucose %% 

% background/control image with the intencity adjustment
PC3_control = imread('C:\Users\Yael\Desktop\final project\Image processing\PC3\PC3_Control.tif');
% adjusting the background/control image
PC3_j_control = imadjust(PC3_control,[0 adjustment],[]);

%image with glucose option 1
PC3_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\PC3\PC3_Glucose_1.tif');
% adjusting the I_g image
PC3_j_g1 = imadjust(PC3_g1,[0 adjustment],[]);
%image processing the I_g image
PC3_g_p1 = ImageProcessing(PC3_j_g1,0);

%image with glucose option 2
PC3_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\PC3\PC3_Glucose_2.tif');
% adjusting the I_g image
PC3_j_g2 = imadjust(PC3_g2,[0 adjustment],[]);
%image processing the J_g image
PC3_g_p2 = ImageProcessing(PC3_j_g2,-0.004);


% figure;
% subplot(2,2,1), imshow(PC3_g_p1)
% title('PC3_g_p1')
% subplot(2,2,2), imshow(PC3_j_g1)
% title('PC3_j_g1')
% subplot(2,2,3), imshow(PC3_g_p2)
% title('PC3_g_p2')
% subplot(2,2,4), imshow(PC3_j_g2)
% title('PC3_j_g2')


figure;
subplot(1,2,1), imshow(PC3_g_p1)
title('PC3 with glucose')
subplot(1,2,2), imshow(PC3_j_g1)
title('PC3 with glucose')

%chacking te intensity of cell with glo option 1
intensity_PC3_g1 = Intensity(PC3_j_g1, PC3_j_control, PC3_g_p1)

%chacking te intensity of cell with glo option 2
intensity_PC3_g2 = Intensity(PC3_j_g2, PC3_j_control, PC3_g_p2)

intensity_array = [intensity_PC3_g1, intensity_PC3_g2]
ave_glu = mean(intensity_array)


%% PC3 with no glucose %%
%image with no glucose option 1
PC3_no_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\PC3\PC3_NoGlucose_1.tif');
% adjusting the I_no_g image
PC3_j_no_g1 = imadjust(PC3_no_g1,[0 adjustment],[]);
%image processing the I_no_g image
PC3_no_g_p1 = ImageProcessing(PC3_j_no_g1,-0.03);

%image with no glucose option 2
PC3_no_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\PC3\PC3_NoGlucose_2.tif');
% adjusting the I_no_g image
PC3_j_no_g2 = imadjust(PC3_no_g2,[0 adjustment],[]);
%image processing the I_no_g image
PC3_no_g_p2 = ImageProcessing(PC3_j_no_g2,-0.03);

% background/control image with the intencity adjustment
PC3_control = imread('C:\Users\Yael\Desktop\final project\Image processing\PC3\PC3_Control.tif');
% adjusting the background/control image
PC3_j_control = imadjust(PC3_control,[0 adjustment],[]);

% figure;
% subplot(2,2,1), imshow(J_no_g_p1)
% title('PC3 without glucose 1')
% subplot(2,2,2), imshow(J_no_g1)
% title('PC3 without glucose 1')
% subplot(2,2,3), imshow(PC3_no_g_p2)
% title('PC3 without glucose 2')
% subplot(2,2,4), imshow(PC3_j_no_g2)
% title('PC3 without glucose 2')

figure;
subplot(1,2,1), imshow(PC3_no_g_p1)
title('PC3 without glucose 1')
subplot(1,2,2), imshow(PC3_j_no_g1)
title('PC3 without glucose 1')

%chacking te intensity of cell with no glo option 1
intensity_PC3_no_g1 = Intensity(PC3_j_no_g1, PC3_j_control, PC3_no_g_p1)

%chacking te intensity of cell with no glo option 2
intensity_PC3_no_g2 = Intensity(PC3_j_no_g2, PC3_j_control, PC3_no_g_p2)

intensity_array = [intensity_PC3_no_g1, intensity_PC3_no_g2]
ave_noglu = mean(intensity_array)

%puting the intensity results in the table
PC3Table = {'PC3',intensity_PC3_g1,intensity_PC3_g2,'none',ave_glu,intensity_PC3_no_g1,intensity_PC3_no_g2,'none',ave_noglu};
T = [T;PC3Table];
%% 3T3 with glucose %%

adjustment=0.006;

% background/control image with the intencity adjustment
threeT3_control = imread('C:\Users\Yael\Desktop\final project\Image processing\3T3\3T3Control.tif');
% adjusting the background/control image
threeT3_j_control = imadjust(threeT3_control,[0 adjustment],[]);

%image with glucose option 1
threeT3_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\3T3\3T3Glucose_1.tif');
% adjusting the I_g image
threeT3_j_g1 = imadjust(threeT3_g1,[0 adjustment],[]);
%image processing the I_g image
threeT3_g_p1 = ImageProcessing(threeT3_j_g1,0.01);

%image with glucose option 2
threeT3_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\3T3\3T3Glucose_2.tif');
% adjusting the I_g image
threeT3_j_g2 = imadjust(threeT3_g2,[0 adjustment],[]);
%image processing the J_g image
threeT3_g_p2 = ImageProcessing(threeT3_j_g2,0.01);


figure;
subplot(2,2,1), imshow(threeT3_g_p1)
title('J_g_p1')
subplot(2,2,2), imshow(threeT3_j_g1)
title('J_g1')
subplot(2,2,3), imshow(threeT3_g_p2)
title('J_g_p2')
subplot(2,2,4), imshow(threeT3_j_g2)
title('J_g2')


%chacking te intensity of cell with glo option 1
intensity_threeT3_g1 = Intensity(threeT3_j_g1, threeT3_j_control, threeT3_g_p1)

%chacking te intensity of cell with glo option 2
intensity_threeT3_g2 = Intensity(threeT3_j_g2, threeT3_j_control, threeT3_g_p2)


%% 3T3 with no glucose %%
adjustment=0.006;
%image with no glucose option 1
threeT3_no_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\3T3\3T3_NoGlucose_1.tif');
% adjusting the I_no_g image
threeT3_j_no_g1 = imadjust(threeT3_no_g1,[0 adjustment],[]);
%image processing the I_no_g image
threeT3_no_g_p1 = ImageProcessing(threeT3_j_no_g1,0.02);

%image with no glucose option 2
threeT3_no_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\3T3\3T3_NoGlucose_2.tif');
% adjusting the I_no_g image
threeT3_j_no_g2 = imadjust(threeT3_no_g2,[0 adjustment],[]);
%image processing the I_no_g image
threeT3_no_g_p2 = ImageProcessing(threeT3_j_no_g2,0.02);

% background/control image with the intencity adjustment
threeT3_control = imread('C:\Users\Yael\Desktop\final project\Image processing\3T3\3T3Control.tif');
% adjusting the background/control image
threeT3_j_control = imadjust(threeT3_control,[0 adjustment],[]);

figure;
subplot(2,2,1), imshow(threeT3_no_g_p1)
title('3T3_no_g_p1')
subplot(2,2,2), imshow(threeT3_j_no_g1)
title('3T3_no_g1')
subplot(2,2,3), imshow(threeT3_no_g_p2)
title('3T3_j_no_g_p2')
subplot(2,2,4), imshow(threeT3_j_no_g2)
title('3T3_no_g2')



%chacking te intensity of cell with no glo option 1
intensity_3T3_no_g1 = Intensity(threeT3_j_no_g1, threeT3_j_control, threeT3_no_g_p1)

%chacking te intensity of cell with no glo option 2
intensity_3T3_no_g2 = Intensity(threeT3_j_no_g2, threeT3_j_control, threeT3_no_g_p2)


T({'3T3'},{'Intensity -without glucose 1'}) = intensity_threeT3_no_g1;
T({'3T3'},{'Intensity -without glucose 2'}) = intensity_threeT3_no_g2;
%% 4T1 with glucose %% 
adjustment=0.006;
% background/control image with the intencity adjustment
fourT1_control = imread('C:\Users\Yael\Desktop\final project\Image processing\4T1\4T1 control.tif');
% adjusting the background/control image
fourT1_j_control = imadjust(fourT1_control,[0 adjustment],[]);

%image with glucose option 1
fourT1_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\4T1\4T1 Glucose 1.tif');
% adjusting the I_g image
fourT1_j_g1 = imadjust(fourT1_g1,[0 adjustment],[]);
%image processing the I_g image
fourT1_g_p1 = ImageProcessing(fourT1_j_g1,0.012);

%image with glucose option 2
fourT1_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\4T1\4T1 Glucose 2.tif');
% adjusting the I_g image
fourT1_j_g2 = imadjust(fourT1_g2,[0 adjustment],[]);
%image processing the J_g image
fourT1_g_p2 = ImageProcessing(fourT1_j_g2,0.018);


% %image with glucose option 3
% %not the best photo so we dont take it in consideration
% fourT1_g3 = imread('C:\Users\Yael\Desktop\final project\Image processing\4T1\4T1 Glucose 3.tif');
% % adjusting the I_g image
% fourT1_j_g3 = imadjust(fourT1_g3,[0 adjustment],[]);
% %image processing the J_g image
% fourT1_g_p3 = ImageProcessing(fourT1_j_g3,0.018);


figure;
subplot(2,2,1), imshow(fourT1_g_p1)
title('4T1_g_p1')
subplot(2,2,2), imshow(fourT1_j_g1)
title('4T1_j_g1')
subplot(2,2,3), imshow(fourT1_g_p2)
title('4T1_g_p2')
subplot(2,2,4), imshow(fourT1_j_g2)
title('4T1_j_g2')
% figure;
% subplot(1,2,1), imshow(fourT1_g_p3)
% title('4T1_g_p3')
% subplot(1,2,2), imshow(fourT1_j_g3)
% title('4T1_j_g3')

%chacking te intensity of cell with glo option 1
intensity_4T1_g1 = Intensity(fourT1_j_g1, fourT1_j_control, fourT1_g_p1)

%chacking te intensity of cell with glo option 2
intensity_4T1_g2 = Intensity(fourT1_j_g2, fourT1_j_control, fourT1_g_p2)

% %chacking te intensity of cell with glo option 3
% intensity_4T1_g3 = Intensity(fourT1_j_g3, fourT1_j_control, fourT1_g_p3)


%% 4T1 with no glucose %%
adjustment=0.008;
% background/control image with the intencity adjustment
fourT1_control = imread('C:\Users\Yael\Desktop\final project\Image processing\4T1\4T1 control.tif');
% adjusting the background/control image
fourT1_j_control = imadjust(fourT1_control,[0 adjustment],[]);

%image with no glucose option 1
fourT1_no_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\4T1\4T1 No Glucose 1.tif');
% adjusting the I_no_g image
fourT1_j_no_g1 = imadjust(fourT1_no_g1,[0 adjustment],[]);
%image processing the I_no_g image
fourT1_no_g_p1 = ImageProcessing(fourT1_j_no_g1,0.015);

%image with no glucose option 2
fourT1_no_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\4T1\4T1 No Glucose 2.tif');
% adjusting the I_no_g image
fourT1_j_no_g2 = imadjust(fourT1_no_g2,[0 adjustment],[]);
%image processing the I_no_g image
fourT1_no_g_p2 = ImageProcessing(fourT1_j_no_g2,0.015);

%image with no glucose option 3
fourT1_no_g3 = imread('C:\Users\Yael\Desktop\final project\Image processing\4T1\4T1 No Glucose 3.tif');
% adjusting the I_no_g image
fourT1_j_no_g3 = imadjust(fourT1_no_g3,[0 adjustment],[]);
%image processing the I_no_g image
fourT1_no_g_p3 = ImageProcessing(fourT1_j_no_g3,0.015);


figure;
subplot(3,2,1), imshow(fourT1_no_g_p1)
title('4T1_no_g_p1')
subplot(3,2,2), imshow(fourT1_j_no_g1)
title('4T1_j_no_g1')
subplot(3,2,3), imshow(fourT1_no_g_p2)
title('4T1_no_g_p2')
subplot(3,2,4), imshow(fourT1_j_no_g2)
title('4T1_j_no_g2')
subplot(3,2,5), imshow(fourT1_no_g_p3)
title('4T1_no_g_p2')
subplot(3,2,6), imshow(fourT1_j_no_g3)
title('4T1_j_no_g2')

%chacking te intensity of cell with no glo option 1
intensity_4T1_no_g1 = Intensity(fourT1_no_g1, fourT1_control, fourT1_no_g_p1)

%chacking te intensity of cell with no glo option 2
intensity_4T1_no_g2 = Intensity(fourT1_no_g2, fourT1_control, fourT1_no_g_p2)

%chacking te intensity of cell with no glo option 3
intensity_4T1_no_g3 = Intensity(fourT1_no_g3, fourT1_control, fourT1_no_g_p3)


%% LNCaP with glucose %% 

% background/control image with the intencity adjustment
LNCaP_control = imread('C:\Users\Yael\Desktop\final project\Image processing\LNCap\LNCap control.tif');
% adjusting the background/control image
LNCaP_j_control = imadjust(LNCaP_control,[0 adjustment],[]);

%image with glucose option 1
LNCaP_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\LNCap\LNCap Glucose 1.tif');
% adjusting the I_g image
LNCaP_j_g1 = imadjust(LNCaP_g1,[0 adjustment],[]);
%image processing the I_g image
LNCaP_g_p1 = ImageProcessing(LNCaP_j_g1,0.015);

%image with glucose option 2
LNCaP_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\LNCap\LNCap Glucose 2.tif');
% adjusting the I_g image
LNCaP_j_g2 = imadjust(LNCaP_g2,[0 adjustment],[]);
%image processing the J_g image
LNCaP_g_p2 = ImageProcessing(LNCaP_j_g2,0.015);

%image with glucose option 3
LNCaP_g3 = imread('C:\Users\Yael\Desktop\final project\Image processing\LNCap\LNCap Glucose 3.tif');
% adjusting the I_g image
LNCaP_j_g3 = imadjust(LNCaP_g3,[0 adjustment],[]);
%image processing the J_g image
LNCaP_g_p3 = ImageProcessing(LNCaP_j_g3,0.015);


figure;
subplot(3,2,1), imshow(LNCaP_g_p1)
title('LNCaP g p1')
subplot(3,2,2), imshow(LNCaP_j_g1)
title('LNCaP j g1')
subplot(3,2,3), imshow(LNCaP_g_p2)
title('LNCaP g p2')
subplot(3,2,4), imshow(LNCaP_j_g2)
title('LNCaP j g2')
subplot(3,2,5), imshow(LNCaP_g_p3)
title('LNCaP g p3')
subplot(3,2,6), imshow(LNCaP_j_g3)
title('LNCaP j g3')

%chacking te intensity of cell with glo option 1
intensity_LNCaP_g1 = Intensity(LNCaP_j_g1, LNCaP_j_control, LNCaP_g_p1)

%chacking te intensity of cell with glo option 2
intensity_LNCaP_g2 = Intensity(LNCaP_j_g2, LNCaP_j_control, LNCaP_g_p2)

%chacking te intensity of cell with glo option 3
intensity_LNCaP_g3 = Intensity(LNCaP_j_g3, LNCaP_j_control, LNCaP_g_p3)


%% LNCaP with no glucose %%

adjustment=0.006;

% background/control image with the intencity adjustment
LNCaP_control = imread('C:\Users\Yael\Desktop\final project\Image processing\LNCap\LNCap control.tif');
% adjusting the background/control image
LNCaP_j_control = imadjust(LNCaP_control,[0 adjustment],[]);

%image with no glucose option 1
LNCaP_no_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\LNCap\LNCap NoGlucose 1.tif');
% adjusting the I_no_g image
LNCaP_j_no_g1 = imadjust(LNCaP_no_g1,[0 adjustment],[]);
%image processing the I_no_g image
LNCaP_no_g_p1 = ImageProcessing(LNCaP_j_no_g1,0.015);

%image with no glucose option 2
LNCaP_no_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\LNCap\LNCap NoGlucose 2.tif');
% adjusting the I_no_g image
LNCaP_j_no_g2 = imadjust(LNCaP_no_g2,[0 adjustment],[]);
%image processing the I_no_g image
LNCaP_no_g_p2 = ImageProcessing(LNCaP_j_no_g2,0.015);

%image with no glucose option 3
LNCaP_no_g3 = imread('C:\Users\Yael\Desktop\final project\Image processing\LNCap\LNCap NoGlucose 3.tif');
% adjusting the I_no_g image
LNCaP_j_no_g3 = imadjust(LNCaP_no_g3,[0 adjustment],[]);
%image processing the I_no_g image
LNCaP_no_g_p3 = ImageProcessing(LNCaP_j_no_g3,0.015);

figure;
subplot(3,2,1), imshow(LNCaP_no_g_p1)
title('LNCaP_no_g_p1')
subplot(3,2,2), imshow(LNCaP_j_no_g1)
title('LNCaP_j_no_g1')
subplot(3,2,3), imshow(LNCaP_no_g_p2)
title('LNCaP_no_g_p2')
subplot(3,2,4), imshow(LNCaP_j_no_g2)
title('LNCaP_j_no_g2')
subplot(3,2,5), imshow(LNCaP_no_g_p3)
title('LNCaP_no_g_p3')
subplot(3,2,6), imshow(LNCaP_j_no_g3)
title('LNCaP_j_no_g3')



%chacking te intensity of cell with no glo option 1
intensity_LNCaP_no_g1 = Intensity(LNCaP_j_no_g1, LNCaP_j_control, LNCaP_no_g_p1)

%chacking te intensity of cell with no glo option 2
intensity_LNCaP_no_g2 = Intensity(LNCaP_j_no_g2, LNCaP_j_control, LNCaP_no_g_p2)

%chacking te intensity of cell with no glo option 3
intensity_LNCaP_no_g3 = Intensity(LNCaP_j_no_g3, LNCaP_j_control, LNCaP_no_g_p3)


%% A431 with glucose %% 

adjustment=0.006;

% background/control image with the intencity adjustment
A431_control = imread('C:\Users\Yael\Desktop\final project\Image processing\A431\A431  Control 1.tif');
% adjusting the background/control image
A431_j_control = imadjust(A431_control,[0 adjustment],[]);

%image with glucose option 1
A431_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\A431\a431Glucose_1.tif');
% adjusting the I_g image
A431_j_g1 = imadjust(A431_g1,[0 adjustment],[]);
%image processing the I_g image
A431_g_p1 = ImageProcessing(A431_j_g1,0.001);

%image with glucose option 2
A431_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\A431\a431Glucose_2.tif');
% adjusting the I_g image
A431_j_g2 = imadjust(A431_g2,[0 adjustment],[]);
%image processing the J_g image
A431_g_p2 = ImageProcessing(A431_j_g2,0.001);


figure;
subplot(2,2,1), imshow(A431_g_p1)
title('A431-g-p1')
subplot(2,2,2), imshow(A431_j_g1)
title('A431-j-g1')
subplot(2,2,3), imshow(A431_g_p2)
title('A431-g-p2')
subplot(2,2,4), imshow(A431_j_g2)
title('A431-j-g2')



%chacking te intensity of cell with glo option 1
intensity_A431_g1 = Intensity(A431_j_g1, A431_j_control, A431_g_p1)

%chacking te intensity of cell with glo option 2
intensity_A431_g2 = Intensity(A431_j_g2, A431_j_control, A431_g_p2)


%% A431 with no glucose %%

adjustment=0.006;

% background/control image with the intencity adjustment
A431_control = imread('C:\Users\Yael\Desktop\final project\Image processing\A431\A431  Control 1.tif');
% adjusting the background/control image
A431_j_control = imadjust(A431_control,[0 adjustment],[]);

%image with no glucose option 1
A431_no_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\A431\a431noGlucose_1.tif');
% adjusting the I_no_g image
A431_j_no_g1 = imadjust(A431_no_g1,[0 adjustment],[]);
%image processing the I_no_g image
A431_no_g_p1 = ImageProcessing(A431_j_no_g1,0.001);

%image with no glucose option 2
A431_no_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\A431\a431noGlucose_2.tif');
% adjusting the I_no_g image
A431_j_no_g2 = imadjust(A431_no_g2,[0 adjustment],[]);
%image processing the I_no_g image
A431_no_g_p2 = ImageProcessing(A431_j_no_g2,0.001);

%image with no glucose option 3
A431_no_g3 = imread('C:\Users\Yael\Desktop\final project\Image processing\A431\a431noGlucose_3.tif');
% adjusting the I_no_g image
A431_j_no_g3 = imadjust(A431_no_g3,[0 adjustment],[]);
%image processing the I_no_g image
A431_no_g_p3 = ImageProcessing(A431_j_no_g3,0.001);

figure;
subplot(3,2,1), imshow(A431_no_g_p1)
title('A431-no-g-p1')
subplot(3,2,2), imshow(A431_j_no_g1)
title('A431-j-no-g1')
subplot(3,2,3), imshow(A431_no_g_p2)
title('A431-no-g-p2')
subplot(3,2,4), imshow(A431_j_no_g2)
title('A431-j-no-g2')
subplot(3,2,5), imshow(A431_no_g_p3)
title('A431-no-g-p3')
subplot(3,2,6), imshow(A431_j_no_g3)
title('A431-j-no-g3')



%chacking te intensity of cell with no glo option 1
intensity_A431_no_g1 = Intensity(A431_j_no_g1, A431_j_control, A431_no_g_p1)

%chacking te intensity of cell with no glo option 2
intensity_A431_no_g2 = Intensity(A431_j_no_g2, A431_j_control, A431_no_g_p2)

%chacking te intensity of cell with no glo option 3
intensity_A431_no_g3 = Intensity(A431_j_no_g3, A431_j_control, A431_no_g_p3)

%% A549 with glucose %% 

% background/control image with the intencity adjustment
A549_control = imread('C:\Users\Yael\Desktop\final project\Image processing\A549\A549 control.tif');
% adjusting the background/control image
A549_j_control = imadjust(A549_control,[0 adjustment],[]);

%image with glucose option 1
A549_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\A549\A549 Glucose 1.tif');
% adjusting the I_g image
A549_j_g1 = imadjust(A549_g1,[0 adjustment],[]);
%image processing the I_g image
A549_g_p1 = ImageProcessing(A549_j_g1,0.01);

%image with glucose option 2
A549_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\A549\A549 Glucose 2.tif');
% adjusting the I_g image
A549_j_g2 = imadjust(A549_g2,[0 adjustment],[]);
%image processing the J_g image
A549_g_p2 = ImageProcessing(A549_j_g2,0.01);

%image with glucose option 3
A549_g3 = imread('C:\Users\Yael\Desktop\final project\Image processing\A549\A549 Glucose 3.tif');
% adjusting the I_g image
A549_j_g3 = imadjust(A549_g3,[0 adjustment],[]);
%image processing the J_g image
A549_g_p3 = ImageProcessing(A549_j_g3,0.01);


figure;
subplot(3,2,1), imshow(A549_g_p1)
title('A549_g_p1')
subplot(3,2,2), imshow(A549_j_g1)
title('A549_j_g1')
subplot(3,2,3), imshow(A549_g_p2)
title('A549_g_p2')
subplot(3,2,4), imshow(A549_j_g2)
title('A549_j_g2')
subplot(3,2,5), imshow(A549_g_p3)
title('A549_g_p3')
subplot(3,2,6), imshow(A549_j_g3)
title('A549_j_g3')

%chacking te intensity of cell with glo option 1
intensity_A549_g1 = Intensity(A549_j_g1, A549_j_control, A549_g_p1)

%chacking te intensity of cell with glo option 2
intensity_A549_g2 = Intensity(A549_j_g2, A549_j_control, A549_g_p2)

%chacking te intensity of cell with glo option 3
intensity_A549_g3 = Intensity(A549_j_g3, A549_j_control, A549_g_p3)
%% A549 with no glucose %%

adjustment=0.006;

% background/control image with the intencity adjustment
A549_control = imread('C:\Users\Yael\Desktop\final project\Image processing\A549\A549 control.tif');
% adjusting the background/control image
A549_j_control = imadjust(A549_control,[0 adjustment],[]);

%image with no glucose option 1
A549_no_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\A549\A549 NoGlucose 1.tif');
% adjusting the I_no_g image
A549_j_no_g1 = imadjust(A549_no_g1,[0 adjustment],[]);
%image processing the I_no_g image
A549_no_g_p1 = ImageProcessing(A549_j_no_g1,0.01);

%image with no glucose option 2
A549_no_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\A549\A549 NoGlucose 2.tif');
% adjusting the I_no_g image
A549_j_no_g2 = imadjust(A549_no_g2,[0 adjustment],[]);
%image processing the I_no_g image
A549_no_g_p2 = ImageProcessing(A549_j_no_g2,0.01);

%image with no glucose option 3
A549_no_g3 = imread('C:\Users\Yael\Desktop\final project\Image processing\A549\A549 NoGlucose 3.tif');
% adjusting the I_no_g image
A549_j_no_g3 = imadjust(A549_no_g3,[0 adjustment],[]);
%image processing the I_no_g image
A549_no_g_p3 = ImageProcessing(A549_j_no_g3,0.01);

figure;
subplot(3,2,1), imshow(A549_no_g_p1)
title('A549-no_g_p1')
subplot(3,2,2), imshow(A549_j_no_g1)
title('A549-j_no_g1')
subplot(3,2,3), imshow(A549_no_g_p2)
title('A549-no_g_p2')
subplot(3,2,4), imshow(A549_j_no_g2)
title('A549-j_no_g2')
subplot(3,2,5), imshow(A549_no_g_p3)
title('A549-no_g_p3')
subplot(3,2,6), imshow(A549_j_no_g3)
title('A549-j_no_g3')



%chacking te intensity of cell with no glo option 1
intensity_A549_no_g1 = Intensity(A549_j_no_g1, A549_j_control, A549_no_g_p1)

%chacking te intensity of cell with no glo option 2
intensity_A549_no_g2 = Intensity(A549_j_no_g2, A549_j_control, A549_no_g_p2)

%chacking te intensity of cell with no glo option 2
intensity_A549_no_g3 = Intensity(A549_j_no_g3, A549_j_control, A549_no_g_p3)

%% B16 with glucose %% 

adjustment=0.006;

% background/control image with the intencity adjustment
B16_control = imread('C:\Users\Yael\Desktop\final project\Image processing\B16\b16control.tif');
% adjusting the background/control image
B16_j_control = imadjust(B16_control,[0 adjustment],[]);

%image with glucose option 1
B16_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\B16\b16glucose_1.tif');
% adjusting the I_g image
B16_j_g1 = imadjust(B16_g1,[0 adjustment],[]);

PSF = fspecial('motion',21,11);
Idouble = im2double(B16_j_g1);
blurred = imfilter(Idouble,PSF,'conv','circular');
imshow(blurred)
title('Blurred Image')

%image processing the I_g image
B16_g_p1 = ImageProcessing(B16_j_g1,0.001);


%image with glucose option 2
B16_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\B16\b16glucose_2.tif');
% adjusting the I_g image
B16_j_g2 = imadjust(B16_g2,[0 adjustment],[]);
%image processing the J_g image
B16_g_p2 = ImageProcessing(B16_j_g2,0.001);

%image with glucose option 3
B16_g3 = imread('C:\Users\Yael\Desktop\final project\Image processing\B16\b16glucose_3.tif');
% adjusting the I_g image
B16_j_g3 = imadjust(B16_g3,[0 adjustment],[]);
%image processing the J_g image
B16_g_p3 = ImageProcessing(B16_j_g3,0.001);


figure;
subplot(3,2,1), imshow(B16_g_p1)
title('B16_g_p1')
subplot(3,2,2), imshow(B16_j_g1)
title('B16_j_g1')
subplot(3,2,3), imshow(B16_g_p2)
title('B16_g_p2')
subplot(3,2,4), imshow(B16_j_g2)
title('B16_j_g2')
subplot(3,2,5), imshow(B16_g_p3)
title('B16_g_p3')
subplot(3,2,6), imshow(B16_j_g3)
title('B16_j_g3')

%chacking te intensity of cell with glo option 1
intensity_B16_g1 = Intensity(B16_j_g1, B16_j_control, B16_g_p1)

%chacking te intensity of cell with glo option 2
intensity_B16_g2 = Intensity(B16_j_g2, B16_j_control, B16_g_p2)

%chacking te intensity of cell with glo option 3
intensity_B16_g3 = Intensity(B16_j_g3, B16_j_control, B16_g_p3)


%% B16 with no glucose %%

adjustment=0.006;

% background/control image with the intencity adjustment
B16_control = imread('C:\Users\Yael\Desktop\final project\Image processing\B16\b16control.tif');
% adjusting the background/control image
B16_j_control = imadjust(B16_control,[0 adjustment],[]);

%image with no glucose option 1
B16_no_g1 = imread('C:\Users\Yael\Desktop\final project\Image processing\B16\b16_NOGLU 1.tif');
% adjusting the I_no_g image
B16_j_no_g1 = imadjust(B16_no_g1,[0 adjustment],[]);
%image processing the I_no_g image
B16_no_g_p1 = ImageProcessing(B16_j_no_g1,-0.01);

%image with no glucose option 2
B16_no_g2 = imread('C:\Users\Yael\Desktop\final project\Image processing\B16\b16_NOGLU 2.tif');
% adjusting the I_no_g image
B16_j_no_g2 = imadjust(B16_no_g2,[0 adjustment],[]);
%image processing the I_no_g image
B16_no_g_p2 = ImageProcessing(B16_j_no_g2,0.012);


figure;
subplot(2,2,1), imshow(B16_no_g_p1)
title('B16_no_g_p1')
subplot(2,2,2), imshow(B16_j_no_g1)
title('B16_j_no_g1')
subplot(2,2,3), imshow(B16_no_g_p2)
title('B16_no_g_p2')
subplot(2,2,4), imshow(B16_j_no_g2)
title('B16_j_no_g2')



%chacking te intensity of cell with no glo option 1
intensity_B16_no_g1 = Intensity(B16_j_no_g1, B16_j_control, B16_no_g_p1)

%chacking te intensity of cell with no glo option 2
intensity_B16_no_g2 = Intensity(B16_j_no_g2, B16_j_control, B16_no_g_p2)

