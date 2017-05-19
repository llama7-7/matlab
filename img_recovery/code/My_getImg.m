function img = My_getImg(path)
    img = imread(path);
    img = im2double(img);
end