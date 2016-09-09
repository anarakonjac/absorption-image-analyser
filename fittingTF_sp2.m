% fittingTF.m
% Performs bimodal fit by using double gaussian fit parameters as a
% starting point.
% Written by Ana by extending fittingDG.m
% This needs to be updated with Steve's updates


fitnewload_sp2

ax(1:2) = get(handles.axes_2d_sp2,'XLim');
ax(3:4) = get(handles.axes_2d_sp2,'YLim');
x = ax(1):ax(2);
z = ax(3):ax(4);
resolution = 500;
xhires = linspace(ax(1),ax(2),resolution);
zhires = linspace(ax(3),ax(4),resolution);
% colour = str2num(get(handles.edit_colourrange,'String'));

[mm,nn] = size(Anew_sp1);

if max(z) > mm
    z = ax(3):mm;
end

if max(x) > nn
    x = ax(1):nn;
end

[X,Z] = meshgrid(x,z);
[XHI,ZHI] = meshgrid(xhires,zhires);

Anew = Anew_sp2(z,x);
Gfitx = handles.crossxfitnew_sp2;
Gfitz = handles.crosszfitnew_sp2;
crosscut_x = handles.crossxnew_sp2;
crosscut_z = handles.crossznew_sp2;

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

if condxcentre < 1
    msgbox('Bad fit along x!','Warning','error')
    waitforbuttonpress
    condxcentre = 1;
    condxcentrehires = 1;
end

condzcentre = int32(DGfit(10))-ax(3)+1;
condzcentrehires = int32((DGfit(10)-ax(3))*(resolution-1)/(ax(4)-ax(3))+1);

if condxcentre < 1
    msgbox('Bad fit along z!','Warning','error')
    waitforbuttonpress
    condzcentre = 1;
    condzcentrehires = 1;
end

xdataccut = Anew(condzcentre,:);
zdataccut = Anew(:,condxcentre);
xfitccut = D2fit(condzcentrehires,:);
zfitccut = D2fit(:,condxcentrehires);
xthermccut = Thermfit(condzcentrehires,:);
zthermccut = Thermfit(:,condxcentrehires);
xcondccut = Condfit(condzcentrehires,:);
zcondccut = Condfit(:,condxcentrehires);


%% Thomas-Fermi x-fit

%[max_x maxIndex_x] = max(I1);  % if we want to fit to the sum
[max_x maxIndex_x] = max(crosscut_x);
widthGuess_x = DGfit(9);
position_x = x(maxIndex_x);

% Initial fit
x_lb = round(maxIndex_x - widthGuess_x);
x_ub = round(maxIndex_x + widthGuess_x);

if x_ub > length(x)
    x_ub = length(x);
end

if x_lb < 1
    x_lb = 1;
end

guessparams_x = [max_x widthGuess_x/1000 position_x];
options = optimset('Display','off', 'MaxFunEvals',100000);
%params_x = lsqcurvefit('para_fit', guessparams_x, x(xx_lb:xx_ub),I1(xx_lb:xx_ub),[],[],options);  % fitting to sum
params_x = lsqcurvefit('para_fit', guessparams_x, x(x_lb:x_ub), crosscut_x(x_lb:x_ub),[],[],options);

fitFunTemp_x = para_fit(params_x, x);

% Refined fit (correct cloud center)
[maxFit_x maxIndexFit_x] = max(fitFunTemp_x);
position_x2 = x(maxIndexFit_x);
x_lb2 = round(maxIndexFit_x - widthGuess_x);
x_ub2 = round(maxIndexFit_x + widthGuess_x);

if x_ub2 > length(x)
    x_ub2 = length(x);
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


%% Thomas-Fermi z-fit

%[max_x maxIndex_x] = max(I1);  % fit to sum
[max_z maxIndex_z] = max(crosscut_z);
widthGuess_z = DGfit(9);
position_z = z(maxIndex_z);

% Initial fit
z_lb = round(maxIndex_z - widthGuess_z);
z_ub = round(maxIndex_z + widthGuess_z);

if z_ub > length(z)
    z_ub = length(z);
end

if z_lb < 1
    z_lb = 1;
end

guessparams_z = [max_z widthGuess_z/1000 position_z];
options = optimset('Display','off', 'MaxFunEvals',100000);
%params_z = lsqcurvefit('para_fit', guessparams_z, z(z_lb:z_ub),I1(z_lb:z_ub),[],[],options);  % fit to sum
params_z = lsqcurvefit('para_fit', guessparams_z, z(z_lb:z_ub), crosscut_z(z_lb:z_ub),[],[],options);
params_z(2) = abs(params_z(2));

fitFunTemp_z = para_fit(params_z, z);

% Refined fit (correct cloud center)
[maxFit_z maxIndexFit_z] = max(fitFunTemp_z);
position_z2 = z(maxIndexFit_z);
z_lb2 = round(maxIndexFit_z - widthGuess_z);
z_ub2 = round(maxIndexFit_z + widthGuess_z);

if z_ub2 > length(z)
    z_ub2 = length(z);
end

if z_lb2 < 1
    z_lb2 = 1;
end

%params_z = lsqcurvefit('para_fit', params_z, z(z_lb2:z_ub2),I1(z_lb2:z_ub2),[],[],options);   % fit to sum
%params_z = lsqcurvefit('para_fit', params_z, z(z_lb2:z_ub2), I1(z_lb2:z_ub2),[],[],options);
params_z = lsqcurvefit('para_fit', params_z, z(z_lb2:z_ub2), crosscut_z(z_lb2:z_ub2),[],[],options);
params_z(2) = abs(params_z(2));
params_z = lsqcurvefit('para_fit', params_z, z(z_lb2:z_ub2), crosscut_z(z_lb2:z_ub2),[],[],options);
params_z(2) = abs(params_z(2));

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
axes(handles.axes_1dh_sp2);
%plot(x,xdataccut,'k-',xhires,xfitccut,'r-',xhires,xthermccut,'b-',xhires,xcondccut,'g-',xhires,fitFun_x,'c-');
plot(x,xdataccut,'b-',xhires,xthermccut,'r-',xhires,fitFun_x,'g-');
set(handles.axes_1dh_sp2,'XLim',ax(1:2),'YLim',[min(crosscut_x) 1.1*max(crosscut_x)])
%set(handles.H2.axes_Hcross,'XLim',ax(1:2))
title('1D cross cut along x-axis through centre of condensate');

% 1D y crosscut
axes(handles.axes_1dv_sp2);
%plot(z,zdataccut,'k-',zhires,zfitccut,'r-',zhires,zthermccut,'b-',zhires,zcondccut,'g-',zhires,fitFun_z,'c-');
plot(z,zdataccut,'b-',zhires,zthermccut,'r-',zhires,fitFun_z,'g-');
set(handles.axes_1dv_sp2,'XLim',ax(3:4),'YLim',[min(crosscut_z) 1.1*max(crosscut_z)])
title('1D cross cut along z-axis through centre of condensate');
