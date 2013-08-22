function [result, ndists] = corresponding(input1, input2)
% search nearest data of input2 from input1. the output should be same size
% of input2
% input1 : m x d, m data with d dimention
% input2 : n x d, n data with d dimention
% result : 2 x n, with the index of corresponded input1
% ndists : 2 x n, with the distance of corresponded input1
    result = [];
    ndists = [];
    for i = 1 : size(input2, 1)
        minnum = 10e10;
        subminnum = 10e10;
        minind = 0;
        subminind = 0;
        for j = 1 : size(input1, 1)
            tmpnum = norm(input1(j, :) - input2(i, :));
            if tmpnum < minnum
                minnum = tmpnum;
                minind = j;   
            end
            if tmpnum >= minnum && tmpnum < subminnum
                subminnum = tmpnum;
                subminind = j;
            end
        end
        result = [result [minind; subminind]];
        ndists = [ndists [minnum; subminnum]];
    end
end