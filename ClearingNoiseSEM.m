clc
clear

num = 9;
filename_start = sprintf('s3_ss_00%d.tif', num);
I = imread(filename_start);

J = imadjust(I);
imshowpair(I,J,'montage')

figure
subplot(1,2,1)
imhist(I,64)
subplot(1,2,2)
imhist(J,64)

len_y = numel(I(1:end, 1));
len_x = numel(I(1, 1:end));

coords_x = 1:1:len_x;
coords_y = 1:1:len_y;
[coords_map_x, coords_map_y] = meshgrid(coords_x, coords_y);

plot3(coords_map_x, coords_map_y, I)
contourf(coords_map_x, coords_map_y, J, 100, 'LineStyle', 'none');