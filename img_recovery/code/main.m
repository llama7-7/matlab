clear; clc;

mode = 3;   % 1, 2, 3, 4
file = 'C'; % 'A', 'B', 'C', 'D'
rate = 0.6; % 0.4, 0.6, 0.8
debug = 0;  % 0, 1

%% generate noise img

if mode == 1 && debug == 1
    imgR = My_getImg(['img/',file,'.png']);
    My_generate(imgR, rate, ['img/',file,'_',num2str(rate),'.png']);
end


%% regression method with gaussian

if mode == 2
    % initialize
  if debug == 1
    imgR = My_getImg(['img/',file,'.png']);
  end
    imgN = My_getImg(['img/',file,'_',num2str(rate),'.png']);
    mask = My_getMask(imgN);
    % regression
    img_regression = My_regression(imgN);
  if debug == 1
    imwrite(img_regression, ['img/',file,'_',num2str(rate),'_regression.png']);
    My_test(imgR, img_regression)
  end
    % gaussian
    img_gauss = img_regression;
    for i = 1:40
        img_gauss = My_gaussian(img_gauss, mask);
    end
    imwrite(img_gauss, ['img/',file,'_',num2str(rate),'_regression_gauss.png']);
  if debug == 1
    My_test(imgR, img_gauss)
  end
end


%% inverse distance with gaussian

if mode == 3
    % initialize
  if debug
    imgR = My_getImg(['img/',file,'.png']);
  end
    imgN = My_getImg(['img/',file,'_',num2str(rate),'.png']);
    mask = My_getMask(imgN);
    % inverse distance
    img_invdist = My_invdist(imgN);
  if debug
    imwrite(img_invdist, ['img/',file,'_',num2str(rate),'_invdist.png']);
    My_test(imgR, img_invdist)
  end
    % gaussian
    img_gauss = img_invdist;
    for i = 1:40
        img_gauss = My_gaussian(img_gauss, mask);
    end
    imwrite(img_gauss, ['img/',file,'_',num2str(rate),'_invdist_gauss.png']);
  if debug
    My_test(imgR, img_gauss)
  end
end


%% kriging

if mode == 4
    % initialize
  if debug
    imgR = My_getImg(['img/',file,'.png']);
  end
    imgN = My_getImg(['img/',file,'_',num2str(rate),'.png']);
    mask = My_getMask(imgN);
    % kriging
    img_kriging = My_kriging(imgN);
  if debug
    imwrite(img_kriging, ['img/',file,'_',num2str(rate),'_kriging.png']);
    My_test(imgR, img_kriging)
  end
    % gaussian
    img_gauss = img_kriging;
    for i = 1:40
        img_gauss = My_gaussian(img_gauss, mask);
    end
    imwrite(img_gauss, ['img/',file,'_',num2str(rate),'_kriging_gauss.png']);
  if debug
    My_test(imgR, img_gauss)
  end
end