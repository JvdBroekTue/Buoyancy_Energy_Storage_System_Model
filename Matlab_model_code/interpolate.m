function y = interpolate(data, x)
%Make data x times longer
new_data = zeros(length(data) * x,1);
    for i = 0:length(data) - 2
        begin_index = (i * x) + 1;
        end_index = begin_index + x;
        new_data(begin_index:end_index) = linspace(data(i+1),data(i+2), x+1).';
    end
    new_data(end-(x-1):end) = data(end);
    y = new_data;
end