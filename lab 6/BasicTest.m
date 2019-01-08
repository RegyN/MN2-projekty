startX = 0;
startV = .1;
g = 9.805;
l = 10;
k = g/l;
c = 0.0;
dt = 0.01;
x = startX;
v = startV;
a = -k*sin(x)
X = [];
V = [];
A = [];
T = 0:dt:10;
for t = T
    X = [X;x];
    V = [V;v];
    A = [A;a];
    v = v+a*dt;
    x = x+v*dt;
    a = -k*sin(x) - c*(v*l)^2*sign(v);
end
plot(T,X,'r', T,V,'b', T,A,'g' ,T,zeros(1,max(size(T))),'k');
title(strcat('Wahad³o matematyczne. V_{0}=', num2str(startV), ", X_{0}=", num2str(startX), ", dt=", num2str(dt) ));
legend("wychylenie [rad]","prêdkoœæ k¹towa [rad/s]","przysp. k¹towe [rad/s^{2}]");
xlabel("czas [s]");
grid on;