function output = initial_xdot(x_0, P_store, t_)
    %This function takes the value from P_store on time t and
    %calculates the starting velocity of the buoy on position x_0 such that
    %the acceleration is xddot_0
    global sampling_period
    syms xdot_0;
    
    %Take into account sampling period
    t = round(t_ / sampling_period) + 1;

    %Check if P_store(i) is zero, because if it is there are no solutions
    if P_store(t) == 0
        %Take the value of P_store one position further to get the next non
        %zere value
        P_store_t = P_store(t + 1);
    else
        P_store_t = P_store(t);
    end
    
    if (P_store_t >= 0)
        formula = 0  == ( -f_b(x_0) - f_d(xdot_0) + f_g(x_0) + P_store_t / xdot_0  );
    else
        formula = 0 == ( -f_b(x_0) + f_d(xdot_0) + f_g(x_0) + P_store_t / xdot_0  );
    end
    y = double(vpasolve(formula, [-Inf Inf]));
    % Sometimes y is an array with multiple solutions,then take the lowest one
    %because experimentally, the wrong values turned out to be the largest
    [~,j] = min(abs(y));
    output = y(j); 
end