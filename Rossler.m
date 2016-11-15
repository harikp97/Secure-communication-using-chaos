tspan=[0:0.01:2000];
a=0.2;
b=2;
c=9.0;
x(1,1)=3;
x(1,2)=1;
x(1,3)=10;

x = zeros(200001,3);
for k=2:1:200001
        x(k,1) =x(k-1,1) + (-x(k-1,2)-x(k-1,3)) * 0.01; 
        x(k,2) =x(k-1,2) + (x(k-1,1)+a*x(k-1,2)) * 0.01;
        x(k,3) =x(k-1,3) + (b+x(k-1,3)*x(k-1,1)-x(k-1,3)*c) * 0.01;
    end
figure(1);
plot3(x(:,1),x(:,2),x(:,3));
xlabel('X');
ylabel('Y');
zlabel('Z');
out=zeros(size(x));
out(1,1)= 2;
out(1,2)= 1;
out(1,3)= 1;
out(:,2)=x(:,2);
    for k=2:1:200001
        out(k,1) =out(k-1,1) + (-out(k-1,2)-out(k-1,3)) * 0.01; 
        out(k,3) =out(k-1,3) + (b+out(k-1,3)*out(k-1,1)-out(k-1,3)*c) * 0.01;
    end
figure(2);
plot3(out(:,1),out(:,2),out(:,3));
xlabel('X');
ylabel('Y');
zlabel('Z');

figure(3);
plot(tspan(1,:),x(:,1)-out(:,1));
xlabel('time');
ylabel('e(x)');
figure(4);
plot(tspan(1,:),x(:,3)-out(:,3));
xlabel('time');
ylabel('e(z)');
figure(6);
plot(x(:,1),out(:,1));
xlabel('x(drive)');
ylabel('x(response)');
figure(7);
plot(x(:,3),out(:,3));
xlabel('z(drive)');
ylabel('z(response)');