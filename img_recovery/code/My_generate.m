function My_generate(img, rate, name)
    [height, width, channel] = size(img);
    img2 = img;
    for k = 1:channel
        for i = 1:height
            for j = 1:width
                if rand() < rate
                    img2(i,j,k) = 0;
                end
            end
        end
    end
    imwrite(img2, name);
end