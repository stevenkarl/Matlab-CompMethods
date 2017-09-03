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
    i = floor((lat - latmin)/dlat)+1
    j = floor((lon - lonmin)/dlon)+1
end 
end