% ana_sp1.m
% Analyses image data and calls other relevant routines for species 1.

load configdata.mat
load maindata.mat


%% Analysis

% If fringe removal is being used, this goes first.
% if useFR_sp1 == 1
%     removefringes_sp1;
% end

A = A - C;    % subtract background
B = B - C;
clear C;

epsilon = min(A(A > 0));     % Checking for and correcting zeros
A(A <= 0) = epsilon;
B(B <= 0) = epsilon;
clear epsilon;

% Choose which type of imaging we are doing
switch analysis_type_sp1
    
    case 'Classic'
        
        A = log(B./A);
        
    case 'px-by-px'
        
        A_meas = log(B./A); % Measured OD
        
        A_mod = real(log((1 - exp(-OD_sat_sp1))./(exp(-A_meas) - exp(-OD_sat_sp1))));
        A_actual = A_mod + (1 - exp(-A_mod)).*B./Isat_eff_sp1;  % See Robert Wild's thesis for details
        A = real(A_actual);
        
    case 'High Intensity'
        
        A = log(B./A) + (B - A)/Isat_eff_sp1;   % See Robert Wild's thesis for details
        
    case 'Faraday'
        
        A = A - B;
        
end

% Apply Fourier filter
if useFF_sp1
    applyFourierFilter_sp1;
end

A_sum = sum(sum(A));
handles.A_sum_sp1 = A_sum;


%% Setting up graphs

axes(handles.axes_2d_sp1);
cla reset;
reset(gca);

[m,n] = size(A);
ax = [1 n 1 m]; %set current axis limits
set(handles.text_coordvalues_sp1,'String',['1,1,' num2str(n) ',' num2str(m)]);

zoomoutsize = max(ax);

handles.twodplot_sp1 = imagesc(A);
set(handles.axes_2d_sp1,'xlim',[ax(1) zoomoutsize],'ylim',[ax(3) zoomoutsize]);
caxis(colour_sp1)
axis equal
xlabel('X (horizontal)')
ylabel('Z (vertical)')


%% Fitting routine

O = optimset('Display','off','MaxIter',600,'TolFun',1e-7,'TolX',1e-7);

handles.O = O;

% x fitting:
I1 = sum(A);
Inew1 = I1; %sums columns of matrix A to create a row vector
c = findsta(I1);
cx = fminsearch('fitfun',c,O,I1);

if (cx(3) > length(I1) || cx(3) < 1)
    cx(3) = length(I1)/2;
end

cxnew = cx;
x = (1:length(I1));
handles.xh_sp1 = x;
R1 = cx(1) + cx(2)*exp(-(x-cx(3)).^2/(cx(4).^2));
axes(handles.axes_1dh_sp1);
handles.onedhplot_sp1 = plot(x,I1,x,R1,'r');
set(handles.axes_1dh_sp1,'xlim',[ax(1) ax(2)]);
title('Intensity along x-axis after z-integration (vertical)');

% z fit
A = A';
I2 = sum(A);
Inew2 = I2;
A = A';   %transposes A before summing
c = findsta(I2);
cz = fminsearch('fitfun',c,O,I2);

if (cz(3) > length(I2) || cz(3) < 1)
    cz(3) = length(I2)/2;
end

cznew = cz;
z = (1:length(I2));
handles.xv_sp1 = z;
R2 = cz(1) + cz(2)*exp(-(z-cz(3)).^2/(cz(4).^2));
axes(handles.axes_1dv_sp1);
handles.onedvplot_sp1 = plot(z,I2,z,R2,'r');
set(handles.axes_1dv_sp1,'xlim',[ax(3) ax(4)]);
title('Intensity along z-axis after x-integration (horizontal)');


%% Calculating optical depth

centerx = round(cx(3));

if (centerx > max(size(A)) || centerx < 1)
    centerx = max(size(A));
end

centerxnew = centerx;

centerz = round(cz(3));

if (centerz > max(size(A)) || centerz < 1)
    centerz = max(size(A));
end

centerznew = centerz;

crossx = A(centerz,:);
crossxnew = crossx;
crossz = A(:,centerx)';
crossznew = crossz;
c = findsta(crossx);
crossxfit = fminsearch('fitfun',c,O,crossx);
crossxfitnew = crossxfit;
Rx = crossxfit(1) + crossxfit(2)*exp(-(x-crossxfit(3)).^2/(crossxfit(4).^2));

if ((crossxfit(3) > 0) && (crossxfit(3) < n))  % checks if fit led to a centre inside the ROI box
    crossxfit(3) = crossxfit(3);
else
    crossxfit(3) = round(n/2);
end

c = findsta(crossz);
crosszfit = fminsearch('fitfun',c,O,crossz);
crosszfitnew = crosszfit;
Rz = crosszfit(1) + crosszfit(2)*exp(-(z-crosszfit(3)).^2/(crosszfit(4).^2));
opticaldepth = crosszfit(2) + crosszfit(1);
% disp(['The optical depth is:' num2str(opticaldepth)]);

if ((crosszfit(3) > 0) && (crosszfit(3) < m))   % checks if fit led to a centre inside the ROI box
    crosszfit(3) = crosszfit(3);
else
    crosszfit(3) = round(m/2);
end

if (get(handles.popupmenu_1dsum_sp1,'Value') == 2)
    axes(handles.axes_1dh_sp1);
    handles.onedhplot_sp1 = plot(x,crossx,'b',x,Rx,'r');
    set(handles.axes_1dh_sp1,'xlim',[ax(1) ax(2)])
    title('Cross-section along x-axis through center');
    axes(handles.axes_1dv_sp1);
    handles.onedvplot_sp1 = plot(z,crossz,'b',z,Rz,'r');
    set(handles.axes_1dv_sp1,'xlim',[ax(3) ax(4)])
    title('Cross-section along z-axis through center');
end

clear x z %temporary variables, not needed any more;

Anew = A;
Anew_sum = A_sum;
Bnew = B;

% Saving original matrix and fit data to handles.
fitsave_sp1
fitnewsave_sp1


%% Extracting parameters and displaying in GUI

datadisp_sp1;   % Extracts parameters and displays in GUI

switch fittype_sp1
    
    case 'gaussian'
        
    case 'thomas-fermi'
        fittingTF_sp1;
        datadispTF_sp1;
        fitsaveTF_sp1;
        fitnewsaveTF_sp1;
        
end

if useROI_sp1 == 1
    keeproi_sp1
end
