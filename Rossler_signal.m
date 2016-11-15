tspan=[0:0.01:2000];
a=0.2;
b=2;
c=9.0;
signal=audioread('C:\Users\Harikrishnan\Music\David Guetta - Titanium ft. Sia.mp3');
signal=signal(1:200001);
signal=transpose(signal);

x = zeros(200001,3);
x(1,1)=3;
x(1,2)=1;
x(1,3)=10;
for k=2:1:200001
        x(k,1) =x(k-1,1) + (-x(k-1,2)-x(k-1,3)) * 0.01; 
        x(k,2) =x(k-1,2) + (x(k-1,1)+a*x(k-1,2)) * 0.01;
        x(k,3) =x(k-1,3) + (b+x(k-1,3)*x(k-1,1)-x(k-1,3)*c) * 0.01;
end
s = zeros(200001,1);
for k=1:1:200001
    s(k,1)=x(k,1)+signal(k,1);
end
out=zeros(size(x));
out(1,1)= 2;
out(:,2) = x(:,2);
out(1,3)= 1;
       for k=2:1:200001
        out(k,1) =out(k-1,1) + (-out(k-1,2)-out(k-1,3)) * 0.01; 
        out(k,3) =out(k-1,3) + (b+out(k-1,3)*out(k-1,1)-out(k-1,3)*c) * 0.01;
    end
    
    plot(x(:,1),out(:,1));
    
    sig_out=zeros(1,200001);
for k=1:1:200001
    sig_out(1,k)=s(k,1)-out(k,1);
end
