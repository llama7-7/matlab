function img2 = My_kriging(img)
    [height, width, channel] = size(img);
    
    img2 = zeros(height, width, channel);
    multi = zeros(height, width, channel);
    blockSize = 12;

    for k = 1:channel
        for i = 1:blockSize/3:height
            i
            for j = 1:blockSize/3:width

                top = i;
                if i+blockSize-1 > height
                    bottom = height;
                else
                    bottom = i + blockSize - 1;
                end
                left = j;
                if j+blockSize-1 > width
                    right = width;
                else
                    right = j + blockSize - 1;
                end
                [X, Y] = meshgrid(left:right, top:bottom);

                num = 0;
                for ii = top:bottom
                    for jj = left:right
                        if img(ii,jj,k) > 0.01
                            num = num + 1;
                            x(num,1) = jj;
                            y(num,1) = ii;
                            z(num,1) = img(ii,jj,k);
                        end
                    end
                end

                v = variogram([x y],z,'plotit',false);
                [dum,dum,dum,vstruct] = variogramfit(v.distance,v.val,[],[],[],'plotit',false);
                [Zhat, Zvar] = kriging(vstruct, x, y, z, X, Y);

                for ii = top:bottom
                    for jj = left:right
                        img2(ii, jj, k) = img2(ii, jj, k) + Zhat(ii-top+1, jj-left+1);
                        multi(ii, jj, k) = multi(ii, jj, k) + 1;
                    end
                end

            end

            imshow(img2);
        end
    end
    
    img2 = img2 ./ multi;
end