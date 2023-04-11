% Light Coding or Script for Figures: 
% Figure 2A (Re No. Limit on Stokes Terminal Settling Velocity)
% 
% Constant physical properties
pm = 3250;      % Density of xenolith (kg/m3)
pl = 2700;      % Density of alkaline mafic melt (kg/m3)
g  = 9.8;       % gravitational acceleration (m/s2)
% range of log10 nu; where nu = melt viscosity vlaues (Pa s)
nu_plot  = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 2 4 6 8 10 20 40 50 60 75 100 150 1000 5000 10000];
% range of xenolith sizes as radius (r) in metres
r  = [0.02 0.05 0.1 0.25 0.5 1]./2;

% Initiate log vs. log plot
loglog(2,0,'.k')
set(gca,'FontSize',18,'XAxisLocation','top','XMinorTick','on','XScale',...
    'log','YMinorTick','on','YScale','log');
xlabel('log_{10} \eta (Pa s)')
ylabel('V_{T} (m s^{-1})')
xlim([10.^0 5*10^3])
ylim([-10^0 -10^-2.5])

Re_equal_visc = [];     % Null array for V_T:log nu values at Re = 1
hold on
    for ir = 1:1:max(size(r))
      nu_re_1   =   -nu_plot./(2*r(ir)*pl);   % Testing
      nu_equal =   ((4*g*(pm-pl)*(r(ir)^3)*pl)/(9))^0.5; % Viscosity at RE=1
      Re_equal_visc = [Re_equal_visc nu_equal];
      nu_hi    =   nu_equal:(1000-nu_equal)./25:5000;
      %loglog(nu_plot, nu_re_1,'--k');    % log nu - V_T lines at Re=1 for xeno size 
      loglog(nu_plot , 2*g*(pl-pm)*(r(ir)^2)./(9.*nu_plot),'--k','LineWidth',1)
      loglog(nu_hi , 2*g*(pl-pm)*(r(ir)^2)./(9.*nu_hi),'-k','LineWidth',1)     
    end
      nu_equal = ((4*g*(pm-pl)*(r(3)^3)*pl)/(9))^0.5;
      nu_hi    = nu_equal:(1000-nu_equal)./25:5000;
      % Plot heavy line for xenolith with a 10 cm radius
      loglog(nu_plot , 2*g*(pl-pm)*(r(3)^2)./(9.*nu_plot),'--k','LineWidth',2)
      loglog(nu_hi , 2*g*(pl-pm)*(r(3)^2)./(9.*nu_hi),'-k','LineWidth',2)
      % Plot the limiting points where Re No. for particle settling = 1
      loglog(Re_equal_visc, 2*g*(pl-pm)*(r.^2)./(9.*Re_equal_visc),'ok','MarkerSize',10,'Color',[0 0 0],'MarkerFaceColor',[0 0 0])
    hold off