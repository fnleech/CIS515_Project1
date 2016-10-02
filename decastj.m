function [ X, Y ] = decastj(cpoly, n, t )
%UNTITLED Summary of this function goes here
%   INPUT
        % cpoly = control points b0 b1 b2 b3
        % n = number of iterations
        % t = time step (usually 0.5)
%   OUTPUT
       % 

%Initialize matrix to hold the x points
    % 7 rows to hold UD (upper diagonal) and LD (lower diagonal) from de
    %   Casteljau subdivision. 

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

b10 = (1-t)*b00 + t*b01;
b11 = (1-t)*b01 + t*b02;
b12 = (1-t)*b01 + t*b02;

b20 = (1-t)*b10 + t*b11;
b21 = (1-t)*b11 + t*b12;

%calculate final point
b30 = (1-t)*b20 + t*b21;

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

for i = 1:n-1  %n -1 since first iteration above

b00 = ud(:,1);
b01 = ud(:,2);
b02 = ud(:,3);
b03 = ud(:,4);

b10 = (1-t)*b00 + t*b01;
b11 = (1-t)*b01 + t*b02;
b12 = (1-t)*b01 + t*b02;

b20 = (1-t)*b10 + t*b11;
b21 = (1-t)*b11 + t*b12;

%calculate final point
b30 = (1-t)*b20 + t*b21;


ud_new = [b00 b10 b20 b30];
ld_new = [b21 b12 b03]; 

% Fill in X
X(1:4,m-(n+1)) = ud_new(1,:)';
X(5:7,m-(n+1)) = ld_new(1,:)';

% Fill in Y 
Y(1:4,m-(n+1)) = ud_new(2,:)';
Y(5:7,m-(n+1)) = ld_new(2,:)';

b00 = ud(:,4);
b01 = ld(:,1);
b02 = ld(:,2);
b03 = ld(:,3);

b10 = (1-t)*b00 + t*b01;
b11 = (1-t)*b01 + t*b02;
b12 = (1-t)*b01 + t*b02;

b20 = (1-t)*b10 + t*b11;
b21 = (1-t)*b11 + t*b12;

%calculate final point
b30 = (1-t)*b20 + t*b21;

% Fill in upper and lower diagonal vector
ud_new1 = [b00 b10 b20 b30];
ld_new1 = [b21 b12 b03]; 

% Fill in X
X(1:4,m-(n-1)) = ud_new1(1,:)';
X(5:7,m-(n-1)) = ld_new1(1,:)';

% Fill in Y 
Y(1:4,m-(n-1)) = ud_new1(2,:)';
Y(5:7,m-(n-1)) = ld_new1(2,:)';    

end


end 

%% Second Iteration



% Set new control points from upper diagonal

