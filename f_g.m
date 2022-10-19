function y = f_g(x)
    global m_b lambda x_max g
    y = (m_b + lambda .* (x_max - x)) .* g;
end