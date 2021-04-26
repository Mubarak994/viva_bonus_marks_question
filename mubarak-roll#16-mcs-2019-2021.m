clc;

% folowing commented code is for manual pic selecion

% [filename, folder] = uigetfile ({'*.jpg';'*.bmp';'*.png'}, 'File Selector'); 
% fullFileName = fullfile(folder, filename); 
% img = imread(fullFileName); 

% this following image is hard coded
img= imread('mubarak.jpg');
iter = 10;
FaceDetect = vision.CascadeObjectDetector; 
FaceDetect.MergeThreshold = 7 ;
BB = step(FaceDetect, img); 
figure(1);
imshow(img)
for i = 1 : size(BB,1)     
  rectangle('Position', BB(i,:), 'LineWidth', 2, 'LineStyle', '-', 'EdgeColor', 'r'); 
end 

for i = 1 : size(BB, 1) 
  J = imcrop(img, BB(i, :)); 
J= imresize(J, [400,400]);
J= im2double(J);
A = J;
B = A+1;
D = B - A;
D = D./iter;

for k=1:iter
   A = A + D;
 figure(2);
    imshow(A);
    
end

end
 

