function y = generate_step(x_begin, x_end, n_begin, n_end, length)

    begin = ones(1, n_begin - 1) * x_begin;
    step = linspace(x_begin, x_end, n_end - n_begin + 1);
    end_ = ones(1, length - n_end) * x_end;
    
    y = cat(2, begin, step, end_);
end