clc
clear

%% Get feed from camera
empty = imread('Measured_lot_day.png');
cars =imread('Measured_lot_with_cars.png');

%% Convert and enhance image 
empty = rgb2gray(empty);
cars = rgb2gray(cars);
empty = imadjust(empty);
cars = imadjust(cars);
% cars = imadjust(cars, ,[0.2 ; 0.4], []);
SE = strel('square',5);
cars = imerode(cars,SE);
figure(1)
subplot(2,1,1),imshow(empty),title('Empty Parkinglot')
subplot(2,1,2),imshow(cars),title('Filled Parkinglot')

%% Process image based on thresholding

thresh = multithresh(cars,2);
segmented_image = imquantize(cars,thresh);
converted_rgb_image = label2rgb(segmented_image);
%rgb = rgb - empty;
figure(2),imshow(converted_rgb_image)
