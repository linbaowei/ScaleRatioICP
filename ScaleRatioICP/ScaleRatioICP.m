
function ScaleRatioICP(file1, file2, iterNum)
    disp('calculation begin!');
    format long;

    cdw1 = load(file1);
    cdw2 = load(file2);
    
    v = [];
    for i = 1 : size(cdw1,1)
        tmpnum = 0;
        for j = 1:size(cdw1,2)-1
            tmpnum = tmpnum + abs(cdw1(i,j+1)-1);
        end
        if tmpnum < 1e-1
            v = [v ; i];
        end
    end
    cdw1(v,:) = [];

    v = [];
    for i = 1 : size(cdw2,1)
        tmpnum = 0;
        for j = 1:size(cdw2,2)-1
            tmpnum = tmpnum + abs(cdw2(i,j+1)-1);
        end
        if tmpnum < 1e-1
            v= [v;i];
        end
    end
    cdw2(v,:) = [];
    %------------
    %initial dt
    %------------
    init_t = [];
    if cdw1(1,1)/cdw2(1,1) >= 1
        for i = 1: 0.1: 10 %i is delta t
            [costresult] = calcostfunction2(cdw1, cdw2, i, 1);
            init_t = [init_t [i; costresult]];
        end
    end
    if cdw1(1,1)/cdw2(1,1) < 1
        for i = 0: 0.01: 1 %i is delta t
            [costresult] = calcostfunction2(cdw1, cdw2, i, 1);
            init_t = [init_t [i; costresult]];
        end
    end


    % find minimization value of init ts, and return the index
    [value, ind] = min(init_t(2,:), [], 2)

    % find delta t for next icp
    initt = init_t(1,ind);
    initvalude = init_t(2,ind);
    % dt_for_icp = init_t(3, ind);


    % -------------------------
    % Scale Ratio ICP begin
    % -------------------------
    iteration = iterNum;
    eps = 1e-3;
    dtnewicp = 1;
    finialratio = initt;

    for i = 1:iteration
        [dtnewicp, dist] = find_dt(cdw1, cdw2, finialratio);
        %     finialratio = initt*dt_for_icp*dtnewicp;
        %if dist <= initvalude
        finialratio = dtnewicp;
        %end
        if abs(dtnewicp + 1) < 1e-10
            disp('new dt is -1, system exit!!');
            return;
        end
        str = sprintf('iter %d\tinitial t is: %0.3f.', i, initt);
        disp(str);
        str = sprintf('\t\tnew delta t is: %0.3f.', dtnewicp);
        disp(str);
        
    end
    str = sprintf('Finial Ratio t is: %0.3f', finialratio);
    disp(str);
    
    disp('calculation finish!');

end