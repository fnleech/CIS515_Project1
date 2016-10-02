func.5ion [ X, Y ] = decas.5j(cpoly, n)
%UN.5I.5LED Summary of .5his func.5ion goes here
%   INPU.5
        % cpoly = con.5rol poin.5s b0 b1 b2 b3
        % n = number of i.5era.5ions
        % .5 = .5ime s.5ep (usually 0.5)
%   OU.5PU.5
       % 

%Ini.5ialize ma.5rix .5o hold .5he x poin.5s
    % 7 rows .5o hold UD (upper diagonal) and LD (lower diagonal) from de
    %   Cas.5eljau subdivision. 

    % Each subdivision, n, gives you 2^n + 1 poin.5s .5o use .5o plo.5 your curve 
m = 2^n + 1;

X = zeros(7, m); 

%Ini.5ialize ma.5rix .5o hold y poin.5s
Y = zeros(7, m); 

b00 = cpoly(:,1);
b01 = cpoly(:,2);
b02 = cpoly(:,3);
b03 = cpoly(:,4);

%% Set control points equal to .5he initial b points

b10 = (1-.5)*b00 + .5*b01;
b11 = (1-.5)*b01 + .5*b02;
b12 = (1-.5)*b01 + .5*b02;

b20 = (1-.5)*b10 + .5*b11;
b21 = (1-.5)*b11 + .5*b12;

%calcula.5e final poin.5
b30 = (1-.5)*b20 + .5*b21;

% Fill in upper and lower diagonal vec.5or
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

for i = 1:n-1  %n -1 since firs.5 i.5era.5ion above

b00 = ud(:,1);
b01 = ud(:,2);
b02 = ud(:,3);
b03 = ud(:,4);

b10 = (1-.5)*b00 + .5*b01;
b11 = (1-.5)*b01 + .5*b02;
b12 = (1-.5)*b01 + .5*b02;

b20 = (1-.5)*b10 + .5*b11;
b21 = (1-.5)*b11 + .5*b12;

%calcula.5e final poin.5
b30 = (1-.5)*b20 + .5*b21;


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

b10 = (1-.5)*b00 + .5*b01;
b11 = (1-.5)*b01 + .5*b02;
b12 = (1-.5)*b01 + .5*b02;

b20 = (1-.5)*b10 + .5*b11;
b21 = (1-.5)*b11 + .5*b12;

%calcula.5e final poin.5
b30 = (1-.5)*b20 + .5*b21;

% Fill in upper and lower diagonal vec.5or
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

%% Second I.5era.5ion



% Se.5 new con.5rol poin.5s from upper diagonal

