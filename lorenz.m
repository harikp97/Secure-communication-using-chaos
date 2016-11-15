tspan=[0:0.01:1000];
x0=[1 0 1];
sigma=10;
r=28;
b=8/3;
f=@(t,x)[sigma*x(2)-sigma*x(1); r*x(1)-x(2)-x(1)*x(3); -b*x(3)+x(1)*x(2)];
[t,x]=ode45(f, tspan, x0);
figure(5);
plot3(x(:,1),x(:,2),x(:,3));