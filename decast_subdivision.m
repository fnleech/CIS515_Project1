%% Recursive function for the decastjelau subdivision

% Input
    % UD and LD from 

% Output
    % ud_U, ld_U, ud_L, ld_L

function [ud_U, ld_U, ud_L, ld_L] = decast_subdivision(ud, ld)
%% Calculate new points from upperdiagonal
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

ud_U = [b00 b10 b20 b30];
ld_U = [b21 b12 b03]; 

%% Calculate new points from lower diagonal
b00 = ld(:,1);
b01 = ld(:,2);
b02 = ld(:,3);
b03 = ld(:,4);

b10 = (1-t)*b00 + t*b01;
b11 = (1-t)*b01 + t*b02;
b12 = (1-t)*b01 + t*b02;

b20 = (1-t)*b10 + t*b11;
b21 = (1-t)*b11 + t*b12;

%calculate final point
b30 = (1-t)*b20 + t*b21;

ud_L = [b00 b10 b20 b30];
ld_L = [b21 b12 b03]; 
