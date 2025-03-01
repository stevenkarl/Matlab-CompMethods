function [] = plot_functionality( )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
Coor_Mat = load('CO_topo.txt'); 
Coor_Mat_ft = distdim(Coor_Mat, 'meters', 'feet');
alt_ft = sqrt(Coor_Mat_ft);
surf(alt_ft, 'edgecolor','none')
title('Square Root of Altitudes'); 
xlabel('x - axis'); 
ylabel('y - axis');
zlabel('z - axis');
hold on;
[i,j] = get_coords(39.7392,-104.9903);
plot3(i,j,alt_ft(i,j),'k.','MarkerSize',50);
Rides_FromDen(100,100,39.7392,-104.9903,alt_ft); 
hold off;
end

function[i,j]=get_coords(lat,lon)
%----------------------------------------------------%
% Function get_coords returns the indicies 
% for a desired latitude longitude coordinate
% Input:
%    lat = latitude  (degrees)
%    lon = longitude (degrees)
%
% Output:
%      i = latitude index
%      j = longitude index
% 
% dkh 08/30/2017
%----------------------------------------------------%

% define lat/lon range for CO
latmin =   37.000000;
latmax =   41.000000;
lonmin = -109.050000;
lonmax = -102.016667;
    
% grid box width    
dlon   = 0.00833333334;
dlat   = dlon;

% calculate grid box indicies 
%i = floor((lat - latmin)/dlat)+1;
%j = floor((lon - lonmin)/dlon)+1;

%error message
if lat < latmin || lat > latmax 
    i = -999;
    j = -999;
    fprintf('latitude out of bounds')
elseif lon < lonmin || lon > lonmax
        i = -999;
        j = -999;
        fprintf('longitude out of bounds')
else
    i = floor((lat - latmin)/dlat)+1;
    j = floor((lon - lonmin)/dlon)+1;
end 
end

function [ output_args ] = Rides_FromDen( n_lat,n_lon,D_lat,D_lon, topomat)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%step a
[n,m] = get_coords(n_lat,n_lon);
plot3(n,m,topomat(n,m),'k.','MarkerSize',50); 

%step b
beta = 100;
step = 0.01/(sqrt(2));
D_vec = [D_lat,D_lon];
dest_vec = zeros(2,abs(n_lat));

%lat steps 
if n_lat < 0
    for i = 1:abs(n_lat)
        dest_vec(1,i) = D_lat + ( i*(-step));
    end
else
    for i = 1:abs(n_lat) 
        dest_vec(1,i) = D_lat + (i *step); 
    end
end
%lon steps 
if n_lon < 0 
    for i = 1:abs(n_lon)
        dest_vec(2,i) = D_lon + ( i*(-step));
    end
else
    for i = 1:abs(n_lon)
        dest_vec(2,i) = D_lon + ( i*(-step));
    end
end 

display(dest_vec); 

%part c

d = beta * ((dest_vec(1,:)) - 1) * step * sqrt(2); 
display(d); 

%part d
for i = 1:abs(n_lat) 
    alts = topomat(get_coords(dest_vec(1,i),dest_vec(2,i))); 
end
size(alts)
%part e 
%ride avg altitude
ride_avg_alt = (1/abs(n_lat))*(sum(alts));
display(ride_avg_alt); 

%part f
%total altitude gained
for i = 2:abs(n_lat)
    if(alts(i,:) > alts(i-1))
        dz = sum(i + (i-1));
    end 
end 

%running average altitude along the trip
run_avg_alt = alt_i + (1/(i+1)) * (z_i_next - alt_i)

end