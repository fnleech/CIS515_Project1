%% Plot a Cubic Spline Specified by a sequence of de Boor control points 

% Input uses ginput() for user input of N>= 5 de Boor control points. 
% The user presses enter to indicate all the desired points have been selected. 

% Output is a plot of the Cubic Spline

% This script uses the fuction calculateDE to approximate the Bezier
% control points

n = 6; % iterate times 
t = 1/2; % t 
[x,y] = ginput(); %screen input the data 
d = [x,y]; % d(i,:) i = 1,2,.. represents a point 
d = sortrows(d); % sort our data 
b = calculateDE(d, n, t); % calculate the points used to draw the curve 
b = sortrows(b); % sort our data 
plot(d(:,1), d(:,2)); % draw the input data d
hold on;
plot(b(:,1), b(:,2), 'b-') % draw our curve 
title('Bezier Curve')