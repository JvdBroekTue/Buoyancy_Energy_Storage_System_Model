function output = Get_ocean_speed
    load('C:\Users\20212052\OneDrive - TU Eindhoven\Documents\Studie\Bach year 2\Q1\Modeling of time-dependent systems (4GB00)\Model\Matlab files\V9\aug97u.mat');
    % input datapath to data
    length = size(taug,1);
    startday = 0;
    day = 1;
    seconds = 86400;                            % Total seconds in a day
    f_0 = 10000;                                % base frequency of adcp equipment
    s_w = 1480;                                 % speed of sound thorough water
    
    for i = 1:length
        time(i-startday, day) = (taug(i) - fix(taug(i,1)))*seconds;
        data(i-startday, day) =  aug97u(i,16)*s_w/f_0;
        if i~=length
            if fix(taug(i,1)) ~= fix(taug(i+1,1))
                startday = i;
                day = day+1;
            end
        end
    end

    y = mean(data, 2, 'omitnan');
    y = smoothdata(y,'lowess',100);
    y = interpolate(y,60);
    output = y;
end
