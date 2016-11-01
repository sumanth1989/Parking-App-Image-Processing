clc
clear
%% Get Image and Display
Image = imread('Parking_lot.png');

Segregated_Image = Image;

%% Determine first 5 parking spots
%imtool('Parking_lot.png')

Parking_slot_1 = Image(153:184,260:310,:);
Parking_slot_2 = Image(187:218,260:310,:);
Parking_slot_3 = Image(220:251,260:310,:);
Parking_slot_4 = Image(253:284,260:310,:);
Parking_slot_5 = Image(286:317,260:310,:);

%% Determine reference for an open slot and set threshold for detection
Drive_way = Image(148,340,:);
Drive_way_R = Drive_way(:,:,1);
Drive_way_G = Drive_way(:,:,2);
Drive_way_B = Drive_way(:,:,3);
Threshold = sum(Drive_way(:))*31*50;

%% Convert Images to R G B
Parking_slot_1_R = Parking_slot_1(:,:,1);
Parking_slot_2_R = Parking_slot_2(:,:,1);
Parking_slot_3_R = Parking_slot_3(:,:,1);
Parking_slot_4_R = Parking_slot_4(:,:,1);
Parking_slot_5_R = Parking_slot_5(:,:,1);
Parking_slot_1_G = Parking_slot_1(:,:,2);
Parking_slot_2_G = Parking_slot_2(:,:,2);
Parking_slot_3_G = Parking_slot_3(:,:,2);
Parking_slot_4_G = Parking_slot_4(:,:,2);   
Parking_slot_5_G = Parking_slot_5(:,:,2);
Parking_slot_1_B = Parking_slot_1(:,:,3);
Parking_slot_2_B = Parking_slot_2(:,:,3);
Parking_slot_3_B = Parking_slot_3(:,:,3);
Parking_slot_4_B = Parking_slot_4(:,:,3);
Parking_slot_5_B = Parking_slot_5(:,:,3);

%% Calculate sum of pixel valuesfor each slot
Parking_slot_1_sum = (sum(Parking_slot_1_R(:)) + sum(Parking_slot_1_G(:)) + sum(Parking_slot_1_B(:)));
Parking_slot_2_sum = (sum(Parking_slot_2_R(:)) + sum(Parking_slot_2_G(:)) + sum(Parking_slot_2_B(:)));
Parking_slot_3_sum = (sum(Parking_slot_3_R(:)) + sum(Parking_slot_3_G(:)) + sum(Parking_slot_3_B(:)));
Parking_slot_4_sum = (sum(Parking_slot_4_R(:)) + sum(Parking_slot_4_G(:)) + sum(Parking_slot_4_B(:)));
Parking_slot_5_sum = (sum(Parking_slot_5_R(:)) + sum(Parking_slot_5_G(:)) + sum(Parking_slot_5_B(:)));

%% Distinguish vacant/ occupied slot based on calculated threshold
if Parking_slot_1_sum <= Threshold
    Segregated_Image(153:184,260:310,:) = 0;
else
    Segregated_Image(153:184,260:310,:) = 255;
end

if Parking_slot_2_sum <= Threshold
    Segregated_Image(187:218,260:310,:) = 0;
else
    Segregated_Image(187:218,260:310,:) = 255;
end

if Parking_slot_3_sum <= Threshold
    Segregated_Image(220:251,260:310,:) = 0;
else
    Segregated_Image(220:251,260:310,:) = 255;
end

if Parking_slot_4_sum <= Threshold
    Segregated_Image(253:284,260:310,:) = 0;
else
    Segregated_Image(253:284,260:310,:) = 255;
end

if Parking_slot_5_sum <= Threshold
    Segregated_Image(286:317,260:310,:) = 0;
else
    Segregated_Image(286:317,260:310,:) = 255;
end

%% Display segregated image

figure(2)
imshow(Img)
title(' Segregated Parking lot')

