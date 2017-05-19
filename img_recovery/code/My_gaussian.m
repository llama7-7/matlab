function img2 = My_gaussian(img,mask)
    [height, width, channel] = size(img);
    img2 = zeros(height, width, channel);
    for k = 1:channel
        for i = 1:height
            for j = 1:width
                if mask(i,j,k) ~= 1
                    number = 0;
                    for ii = -1:1
                        for jj = -1:1
                            if i+ii>=1 && i+ii<=height && j+jj>=1 && j+jj<=width && abs(ii)+abs(jj)<2
                                img2(i,j,k) = img2(i,j,k) + img(i+ii,j+jj,k);
                                number = number + 1;
                            end
                        end
                    end
                    img2(i,j,k) = img2(i,j,k) / number;
                else
                    img2(i,j,k) = img(i,j,k);
                end
            end
        end
    end
end