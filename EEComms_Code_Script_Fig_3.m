% Light Coding or Script for Figures: 
% Figure 3 (Calculated lag times for xenoliths with diameter (D) and source depth X)

% 
% Constant physical properties
pm = 3250;      % Density of xenolith (kg/m3)
pl = 2700;      % Density of alkaline mafic melt (kg/m3)
g  = 9.8;       % gravitational acceleration (m/s2)
D  = 25;        % Diameter of xenolith in cm
r  = D/(100*2); % Xenolith radius (r) in metres
X  = 50*1000;   % Source depth (m)
Vm = 4;         % Magam ascent velocity (m/s)
Vt = -2;        % Xenolith settling velocity (m/s)
Vx = Vm + Vt;   % Net velocity of xenolith (m/s)
Z  = 50;        % Source depth of xenolith (km)

% Calculate trajectories
t_xx = (1000*(Z-100)/Vt)/(60*60);  % time in hours to sink to 100 km
t_m  = (1000*(Z-0)/Vm)/(60*60);  % time in hours for magma to reach surface
t_xo = (1000*(Z-0)/Vx)/(60*60);  % time in hours for xenolith to reach surface

figure
plot([0 10],[Z Z],'--k','LineWidth',2)
%set(gca, 'YDir','reverse','XAxisLocation','top' )
set(gca,'FontSize',18,'XAxisLocation','top','YDir','reverse','XMinorTick','on'...
    ,'YMinorTick','on');
xlabel('Time (h)')
ylabel('Depth (km)')
axis([0 10 0 100])
hold on
fill([0 10 10 0],[0 0 36 36],'y')
plot([0 t_xx],[Z 100],'-k','LineWidth',1)
plot([0 t_m],[Z 0],'-k','LineWidth',1)
plot([0 t_xo],[Z 0],'-k','LineWidth',1)

hold on
