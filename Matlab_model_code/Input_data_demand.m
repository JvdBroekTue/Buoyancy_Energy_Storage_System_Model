function output = Input_data_demand 
    %Generate array in units of watts for charing 3 boats in 2 days
    %Each boat has a capacity of 7 MWh and will be charged in 2 hours
    y = zeros(1440*60,1);
    y(181*60:300*60) = 1;
    y(1141*60:1260*60) = 1;
    y = y * 3.5e6;
    %y = interpolate(y,60);
    output = y;
end
