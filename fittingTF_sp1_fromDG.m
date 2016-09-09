% fittingTF.m
% Performs bimodal fit by using double gaussian fit parameters as a
% starting point.
% Written by Ana by extending fittingDG.m
% This needs to be updated with Steve's updates


fitnewload_sp1

ax(1:2) = get(handles.axes_2d_sp1,'XLim');
ax(3:4) = get(handles.axes_2d_sp1,'YLim');
x = ax(1):ax(2);
z = ax(3):ax(4);
resolution = 500;
xhires = linspace(ax(1),ax(2),resolution);
zhires = linspace(ax(3),ax(4),resolution);
[X,Z] = meshgrid(x,z);
[XHI,ZHI] = meshgrid(xhires,zhires);
% colour = str2num(get(handles.edit_colourrange,'String'));

Anew = Anew_sp1(z,x);
Gfitx = handles.crossxfitnew_sp1;
Gfitz = handles.crosszfitnew_sp1;
crosscut_x = handles.crossxnew_sp1;
crosscut_z = handles.crossznew_sp1;

bimodal_findstart;


%% Double-gaussian fit for better initial guess parameters

O = optimset('Display','Off','MaxIter',1000,'MaxFunEvals',10000,'TolFun',1e-7,'TolX',1e-7);
DGfit = fminsearch(@fitfun_DG,DGfit,O,Anew,X,Z);

D2fit = DGfit(1) + DGfit(2)*exp(-(XHI-DGfit(3)).^2/((DGfit(4))^2) - (ZHI-DGfit(5)).^2/((DGfit(6))^2)) ...
        + DGfit(7)*exp(-(XHI-DGfit(8)).^2/((DGfit(9))^2) - (ZHI-DGfit(10)).^2/((DGfit(11))^2));

Thermfit = DGfit(2)*exp(-(XHI-DGfit(3)).^2/((DGfit(4))^2) - (ZHI-DGfit(5)).^2/((DGfit(6))^2));
Thermfit_pixel = DGfit(2)*exp(-(X-DGfit(3)).^2/((DGfit(4))^2) - (Z-DGfit(5)).^2/((DGfit(6))^2));

Condfit = DGfit(7)*exp(-(XHI-DGfit(8)).^2/((DGfit(9))^2) - (ZHI-DGfit(10)).^2/((DGfit(11))^2));

condxcentre = int32(DGfit(8))-ax(1)+1;
condxcentrehires = int32((DGfit(8)-ax(1))*(resolution-1)/(ax(2)-ax(1))+1);
condzcentre = int32(DGfit(10))-ax(3)+1;
condzcentrehires = int32((DGfit(10)-ax(3))*(resolution-1)/(ax(4)-ax(3))+1);

xdataccut = Anew(condzcentre,:);
zdataccut = Anew(:,condxcentre);
xfitccut = D2fit(condzcentrehires,:);
zfitccut = D2fit(:,condxcentrehires);
xthermccut = Thermfit(condzcentrehires,:);
zthermccut = Thermfit(:,condxcentrehires);
xcondccut = Condfit(condzcentrehires,:);
zcondccut = Condfit(:,condxcentrehires);



%% x-fit

%[max_x maxIndex_x] = max(I1);  % if we want to fit to the sum
[max_x maxIndex_x] = max(crosscut_x);
widthGuess_x = DGfit(9);
position_x = x(maxIndex_x);

% Initial fit
x_lb = maxIndex_x - round(widthGuess_x);
x_ub = maxIndex_x + round(widthGuess_x);

if x_ub > 100
    x_ub = 100;
end

if x_lb < 1
    x_lb = 1;
end

guessparams_x = [max_x widthGuess_x position_x];
options = optimset('Display','off', 'MaxFunEvals',100000);
%params_x = lsqcurvefit('para_fit', guessparams_x, x(xx_lb:xx_ub),I1(xx_lb:xx_ub),[],[],options);  % fitting to sum
params_x = lsqcurvefit('para_fit', guessparams_x, x(x_lb:x_ub), crosscut_x(x_lb:x_ub),[],[],options);

