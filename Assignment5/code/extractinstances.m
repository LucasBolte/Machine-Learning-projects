function [segement] = extractinstances(img)

width = 30;
img_seg = im_meanshift(img,width);
b = max(max(img_seg));
a = img_seg/b;
imshow(a);
seg_num = length(unique(img_seg));
segement = zeros(seg_num,3);

red = img(:,:,1);
blue = img(:,:,2);
green = img(:,:,3);

for i=1:seg_num
    target = (img_seg==i);
    red_pix = red(target==1);
    red_av  = sum(red_pix)/length(red_pix);
    
    blue_pix = blue(target==1);
    blue_av  = sum(blue_pix)/length(blue_pix);
    
    green_pix = green(target==1);
    green_av  = sum(green_pix)/length(green_pix);
    
    segement(i,1) = red_av;
    segement(i,2) = blue_av;
    segement(i,3) = green_av;
end
end

