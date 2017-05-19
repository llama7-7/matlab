function mask = My_getMask(img)
    [height, width, channel] = size(img);
    mask = zeros(height, width, channel);
    for k = 1:channel
        for i = 1:height
            for j = 1:width
                if img(i,j,k) > 0.01
                    mask(i,j,k) = 1;
                end
            end
        end
    end
end