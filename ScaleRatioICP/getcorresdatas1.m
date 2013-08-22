function [corresdata1, corresdata2, oricorresdata1, oricorresdata2, dist] = getcorresdatas1(input1, input2, oridata1, oridata2)
        [result, ndists] = corresponding(input1, input2);
        corresdata1 = [];
        oricorresdata1 = [];
        oricorresdata2 = [];
        corresdata2 = [];
        dist = 0;

        threshhold = (max(ndists(1,:)) - min(ndists(1,:)))*0.88;
        for i = 1: size(result,2)
                corresdata1 = [corresdata1; input1(result(1,i),:)];
                corresdata2 = [corresdata2; input2(i,:)];
                oricorresdata1 = [oricorresdata1; oridata1(result(1,i),:)];
                oricorresdata2 = [oricorresdata2; oridata2(i,:)];
                dist = dist + ndists(1,i);
        end


end