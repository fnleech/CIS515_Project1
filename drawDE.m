n = 4;
[x,y] = ginput();
d = [x,y];
d = sortrows(d);
b = calculateDE(d, n);
b = sortrows(b);
plot(d(:,1), d(:,2), 'r*');
hold on;
plot(b(:,1), b(:,2), 'b-')
title('Bezier Curve')

