clc
clear

% num = 1;
% filename_start = sprintf('pic%d.jpg', num);
filename_start = ('x5_sample10.jpg');
uint8 = imread(filename_start);
RGB = im2double(uint8);

subplot(2,3,1)
Gray = rgb2gray(RGB);
level = Gray(1:end,200);
imshow(Gray)


c = numel(Gray(1:end,1));
r = numel(Gray(1,1:end));

subplot(2,3,2)
plot(level)
grid on
hold on

Gray_row = [];
corr_index = 0.3;
for i = 1 : r
   if Gray(1:end, i) > corr_index
       Gray_row = [Gray_row, Gray(1:end, i)];
   end
end 
M = mean(Gray_row, 2);
min_M = min(M);
M_corr = M - min_M;
plot(M_corr)
plot(M)

min_lev = min(level);
level_corr = level - min_lev;
plot(level_corr)

Gray_clear1 = zeros(c, r);
Gray_clear2 = zeros(c, r);
Gray_clear3 = zeros(c, r);
Gray_clear4 = zeros(c, r);

for i = 1 : c
   for j =  1 : r
      Gray_clear2(i, j) = Gray(i, j) - level_corr(i);
      Gray_clear1(i, j) = Gray(i, j) - level(i);
      Gray_clear3(i, j) = Gray(i, j) - M(i);
      Gray_clear4(i, j) = Gray(i, j) - M_corr(i);
   end
end
subplot(2,3,3)
imshow(Gray_clear1)

subplot(2,3,4)
imshow(Gray_clear2)

subplot(2,3,5)
imshow(Gray_clear3)

subplot(2,3,6)
Brightness = 0.1;
Gray_clear4 = Gray_clear4 + Brightness;
imshow(Gray_clear4)
% filename_end = sprintf('pic%d_correct.jpg', num);
filename_end = ('x5_sample10_corrected.jpg');
imwrite(Gray_clear4, filename_end);
