function res = My_test(img, img2)
    res = norm(img(:)-img2(:), 2);
%     diff = img - img2;
%     diff = diff.*diff;
%     res = sum(diff(:));
%     res = sqrt(res);
end