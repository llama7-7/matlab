function img2 = My_regression(img)
    [height, width, channel] = size(img);
    
    img2 = zeros(height, width, channel);
    halfSize = 1;
    leastEquation = 6;
    iter = 0;
    
    while 1
        iter = iter + 1;
        failNum = 0;
        for k = 1:channel
            for i = 1:height
                for j = 1:width
                    % good point
                    if img(i,j,k) > 0.01
                        img2(i,j,k) = img(i,j,k);
                        continue;
                    end
                    % bad point
                    number = 0;
                    pixel = 0;
                    for ii = -halfSize:halfSize
                        for jj = -halfSize:halfSize
                            if i+ii>=1 && i+ii<=height && j+jj>=1 && j+jj<=width
                                pixel = pixel + 1;
                                if img(i+ii,j+jj,k) ~= 0
                                    number = number + 1;
                                    A(number, 1) = i+ii;
                                    A(number, 2) = j+jj;
                                    A(number, 3) = 1;
                                    b(number, 1) = img(i+ii,j+jj,k);
                                end
                            end
                        end
                    end
                    if (pixel <= 4 && number >= 3) || (pixel <= 6 && number >= 4) || number >= leastEquation     % corner, edge and middle
                        coeff = inv(A'*A)*A'*b;
                        img2(i,j,k) = 1.0*i*coeff(1,1) + 1.0*j*coeff(2,1) + coeff(3,1);
                    else
                        failNum = failNum + 1;
                        img2(i,j,k) = 0;
                    end
                end
            end
        end
        [iter, failNum]
        if failNum == 0
            break;
        else
            img = img2;
            if iter == 5
                leastEquation = 5;
            elseif iter == 10
                leastEquation = 4;
            elseif iter == 20
                halfSize = 2;
                leastEquation = 6;
            elseif iter == 30
                leastEquation = 5;
            elseif iter == 40
                leastEquation = 4;
            end
        end
    end
end