fitFunTemp_x = para_fit(params_x, x);

% Refined fit (correct cloud center)
[maxFit_x maxIndexFit_x] = max(fitFunTemp_x);
x_lb2 = maxIndexFit_x - round(widthGuess_x);
x_ub2 = maxIndexFit_x + round(widthGuess_x);

if x_ub2 > 100
    x_ub2 = 100;
end

if x_lb2 < 1
    x_lb2 = 1;
end

%params_x = lsqcurvefit('para_fit', params_x, x(x_lb2:x_ub2),I1(x_lb2:x_ub2),[],[],options);   % fitting to sum
%params_x = lsqcurvefit('para_fit', params_x, x(x_lb2:x_ub2), I1(x_lb2:x_ub2),[],[],options);
params_x = lsqcurvefit('para_fit', params_x, x(x_lb2:x_ub2), crosscut_x(x_lb2:x_ub2),[],[],options);
params_x = lsqcurvefit('para_fit', params_x, x(x_lb2:x_ub2), crosscut_x(x_lb2:x_ub2),[],[],options);    % helpful to do two iterations of fitting

% Find zero crossing
paraFun = @(xx,a,b,c) (a - b*(xx - c).^2);  % parameterized function
a = params_x(1);                    % parameter
b = params_x(2);
c = params_x(3);
fun = @(xx) paraFun(xx,a,b,c);    % function of x alone
intercept_x = fzero(fun,min(x));

TF_x = params_x(3) - intercept_x;   % Thomas-Fermi radius
cloudPos_x = params_x(3);

fitFun_x = para_fit(params_x, xhires);
fitFun_x_pixels = para_fit(params_x, x);


%% z-fit

%[max_x maxIndex_x] = max(I1);  % fit to sum
[max_z maxIndex_z] = max(crosscut_z);
widthGuess_z = DGfit(9);
position_z = z(maxIndex_z);

% Initial fit
z_lb = maxIndex_z - round(widthGuess_z);
z_ub = maxIndex_z + round(widthGuess_z);

if z_ub > 100
    z_ub = 100;
end

if z_lb < 1
    z_lb = 1;
end

guessparams_z = [max_z widthGuess_z position_z];
options = optimset('Display','off', 'MaxFunEvals',100000);
%params_z = lsqcurvefit('para_fit', guessparams_z, z(z_lb:z_ub),I1(z_lb:z_ub),[],[],options);  % fit to sum
params_z = lsqcurvefit('para_fit', guessparams_z, z(z_lb:z_ub), crosscut_z(z_lb:z_ub),[],[],options);

fitFunTemp_z = para_fit(params_z, z);

% Refined fit (correct cloud center)
[maxFit_z maxIndexFit_z] = max(fitFunTemp_z);
z_lb2 = maxIndexFit_z - round(widthGuess_z);
z_ub2 = maxIndexFit_z + round(widthGuess_z);

if z_ub2 > 100
    z_ub2 = 100;
end

if z_lb2 < 1
    z_lb2 = 1;
end

%params_z = lsqcurvefit('para_fit', params_z, z(z_lb2:z_ub2),I1(z_lb2:z_ub2),[],[],options);   % fit to sum
%params_z = lsqcurvefit('para_fit', params_z, z(z_lb2:z_ub2), I1(z_lb2:z_ub2),[],[],options);
params_z = lsqcurvefit('para_fit', params_z, z(z_lb2:z_ub2), crosscut_z(z_lb2:z_ub2),[],[],options);
params_z = lsqcurvefit('para_fit', params_z, z(z_lb2:z_ub2), crosscut_z(z_lb2:z_ub2),[],[],options);

