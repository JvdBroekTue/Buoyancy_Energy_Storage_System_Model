function dxdt = odefnc(t,x, P_store)
    global m_b sampling_period;

    dxdt = zeros(2,1);    
    P_store_t = P_store(round(t/sampling_period) + 1);
    
    if (P_store_t >= 0 ) %If P_store is positive x(2) or xdot should be positive, thus drag force in same direction as buoyancy
        dxdt(1) = x(2);
        dxdt(2) = ( -f_b(x(1)) - f_d(x(2)) + f_g(x(1)) + P_store_t / x(2) ) / m_b;
    else %Other way around
        dxdt(1) = x(2);
        dxdt(2) = ( -f_b(x(1)) + f_d(x(2)) + f_g(x(1)) + P_store_t / x(2) ) / m_b;
    end
end