function y = f_d(x_dot)
    global rho_w C_d A
    y = 0.5 .* rho_w .* x_dot.^2 .* C_d .* A;
end