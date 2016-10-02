% CHEN XIANG
% 2016.10.2
% draw the curve 
% subdivision version of de Casteljau algorithm
n = 5; % iterate times 
t = 1/2; % t 
[x,y] = ginput(); %screen input the data 
d = [x,y]; % d(i,:) i = 1,2,.. represents a point 
d = sortrows(d); % sort our data 
b = calculateDE(d, n, t); % calculate the points used to draw the curve 
b = sortrows(b); % sort our data 
plot(d(:,1), d(:,2), 'r*'); % draw the input data d
hold on;
plot(b(:,1), b(:,2), 'b-') % draw our curve 
title('Bezier Curve')