% Find zero crossing
paraFun = @(zz,a,b,c) (a - b*(zz - c).^2);  % parameterized function
a = params_z(1);                    % parameter
b = params_z(2);
c = params_z(3);
fun = @(zz) paraFun(zz,a,b,c);    % function of x alone
intercept_z = fzero(fun,min(z));

TF_z = params_z(3) - intercept_z;   % Thomas_Fermi radius
cloudPos_z = params_z(3);

fitFun_z = para_fit(params_z, zhires);
fitFun_z_pixels = para_fit(params_z, z);


%% Bimodal 2D

parabola2D_ini = mean([params_z(1) params_x(1)]) - params_x(2)*(XHI - params_x(3)).^2 - params_z(2)*(ZHI - params_z(3)).^2;
parabola2D_diff = parabola2D_ini - DGfit(2);
parabola2D = (parabola2D_diff > 0).*parabola2D_diff;  % taking only positive values and subtracting offset from thermal gaussian fit

total2Dfit = Thermfit + parabola2D;

% Coarse version
parabola2D_ini_pixel = mean([params_z(1) params_x(1)]) - params_x(2)*(X - params_x(3)).^2 - params_z(2)*(Z - params_z(3)).^2;
parabola2D_diff_pixel = parabola2D_ini_pixel - DGfit(2);
parabola2D_pixel = (parabola2D_diff_pixel > 0).*parabola2D_diff_pixel;  % taking only positive values and subtracting offset from thermal gaussian fit


%% Plotting:

% 1D x crosscut
axes(handles.axes_1dh_sp1);
%plot(x,xdataccut,'k-',xhires,xfitccut,'r-',xhires,xthermccut,'b-',xhires,xcondccut,'g-',xhires,fitFun_x,'c-');
plot(x,xdataccut,'b-',xhires,xthermccut,'r-',xhires,fitFun_x,'g-');
set(handles.axes_1dh_sp1,'XLim',ax(1:2),'YLim',[min(crosscut_x) 1.1*max(crosscut_x)])
%set(handles.H2.axes_Hcross,'XLim',ax(1:2))
title('1D cross cut along x-axis through centre of condensate');

% 1D y crosscut
axes(handles.axes_1dv_sp1);
%plot(z,zdataccut,'k-',zhires,zfitccut,'r-',zhires,zthermccut,'b-',zhires,zcondccut,'g-',zhires,fitFun_z,'c-');
plot(z,zdataccut,'b-',zhires,zthermccut,'r-',zhires,fitFun_z,'g-');
set(handles.axes_1dv_sp1,'XLim',ax(3:4),'YLim',[min(crosscut_z) 1.1*max(crosscut_z)])
title('1D cross cut along z-axis through centre of condensate');

hbar = h/(2*pi);

kB = 1.38e-23;
muB = 9.27d-24;
h = 6.63d-34;
omegabar = 2*pi*(xfreq_sp1*yfreq_sp1*zfreq_sp1)^(1/3);

species1 = element_sp1; %cell2mat(handles.species1);

[mass, lambda, gam, Isat, scattXsection, threebodyloss] = elementproperties(species1);

sigma0 = 3*(lambda).^2/(2.0*(pi)); % in SI
sigmatotal = sigma0/(1 + 2*IoverIs_sp1 + 4*(delta_sp1/gam)^2);

opticaldepth = DGfit(2)+DGfit(7);
ODratio = DGfit(7)/DGfit(2);

%thermhorizsize = DGfit(4)/(2^0.5)*pixelsize1;

if viewAngle_sp1 == 0
    thermhorizsize_corrected  = DGfit(4);  % ie no change
    thermhorizsize = thermhorizsize_corrected/(2^0.5)*pixelsize1; % Conversion to rms width and microns
