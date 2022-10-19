function y = Input_data_supply
    global rho_w %Density of water
    global n_rotors %Number of rotors
    max_output = 8e4 *n_rotors; %Maximum power in watt outputted by all rotors
    A = 50; %Area of one rotor
    v = Get_ocean_speed(); %Smoothed speed of the ocean current
    
    P = abs(n_rotors .* 1/2 .* A .* rho_w .* v .^3); 
    P(P > max_output) = max_output;
    y = P;
end