function [Intensity] = Intensity(cell_image_j, background_image_j, BWfinal)
sum=0;
num_of_pix=0;
sum_b=0;
num_of_pix_b=0;
meanGrayLevel_back = mean2(background_image_j);

%for calculating the background intensity
for i=1:length(cell_image_j(:,1))
    for j=1:length(cell_image_j(1,:))
        if BWfinal(i,j)==0
            sum_b=sum_b+double(cell_image_j(i,j));
            num_of_pix_b=num_of_pix_b+1;
        end
        
    end
end
%for calculating the cell intensity
for i=1:length(cell_image_j(:,1))
    for j=1:length(cell_image_j(1,:))
        if BWfinal(i,j)==1
            sum=sum+double(cell_image_j(i,j));
            num_of_pix=num_of_pix+1;
        end
        
    end
end
mean_2 = sum/num_of_pix;
mean_b = sum_b/num_of_pix_b;
%Intensity = (mean_2 - meanGrayLevel_back)/mean_2;
Intensity = (mean_2 - mean_b)/mean_2;
end