clc
clear
%% Define Video Grabber Object
Vid = HebiCam('http://construction1.db.erau.edu/mjpg/video.mjpg');
while (true)
    %% Grab image at 2 second intervals and display
    img_zero = getsnapshot(Vid);
    pause(2);
    img_two = getsnapshot(Vid);
    figure();
    imshow(img_zero);
    %% Segregate image into specific parking spots
    
    
end
