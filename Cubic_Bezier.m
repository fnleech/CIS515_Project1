%Project 1 \\Cubic Bezier Spline Curves
% NAMES: Leech, Manzur, Xiang 
% DATE: 10/4/16
% This m file plots the cubic Bezier spline curve with N >= 5 ( where N starts at 0). 

% INTPUT: Manual input of de Boor control points from user
% OUTPUT: Cubic Bezier Plot

%Reference: http://blogs.mathworks.com/graphics/2014/10/13/bezier-curves/

[x, y]=ginput;
plot (x,y,'r--o');

if length(x)==6
%Here we define the de Boor control points for N=5.

d0 = [x(1);y(1)];
d1 = [x(2);y(2)];
d2 = [x(3);y(3)];
d3 = [x(4);y(4)];
d4 = [x(5);y(5)];
d5 = [x(6);y(6)];

hold on;

a= d0;
b= d1;
c= (1/2)*d1+(1/2)*d2;
d= (1/4)*d1+(7/12)*d2 +(1/6)*d3;

e= (1/4)*d1+(7/12)*d2+(1/6)*d3;
f= (2/3)*d2+(1/3)*d3;
g= (1/3)*d2+(2/3)*d3;
h= (1/6)*d2+(7/12)*d3+(1/4)*d4;

af= (1/6)*d2+(7/12)*d3+(1/4)*d4;
bf= (1/2)*d3+ (1/2)*d4;
cf= d4;
df= d5;

hold on;
plot (a(1,:),a(2,:),'*');
plot (b(1,:),b(2,:),'*');
plot (c(1,:),c(2,:),'*');
plot(d(1,:),d(2,:),'*');
plot(e(1,:),e(2,:),'*');
plot(f(1,:),f(2,:),'*');
plot(g(1,:),g(2,:),'*');
plot(h(1,:),h(2,:),'*');

plot(af(1,:),af(2,:),'*');
plot(bf(1,:),bf(2,:),'*');
plot(cf(1,:),cf(2,:),'*');
plot(df(1,:),df(2,:),'*');

t= linspace(0,1,100);

Bezier=kron((1-t).^3,a)+ kron(3*(1-t).^2.*t,b)+kron(3*(1-t).*t.^2,c)+kron(t.^3,d);
hold on
plot (Bezier(1,:),Bezier(2,:))
hold off

Bezier=kron((1-t).^3,e)+ kron(3*(1-t).^2.*t,f)+kron(3*(1-t).*t.^2,g)+kron(t.^3,h);
hold on
plot (Bezier(1,:),Bezier(2,:))
hold off

Bezier=kron((1-t).^3,af)+ kron(3*(1-t).^2.*t,bf)+kron(3*(1-t).*t.^2,cf)+kron(t.^3,df);
hold on
plot (Bezier(1,:),Bezier(2,:))
hold off
end

if length(x)==7
%Here we define the de Boor control points for N=6.

d0 = [x(1);y(1)];
d1 = [x(2);y(2)];
d2 = [x(3);y(3)];
d3 = [x(4);y(4)];
d4 = [x(5);y(5)];
d5 = [x(6);y(6)];
d6 = [x(7);y(7)];

hold on;

a= d0;
b= d1;
c= (1/2)*d1+(1/2)*d2;
d= (1/4)*d1+(7/12)*d2 +(1/6)*d3;

e= (1/4)*d1+(7/12)*d2+(1/6)*d3;
f= (2/3)*d2+(1/3)*d3;
g= (1/3)*d2+(2/3)*d3;
h= (1/6)*d2+(4/6)*d3+(1/6)*d4;

as= (1/6)*d2+(4/6)*d3+(1/6)*d4;
bs= (2/3)*d3+(1/3)*d4;
cs= (1/3)*d3+(2/3)*d4;
ds= (1/6)*d3+(7/12)*d4+(1/4)*d5;

at= (1/6)*d3 +(7/12)*d4 +(1/4)*d5;
bt= (1/2)*d4+(1/2)*d5;
ct= d5;
dt= d6;

hold on;
plot (a(1,:),a(2,:),'*');
plot (b(1,:),b(2,:),'*');
plot (c(1,:),c(2,:),'*');
plot(d(1,:),d(2,:),'*');

plot(e(1,:),e(2,:),'*');
plot(f(1,:),f(2,:),'*');
plot(g(1,:),g(2,:),'*');
plot(h(1,:),h(2,:),'*');

plot(as(1,:),as(2,:),'*');
plot(bs(1,:),bs(2,:),'*');
plot(cs(1,:),cs(2,:),'*');
plot(ds(1,:),ds(2,:),'*');

plot(at(1,:),at(2,:),'*');
plot(bt(1,:),bt(2,:),'*');
plot(ct(1,:),ct(2,:),'*');
plot(dt(1,:),dt(2,:),'*');

t= linspace(0,1,100);

Bezier=kron((1-t).^3,a)+ kron(3*(1-t).^2.*t,b)+kron(3*(1-t).*t.^2,c)+kron(t.^3,d);
hold on
plot (Bezier(1,:),Bezier(2,:))
hold off

Bezier=kron((1-t).^3,e)+ kron(3*(1-t).^2.*t,f)+kron(3*(1-t).*t.^2,g)+kron(t.^3,h);
hold on
plot (Bezier(1,:),Bezier(2,:))
hold off

Bezier=kron((1-t).^3,as)+ kron(3*(1-t).^2.*t,bs)+kron(3*(1-t).*t.^2,cs)+kron(t.^3,ds);
hold on
plot (Bezier(1,:),Bezier(2,:))
hold off

