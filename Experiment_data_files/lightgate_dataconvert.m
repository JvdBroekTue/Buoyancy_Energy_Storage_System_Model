function speed = lightgate_dataconvert(time, gatevalue, direction);

spokecount = 8;
startspeed = 200;
shaftdiamiter = 0.01;

%% convert to digital
benchmark = max(gatevalue)/2;
for i = 1:length(gatevalue)
    if(gatevalue(i)>benchmark)
        digital(i) = 1;
    else
        digital(i) = 0;
    end
end
%% edge detection

edgelocation(1) = 0;
edgecount = 0;
for i = 2:length(digital)
    if(digital(i) ~= digital(i-1))
        edgecount = edgecount + 1;
        edgelocation(edgecount) = i;
    end
end
%% edge to speed
currentloc = 1;
for i = 1:length(edgelocation)
    averagespeed = ((pi*shaftdiamiter)/(spokecount*2))/((time(edgelocation(i))-time(currentloc))/1000);
    speed(currentloc:edgelocation(i)) = averagespeed;
    currentloc = edgelocation(i);
end
speed = abs(smoothdata(speed,'movmedian',10));
speed = abs(smoothdata(speed,'movmedian',500));

%% include direction
for i = 1:length(speed)
    if(direction(i) == 0)
        speed(i) = speed(i)*-1;
    elseif(direction(i) == 1)
        speed(i) = speed(i)*1;
    end
end
    
end