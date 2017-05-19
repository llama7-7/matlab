function img2 = My_invdist(img)
    [height, width, channel] = size(img);

    img2 = zeros(height, width, channel);
    halfSize = 1;
    iter = 0;
    
    while 1
        iter = iter + 1;
        failNum = 0;
        for k = 1:channel
            for i = 1:height
                for j = 1:width
                    if img(i,j,k) > 0.01
                        img2(i,j,k) = img(i,j,k);
                        continue;
                    end
                    total_value = 0;
                    total_dist = 0;
                    pixel = 0;
                    for ii = -halfSize:halfSize
                        for jj = -halfSize:halfSize
                            if i+ii>=1 && i+ii<=height && j+jj>=1 && j+jj<=width && img(i+ii,j+jj,k) > 0.01
                                pixel = pixel + 1;
                                dist = sqrt(ii*ii+jj*jj);
                                value = 1.0 * img(i+ii,j+jj,k) / (dist*dist);
                                total_value = total_value + value;
                                total_dist = total_dist + 1.0 / (dist*dist);
                            end
                        end
                    end
                    if pixel < 3
                        failNum = failNum + 1;
                        img2(i,j,k) = 0;
                    else
                        img2(i,j,k) = total_value / total_dist;
                    end
                end
            end
        end
        [iter, failNum]
        if failNum == 0
            break;
        else
            img = img2;
            if iter == 10
                halfSize = 2;
            elseif iter == 20
                halfSize = 3;
            end
        end
    end

end