for i = 1:12
    if(i ~= 7)
        rawdata = csvread("FilmedTest" + i + ".csv");
        data = lightgate_dataconvert(rawdata(:,1), rawdata(:,2),rawdata(:,4));
        figure(i);
        plot(rawdata(1:length(data),1)/1000, data);
        grid on;
        title("FilmedTest" + i);
        xlabel("time");
        ylabel("m/s");
        clear all;
    end
end
