function [X, Y] = decast2(cpoly, n)
%DECAST2
%   INPUT
        % cpoly = control points b0 b1 b2 b3
        % n = number of iterations
        % t = time step (usually 0.5)
%   OUTPUT
       % 

%Initialize matrix to hold the x points
    % 7 rows to hold UD (upper diagonal) and LD (lower diagonal) from de
    %   Casteljau subdivision. 

t = .05;

% Each subdivision, n, gives you 2^n + 1 points to use to plot your curve 
m = 2^n + 1;

X = zeros(7, m); 

%Initialize matrix to hold y points
Y = zeros(7, m); 

b00 = cpoly(:,1);
b01 = cpoly(:,2);
b02 = cpoly(:,3);
b03 = cpoly(:,4);

%% Set control points equal to the initial b points
b10 = linear_inter(t, b00, b01); 
b11 = linear_inter(t, b01, b02);
b12 = linear_inter(t, b02, b03); 

b20 = linear_inter(t, b10, b11);
b21 = linear_inter(t, b11, b12); 

%calculate final point
b30 = linear_inter(t, b20, b21); 

% Fill in upper and lower diagonal vector
ud = [b00 b10 b20 b30];
ld = [b21 b12 b03];

% Fill in X
X(4,1) = b00(1,1);
X(4,end) = b03(1,1);
X(1:4,ceil(m/2)) = [b00(1,1) b10(1,1) b20(1,1) b30(1,1)];
X(5:7,ceil(m/2)) = [b21(1,1) b12(1,1) b03(1,1)];

% Fill in Y 
Y(4,1) = b00(2,1);
Y(4,end) = b03(2,1);
Y(1:4,ceil(m/2)) = [b00(2,1) b10(2,1) b20(2,1) b30(2,1)];
Y(5:7,ceil(m/2)) = [b21(2,1) b12(2,1) b03(2,1)]; 

for i = 1:n-1

b00 = ud(:,1);
b01 = ud(:,2);
b02 = ud(:,3);
b03 = ud(:,4);
    
    
end
end 
    
