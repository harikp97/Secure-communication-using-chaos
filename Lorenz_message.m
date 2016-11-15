tspan=[0:0.01:1000];
sigma=10;
r=28;
b=7/3*ones(1,100001);
b2=7/3;
for k=5000:1:12000
    b(k)=8/3;
end
for k=50000:1:75000
    b(k)=8/3;
end
x(1,1)=1;
x(1,2)=2;
x(1,3)=3;

for k=2:1:100001
            x(k,1) =x(k-1,1) + (sigma*x(k-1,2)-sigma*x(k-1,1)) * 0.01; 
            x(k,2) =x(k-1,2) + (r*x(k-1,1)-x(k-1,2)-x(k-1,1)*x(k-1,3)) * 0.01;
            x(k,3) =x(k-1,3) + (-b(k)*x(k-1,3)+x(k-1,1)*x(k-1,2)) * 0.01;
end

out=zeros(size(x));
out(1,1)= 1;
out(1,2)= 1;
out(1,3)= 1;
out(:,1)=x(:,1);
for k=2:1:100001
        out(k,1) =out(k-1,1) + (sigma*out(k-1,2)-sigma*out(k-1,1)) * 0.01; 
        out(k,2) =out(k-1,2) + (r*x(k-1,1)-out(k-1,2)-x(k-1,1)*out(k-1,3)) * 0.01;
        out(k,3) =out(k-1,3) +  (-b2*out(k-1,3)+x(k-1,1)*out(k-1,2)) * 0.01;
end
figure(1);
plot(tspan(1,:),x(:,1));
figure(2);
plot(tspan(1,:),out(:,1));
figure(3);
plot(tspan(1,:),b(1,:));
y=x(:,1)-out(:,1);
figure(4);
plot(tspan(1,:),y(:,1));  
for k=2:1:100001
    if((y(k,1)<0.1)&&(y(k,1)>(-0.1))&&((y(k,1)-y(k-1,1)<0.000001)||(y(k-1,1)-y(k,1)>(0.000001))))
        y(k,1)=0;
    else 
        y(k,1)=1;
    end
end
figure(5);
plot(tspan(1,:),y(:,1));         
