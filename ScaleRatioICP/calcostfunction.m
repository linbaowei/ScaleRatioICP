function [ sumresult] = calcostfunction( dataset1, dataset2, dt, state )
%CALCOSTFUNCTION この関数の概要をここに記述
%   詳細説明をここに記述
%   dataset1 = [w cwd]
%   dataset2 = [w cwd]
%   dt is: delta(Δ) t
%   cost function is: sum{sum{(y_i^d-x_i^d)^2 + (w_i^' - w_i * dt)^2}}

    % find bundlary
    dataset2prim = dataset2;
    dataset2prim(:,1) = dataset2prim(:,1) * dt;
    [newdata1, newdata2, oridata1, oridata2] = setbundlary(dataset1, dataset2, dataset2prim);

    if size(newdata1,1)<=1 || size(newdata2,1) <= 1
        sumresult = 10e+10;
        return;
    end
    
    % find corresponded datasets
    [corresdata1, corresdata2,oricorresdata1, oricorresdata2, dist] = getcorresdatas1(newdata1, newdata2, oridata1, oridata2);
    
    sumresult = dist;
%     sumresult = 0;
%     for i = 1:size(oricorresdata1,1)  %rows
%         for j = 1:(size(corresdata1,2)-1)  %cols - 1
%             %sumresult= sumresult + (corresdata2(i,j+1)*state - corresdata1(i, j+1)*state)^2 + (corresdata2(i,1)-corresdata1(i,1))^2; 
%         sumresult= sumresult + (oricorresdata2(i,j+1) - oricorresdata1(i, j+1))^2 + (oricorresdata2(i,1)*state-oricorresdata1(i,1)*state)^2; 
%         end
%     end
end

