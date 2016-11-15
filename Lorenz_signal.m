tspan=[0:0.01:1000];
sigma=10;
r=28;
b=8/3;
signal=audioread('C:\Users\Harikrishnan\Music\David Guetta - Titanium ft. Sia.mp3');
signal=signal(1:100001);
signal=transpose(signal);
x(1,1)=1;
x(1,2)=2;
x(1,3)=3;

for k=2:1:100001
            x(k,1) =x(k-1,1) + (sigma*x(k-1,2)-sigma*x(k-1,1)) * 0.01; 
            x(k,2) =x(k-1,2) + (r*x(k-1,1)-x(k-1,2)-x(k-1,1)*x(k-1,3)) * 0.01;
            x(k,3) =x(k-1,3) + (-b*x(k-1,3)+x(k-1,1)*x(k-1,2)) * 0.01;
end
s=zeros(100001,1);
for k=1:1:100001
    s(k,1)=x(k,1)+signal(k,1);
end
out=zeros(size(x));
out(1,1)= 1;
out(1,2)= 1;
out(1,3)= 1;
for k=2:1:100001
        out(k,1) =out(k-1,1) + (sigma*out(k-1,2)-sigma*out(k-1,1)) * 0.01; 
        out(k,2) =out(k-1,2) + (r*s(k-1,1)-out(k-1,2)-s(k-1,1)*out(k-1,3)) * 0.01;
        out(k,3) =out(k-1,3) +  (-b*out(k-1,3)+s(k-1,1)*out(k-1,2)) * 0.01;
end
figure(1);
plot(tspan(1,:),x(:,1));
figure(2);
plot(tspan(1,:),out(:,1));
sig_out=zeros(100001,1);
for k=2:1:100001
    sig_out(k,1)=s(k,1)-out(k,1);
end