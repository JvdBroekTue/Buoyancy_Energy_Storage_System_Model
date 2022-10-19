%Clear variables and command window and close all figures
clearvars; close all; clc

%Define global constants
global rho_w g h_0 p_atm V_tot lambda x_max m_b C_d A t_max n_rotors sampling_period P_store P_store_min xdot_min
rho_w = 1.03e3; %Density of water (kg m^-3)
g = 9.81; %Gravitational acceleration (m s^-2)
h_0 = 50; %Distance from buoy to the surface at x = 0 (m)
p_atm = 101e3; %Absolute atmospheric pressure (Pa)
V_tot = 55e3; %Total volume of the buoy (m^3)
lambda = 5927; %Linear density of the cable used (kg m^-1)
x_max = 150; %Maximum distance the buoy can move down from top most position x = 0 (m)
m_b = 7.02*V_tot; %Mass of the buoy (kg)
C_d = 1.2; %Drag coefficient (-)
A = 26.93e3; %Projected area of the buoy (m^2)
n_rotors = 24; %Number of rotors generating energy from the current for the supply (-)
motor_eff = 0.924; %Efficiency of the motor pulling the buoy down (-)
t_max = 3600*24 - 1; % -1, because Matlab arrays start from 1 and time starts at 0
sampling_period = 1; %Number of seconds between 2 datapoints in supply and demand data
P_store_min = 1e-3; %The minimum amount of watts that can be stored or released
xdot_min = 1e-6; %The minimum speed the buoy can have
x_0 = 40; %Starting position of the buoy (m)

%Retrieve the supply data
P_supply = Input_data_supply();
%Retrieve demand data
P_demand = Input_data_demand();

%Losses over wires from supply and demand to storage system will be neglected

%Calculate how much power will be send to storage
P_to_store =  P_supply - P_demand;

%For both injecting and extracting we will take the same efficiency
P_store = P_to_store .* motor_eff;

%Use the starting position and the power supplied to the buoy to calculate
%the position of the buoy with process_storage
%The results will be t and x, column 1 of x is position and column 2 of x is velocity
y = process_storage(P_store, x_0); 

%Split the result y in a time array and state variable array containing
%position and velocity
t = y(:,1);
x = y(:,2:3);

%Plot the obtained results
hold on
grid on
plot(t,x(:,1));
plot(t,x(:,2) * 1e4);
plot(linspace(0,t_max,length(P_store)),P_store * 1e-4);
yline(x_max);
legend(["x (m)", "x' (*1e-4 m s^{-1})", "P_{store} (*1e4 W)"]);
xlabel('time(s)')
ylim([-350 200]);


