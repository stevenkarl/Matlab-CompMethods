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
alt_ft(329,488)
zlabel('z - axis');
hold on;
plot3(329,488,alt_ft(329,488),'k.','MarkerSize',50);
hold off;

end

