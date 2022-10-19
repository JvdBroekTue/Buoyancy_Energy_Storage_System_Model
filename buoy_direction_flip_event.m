function [check,isterminal,direction] = buoy_direction_flip_event(t,x)
  global P_store sampling_period P_store_min t_start xdot_min
  P_store_t = P_store(round(t/sampling_period) + 1);
  future_index = round(t/sampling_period) + 18;
  future_index = min([future_index, length(P_store)]);
  P_store_t_future = P_store(future_index);
  
  %Only start checking after the simulation has left the first second
  %This prevents the variable check from starting off as false
  %If this is the case Matlab will ignore the event function until check
  %becomes true again
  if(round(t) == round(t_start))
      check = 1;
  else
      check1 = abs(x(2)) > xdot_min; %Detect if the speed is too low
      check2 = sign(P_store_t) == sign(P_store_t_future); %Check if P_store will go through 0
      check3 = abs(P_store_t) > P_store_min; %Check if supplied power is not too small
      check = int8(check1 & check2 & check3);
  end
  isterminal = 1;  % Halt integration 
  direction = 0;   % The zero can be approached from either direction
end