else
    thermhorizsize_corrected  = 1/cos(viewAngle_sp1)*(DGfit(4)^2 - DGfit(6)^2*sin(viewAngle_sp1)^2)^0.5; % Corrected for angle, still in px
    thermhorizsize  = thermhorizsize_corrected/(2^0.5)*pixelsize1; % Conversion to rms width  and microns
end

thermvertsize  = DGfit(6)/(2^0.5)*pixelsize1;
thermaspect = thermhorizsize/thermvertsize;

%condhorizsize  = DGfit(9)/(2^0.5)*pixelsize1;

if viewAngle_sp1 == 0
    condhorizsize_corrected  = DGfit(9);  % ie no change
    condhorizsize = condhorizsize_corrected/(2^0.5)*pixelsize1; % Conversion to rms width and microns
else
    condhorizsize_corrected  = 1/cos(viewAngle_sp1)*(DGfit(9)^2 - DGfit(11)^2*sin(viewAngle_sp1)^2)^0.5; % Corrected for angle, still in px
    condhorizsize = condhorizsize_corrected/(2^0.5)*pixelsize1; % Conversion to rms width  and microns
end

condvertsize  = DGfit(11)/(2^0.5)*pixelsize1;
condaspect = condhorizsize/condvertsize;

[nnew,mnew] = size(Anew);

max(max(Anew))
min(min(Anew))
sum(sum(Anew))

Ntot = (sum(sum(Anew))-mnew*nnew*DGfit(1))*pixelsize1^2/sigmatotal;
%Ntherm = Ntot*thermvertsize*thermhorizsize/(ODratio*condvertsize*condhorizsize + thermvertsize*thermhorizsize); % See p15 Tim's lab book 3
%Ncond = Ntot - Ntherm;
Ntherm = (sum(sum(Thermfit_pixel)) - DGfit(1))*pixelsize1^2/sigmatotal;
Ncond = sum(sum(parabola2D_pixel))*pixelsize1^2/sigmatotal;

condensateFraction = Ncond/(Ntherm + Ncond);

intrapthermvertsize = thermvertsize/sqrt(1+(2.0*pi*zfreq_sp1*tof_sp1*1.0e-3)^2);
intrapthermhorizsize = thermhorizsize/sqrt(1+(2.0*pi*xfreq_sp1*tof_sp1*1.0e-3)^2);
tempx =  mass*(2.0*pi*xfreq_sp1*intrapthermhorizsize*(2^0.5)).^2/(2*kB);
tempz = mass*(2.0*pi*zfreq_sp1*intrapthermvertsize*(2^0.5)).^2/(2*kB);

npk = Ntherm*omegabar^3*(mass/(2*pi*kB*tempx))^(3/2);
psdensity = npk*(h/((2*pi*mass*kB*tempx)^0.5))^3;

Tc = 0.94*hbar*omegabar*Ntot^(1/3)/kB;

% Saving fit data to memory for log file:

% Thermal
handles.amp_T_sp1 = DGfit(2);
handles.sig_h_T_sp1 = DGfit(4)/2^0.5; % Converting to RMS width.
handles.sig_v_T_sp1 = DGfit(6)/2^0.5; % Converting to RMS width.
handles.cen_h_T_sp1 = DGfit(3);
handles.cen_v_T_sp1 = DGfit(5);
handles.NT_sp1 = Ntherm;

% Condensate
handles.amp_C_sp1 = DGfit(7);
handles.sig_h_C_sp1 = TF_x; % TF radius
handles.sig_v_C_sp1 = TF_z %TF_z;
handles.cen_h_C_sp1 = cloudPos_x;
handles.cen_v_C_sp1 = cloudPos_z;
handles.NC_sp1 = Ncond;     % number is from the double-gaussian fit

% General
handles.odbm_sp1 = opticaldepth;
handles.Ntot_sp1 = Ntot;
handles.back_sp1 = DGfit(1);
handles.condFrac_sp1 = condensateFraction;

%double_dispTF_sp1;
datadispTF_sp1;

DGfit_sp1 = DGfit;