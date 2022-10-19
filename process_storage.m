function y = process_storage(P_store, initial_x)
    global  t_max x_max t_start
    t_start = 0;
    restart_t = 20; %Number of seconds to skip when the model stops and needs to restart
    %Initial value of x and xdot
    xdot0 = initial_xdot(initial_x, P_store, 1); %Take the input array P_store and take the first value to calculate initual speed
    x0 = [initial_x xdot0];

    %ode solve function
    options = odeset('Events', @buoy_direction_flip_event); %This event will stop the model when the speed gets too low and it might break
    [t, x, te, ~, ~] = ode23s(@(t,x) odefnc(t,x, P_store), [t_start t_max], x0, options);
    t_temp = [t; t(end) + restart_t];
    x_temp = [x; x(end,:)];
    t_start = t_temp(end);
    te
    
    %Ode is set to stop when the speed gets too small to avoid errors
    %If it stops, let it continue a couple of seconds later with new initial values from where it stopped
    %This restarting process also works for errors
    
    restart_count = 0; %Keep track of how many times the ode restarted
    
    %Check if the simulation has run long enough, or the buoy is out of bounds
    while (t_temp(end) < t_max) && (x_temp(end,1) >= 0) && (x_temp(end,1) <= x_max)
        %Determine conditions at time of restart
        current_t = round(t_temp(end));
        current_pos = x_temp(end,1);
        
        %Calculate speed to buoy should have after restart
        xdot_temp = initial_xdot( current_pos, P_store, current_t);
        restart_x = [current_pos xdot_temp]; %Initial conditions at restart
        
        %Run simulation and add the results to the ones that have been
        %generated before
        [t, x, te, ~, ~] = ode23s(@(t,x) odefnc(t,x, P_store), [t_start t_max], restart_x, options);
        t_temp = [t_temp; t; t(end) + restart_t];
        x_temp = [x_temp; x; x(end,:)];
        t_start = t_temp(end);
        te
        
        %Increase restart counter after every loop
        restart_count = restart_count + 1;
    end
    t = t_temp;
    x = x_temp;
    restart_count %Remove the ; to display how many times the ode solver restarted during a run
    seconds_skipped = restart_count * restart_t
   
    y = zeros(length(t),3);
    y(:,1) = t;
    y(:,2:3) = x;
end