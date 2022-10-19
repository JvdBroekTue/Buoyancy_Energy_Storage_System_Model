function y = f_b(x)
    global rho_w g h_0 p_atm V_tot
    y = rho_w .* g .* (rho_w .* g .* h_0 + p_atm) ./ (rho_w .* g .* (x + h_0) + p_atm) .* V_tot;
end