Bezier=kron((1-t).^3,at)+ kron(3*(1-t).^2.*t,bt)+kron(3*(1-t).*t.^2,ct)+kron(t.^3,dt);
hold on
plot (Bezier(1,:),Bezier(2,:))
hold off
end

if length(x)>=8
    %These are the control points for N>=7
    dn=  [x(length(x));y(length(y))];
    dn1= [x(length(x)-1);y(length(y)-1)];
    dn2= [x(length(x)-2);y(length(y)-2)];
    dn3= [x(length(x)-3);y(length(y)-3)];
    dn4= [x(length(x)-4);y(length(y)-4)];
    dn5= [x(length(x)-5);y(length(y)-5)];
    d0= [x(1);y(1)];
    d1= [x(2);y(2)];
    d2= [x(3);y(3)];
    d3= [x(4);y(4)];
    d4= [x(5);y(5)];
    
    for k=4:(length(x)-4)
        t= linspace(0,1,100);
        b0= (1/6)*[x(k-1);y(k-1)]+(4/6)*[x(k);y(k)]+(1/6)*[x(k+1);y(k+1)];
        b1=(2/3)*[x(k);y(k)]+(1/3)*[x(k+1);y(k+1)];
        b2=(1/3)*[x(k);y(k)]+(2/3)*[x(k+1);y(k+1)];
        b3=(1/6)*[x(k);y(k)]+(4/6)*[x(k+1);y(k+1)]+(1/6)*[x(k+2);y(k+2)];
        hold on;
     plot (b0(1,:),b0(2,:),'*');
     plot (b1(1,:),b1(2,:),'*');
     plot (b2(1,:),b2(2,:),'*');
     plot(b3(1,:),b3(2,:),'*');
    Bezier=kron((1-t).^3,b0)+ kron(3*(1-t).^2.*t,b1)+kron(3*(1-t).*t.^2,b2)+kron(t.^3,b3);
    hold on
    plot (Bezier(1,:),Bezier(2,:));
    hold off   
      
   end
          
hold on;

a= d0;
b= d1;
c= (1/2)*d1+(1/2)*d2;
d= (1/4)*d1+(7/12)*d2 +(1/6)*d3;

e= (1/4)*d1+(7/12)*d2+(1/6)*d3;
f= (2/3)*d2+(1/3)*d3;
g= (1/3)*d2+(2/3)*d3;
h= (1/6)*d2+(4/6)*d3+(1/6)*d4;

es= (1/6)*dn5+(4/6)*dn4+(1/6)*dn3;
fs= (2/3)*dn4+(1/3)*dn3;
gs= (1/3)*dn4+(2/3)*dn3;
hs= (1/6)*dn4+(4/6)*dn3+(1/6)*dn2; 

as= (1/6)*dn4 +(4/6)*dn3 +(1/6)*dn2;
bs= (2/3)*dn3+(1/3)*dn2;
cs= (1/3)*dn3+(2/3)*dn2;
ds= (1/6)*dn3+(7/12)*dn2+(1/4)*dn1;

at= (1/6)*dn3 +(7/12)*dn2 +(1/4)*dn1;
bt= (1/2)*dn2+(1/2)*dn1;
ct= dn1;
dt= dn;


hold on;
plot (a(1,:),a(2,:),'*');
plot (b(1,:),b(2,:),'*');
plot (c(1,:),c(2,:),'*');
plot(d(1,:),d(2,:),'*');

plot(e(1,:),e(2,:),'*');
plot(f(1,:),f(2,:),'*');
plot(g(1,:),g(2,:),'*');
plot(h(1,:),h(2,:),'*');

plot(as(1,:),as(2,:),'*');
plot(bs(1,:),bs(2,:),'*');
plot(cs(1,:),cs(2,:),'*');
plot(ds(1,:),ds(2,:),'*');

plot(at(1,:),at(2,:),'*');
plot(bt(1,:),bt(2,:),'*');
plot(ct(1,:),ct(2,:),'*');
plot(dt(1,:),dt(2,:),'*');

plot(es(1,:),es(2,:),'*');
plot(fs(1,:),fs(2,:),'*');
plot(gs(1,:),gs(2,:),'*');
plot(hs(1,:),hs(2,:),'*');

t= linspace(0,1,100);

Bezier=kron((1-t).^3,a)+ kron(3*(1-t).^2.*t,b)+kron(3*(1-t).*t.^2,c)+kron(t.^3,d);
hold on
plot (Bezier(1,:),Bezier(2,:))
hold off

Bezier=kron((1-t).^3,e)+ kron(3*(1-t).^2.*t,f)+kron(3*(1-t).*t.^2,g)+kron(t.^3,h);
hold on
plot (Bezier(1,:),Bezier(2,:))
hold off

Bezier=kron((1-t).^3,es)+ kron(3*(1-t).^2.*t,fs)+kron(3*(1-t).*t.^2,gs)+kron(t.^3,hs);
hold on
plot (Bezier(1,:),Bezier(2,:))
hold off

Bezier=kron((1-t).^3,as)+ kron(3*(1-t).^2.*t,bs)+kron(3*(1-t).*t.^2,cs)+kron(t.^3,ds);
hold on
plot (Bezier(1,:),Bezier(2,:))
hold off

Bezier=kron((1-t).^3,at)+ kron(3*(1-t).^2.*t,bt)+kron(3*(1-t).*t.^2,ct)+kron(t.^3,dt);
hold on
plot (Bezier(1,:),Bezier(2,:))
hold off
end