function [ output_args ] = Rides_FromDen( n_lat,n_lon )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

step = 0.01/(sqrt(2)); 
beta = 100;
horiz_dis_trvl = beta * (i - 1) * delta * sqrt(2);  

%ride avg altitude
ride_avg_alt = (1/n)*(sum(alt_ft));

%total altitude gained
for i = 2:1:n
    dz = sum(z_i + z_i_prev); 
end 

%running average altitude along the trip
run_avg_alt = alt_i + (1/(i+1)) * (z_i_next - alt_i) 
end

