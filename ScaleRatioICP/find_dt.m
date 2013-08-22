function [ dtnew,dist ] = find_dt( dataset1, dataset2, dt )
%CALCOSTFUNCTION ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q
%   dataset1 = [w cwd]
%   dataset2 = [w cwd]
%   dt is: delta(��) t
%   dt = sum{sum{w_i*w_i^'}}/sum{sum{w_i*w_i}}

    % find bundlary
    dataset2prim = dataset2;
    dataset2prim(:,1) = dataset2prim(:,1) * dt;
    [newdata1, newdata2, oridata1, oridata2] = setbundlary(dataset1, dataset2, dataset2prim);

    if size(newdata1,1)<=1 || size(newdata2,1) <= 1
        dtnew = -1;
        return;
    end
    
    % find corresponded datasets
    [corresdata1, corresdata2,oricorresdata1, oricorresdata2,dist] = getcorresdatas2(newdata1, newdata2, oridata1, oridata2);
        
    dtnew_d = 0;
    dtnew_n = 0;
    for i = 1:size(oricorresdata1,1)  %rows
         %dtnew_d = dtnew_d + oricorresdata1(i, 1)*oricorresdata2(i,1);
         %dtnew_n = dtnew_n + oricorresdata2(i, 1)^2;
         dtnew_d = dtnew_d + oricorresdata1(i, 1)*oricorresdata2(i,1);
         dtnew_n = dtnew_n + oricorresdata2(i, 1)^2;
    end
    dtnew = dtnew_d/dtnew_n;
end
