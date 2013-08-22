function [return_dataset1, return_dataset2, oridata1, oridata2 ] = setbundlary( dataset1, dataset2, dataset3)
%set appropriate bundlary for two sets of curves, make sure they have the
%same dimension

    oridata1 = dataset1;
    oridata2 = dataset2;

    newdata1 = dataset1;
    newdata2 = dataset3;
    
     v=[];
    for i = size(newdata1,1):-1:2
        if newdata1(i,1) - newdata2(size(newdata2,1),1)>1e-10 ...
                && newdata1(i-1,1) - newdata2(size(newdata2,1),1) >= 1e-10
            v=[v; i];
        end
    end
    newdata1(v,:) = [];
    oridata1(v,:) = [];
    
    v=[];
    for i = size(newdata2,1):-1:2
        if newdata2(i,1) - newdata1(size(newdata1,1),1)>1e-10 ...
                && newdata2(i-1,1) - newdata1(size(newdata1,1),1) >= 1e-10
            v=[v; i];
        end
    end
    newdata2(v,:) = [];
    oridata2(v,:) = [];
    
    v=[];
    for i = 1:(size(newdata2,1)-1)
        if newdata2(i,1) - newdata1(1,1) < -1e-10...
                && newdata2(i+1,1) - newdata1(1,1) <= -1e-10
            v=[v; i];
        end
    end
    newdata2(v,:) = [];
    oridata2(v,:) = [];
    
    v=[];
    for i = 1:(size(newdata1,1)-1)
        if newdata1(i,1) - newdata2(1,1) < -1e-10...
                && newdata1(i+1,1) - newdata2(1,1) <= -1e-10
            v=[v; i];
        end
    end
    newdata1(v,:) = [];
    oridata1(v,:) = [];
    %disp('data1.width:'); disp(size(newdata1,1));
    %disp('data2.width:'); disp(size(newdata2,1));
    return_dataset1 = newdata1;
    return_dataset2 = newdata2;
    
    if size(newdata1,1)/size(dataset1,1) <= 0.5
        oridata1 = dataset1;
        oridata2 = dataset2*100;

        return_dataset1 = dataset1*1000;
        return_dataset2 = dataset3;
        return;
    end
end

