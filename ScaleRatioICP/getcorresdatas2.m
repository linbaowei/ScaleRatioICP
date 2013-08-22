function [corresdata1, corresdata2, oricorresdata1, oricorresdata2, dist] = getcorresdatas2(input1, input2, oridata1, oridata2)
    if size(input1,1) == max(size(input1,1), size(input2,1))
        [result, ndists] = corresponding(input2, input1);
        corresdata1 = [];
        oricorresdata1 = [];
        corresdata2 = [];
        oricorresdata2 = [];
        dist = 0;
        for i = 1: size(result,2)
            if(ndists(2,i) > 0.6*ndists(1, i))
                corresdata2 = [corresdata2; input2(result(1,i),:)];
                oricorresdata2 = [oricorresdata2; oridata2(result(1,i),:)];
                
                corresdata1 = [corresdata1; input1(i,:)];
                oricorresdata1 = [oricorresdata1; oridata1(i,:)];
                dist = dist + ndists(1,i);
            end
        end
    end
    
    if size(input2,1) == max(size(input1,1), size(input2,1))
        [result, ndists] = corresponding(input1, input2);
        corresdata1 = [];
        oricorresdata1 = [];
        oricorresdata2 = [];
        corresdata2 = [];
        dist = 0;
        for i = 1: size(result,2)
            if(ndists(2,i) > 0.6*ndists(1, i))
                corresdata1 = [corresdata1; input1(result(1,i),:)];
                oricorresdata1 = [oricorresdata1; oridata1(result(1,i),:)];
                
                corresdata2 = [corresdata2; input2(i,:)];
                oricorresdata2 = [oricorresdata2; oridata2(i,:)];
                dist = dist + ndists(1,i);
            end
        end
    end
    
%     disp('corresponded datasets size:');
%     size(corresdata1,1)
%     size(corresdata2,1)
end