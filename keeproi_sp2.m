% keeproi_sp2.m
% Shows data with most recent ROI instead of resizing.


if handles.fr_pressed_sp2 == 1
    Anew = A;
else
    Anew = A(ax_sp2(3):ax_sp2(4),ax_sp2(1):ax_sp2(2));  % ax_sp1 defines the ROI
end

disp(size(Anew));
Inew1 = sum(Anew);
Anew = Anew';
Inew2 = sum(Anew);
Anew = Anew';
c1 = findsta(Inew1);
c2 = findsta(Inew2);
cxnew = fminsearch('fitfun',c1,O,Inew1);
cznew = fminsearch('fitfun',c2,O,Inew2);

A_sum = sum(sum(Anew));
handles.A_sum_sp2 = A_sum;

cx = cxnew;
cz = cznew;
I1 = Inew1;
I2 = Inew2;

centerxnew = round(cxnew(3));
centerznew = round(cznew(3));

if ((centerznew > 0) && (centerznew < yheight_sp2))  % checks if fit led to a centre inside the ROI box
    crossxnew = Anew(centerznew,:);
else
    crossxnew = Anew(round(yheight_sp2/2),:);
    msgbox('Bad fit along x!','Warning','error')
    waitforbuttonpress
end

if ((centerxnew > 0) && (centerxnew < xwidth_sp2))   % checks if fit led to a centre inside the ROI box
    crossznew = Anew(:,centerxnew)';
else
    crossznew = Anew(:,round(xwidth_sp2/2))';
    msgbox('Bad fit along z!','Warning','error')
    waitforbuttonpress
end

c1 = findsta(crossxnew);
c2 = findsta(crossznew);
crossxfitnew = fminsearch('fitfun',c1,O,crossxnew);
crosszfitnew = fminsearch('fitfun',c2,O,crossznew);
opticaldepth = crossxfitnew(2) + crossxfitnew(1); % Background added to give real OD of cloud (SLC - 26/03/02)

% Take into account offset of cloud center due to choice of ROI
cxnew(3) = cxnew(3) + (xcamerapixel_sp2-1);
cznew(3) = cznew(3) + (ycamerapixel_sp2-1);
cx(3) = cxnew(3);
cz(3) = cznew(3);
crossxfitnew(3) = crossxfitnew(3) + (xcamerapixel_sp2-1);
crosszfitnew(3) = crosszfitnew(3) + (ycamerapixel_sp2-1);

% Generate fit data for horizontal sum
axes(handles.axes_1dh_sp2);
x = ax_sp2(1):ax_sp2(2);
R1 = cxnew(1) + cxnew(2)*exp(- (x-cxnew(3)).^2 / (cxnew(4).^2) );

if (get(handles.popupmenu_1dsum_sp2,'Value') == 1) % plot the sums
    handles.xh_sp2 = x;
    handles.onedhplot_sp2 = plot(x,Inew1,x,R1,'r');
    set(handles.axes_1dh_sp2,'xlim',[ax_sp2(1) ax_sp2(2)]);
    title('Intensity along x-axis after z-integration (vertical)');
end

% Generate fit data for vertical sum
axes(handles.axes_1dv_sp2);
x = ax_sp2(3):ax_sp2(4);
R2 = cznew(1) + cznew(2)*exp(- (x-cznew(3)).^2 / (cznew(4).^2) );

if (get(handles.popupmenu_1dsum_sp2,'Value') == 1) % plot the sums
    handles.xv_sp2 = x;
    handles.onedvplot_sp2 = plot(x,Inew2,x,R2,'r');
    set(handles.axes_1dv_sp2,'xlim',[ax_sp2(3) ax_sp2(4)]);
    title('Intensity along z-axis after x-integration (horizontal)');
end

% Generate fit data for horizontal crosscut
axes(handles.axes_1dh_sp2);
x = ax_sp2(1):ax_sp2(2);
Rx = crossxfitnew(1) + crossxfitnew(2)*exp(- (x-crossxfitnew(3)).^2 / (crossxfitnew(4).^2) );

if (get(handles.popupmenu_1dsum_sp2,'Value') == 2) % plot the crosscuts
    handles.xh_sp2 = x;
    handles.onedhplot_sp2 = plot(x,crossxnew,x,Rx,'r');
    set(handles.axes_1dh_sp2,'xlim',[ax_sp2(1) ax_sp2(2)]);
    title('Intensity along x-axis through center');
end

% Generate fit data for vertical crosscut
axes(handles.axes_1dv_sp2);
x = ax_sp2(3):ax_sp2(4);
Rz = crosszfitnew(1)+crosszfitnew(2)*exp(- (x-crosszfitnew(3)).^2 / (crosszfitnew(4).^2) );

if (get(handles.popupmenu_1dsum_sp2,'Value') == 2) % plot the crosscuts
    handles.xv_sp2 = x;
    handles.onedvplot_sp2 = plot(x,crossznew,x,Rz,'r');
    set(handles.axes_1dv_sp2,'xlim',[ax_sp2(3) ax_sp2(4)]);
    title('Intensity along z-axis through center');
end

%set(handles.axes_2d_sp2,'xlim',[ax_sp2(1) ax_sp2(2)],'ylim',[ax_sp2(3) ax_sp2(4)]);
axes(handles.axes_2d_sp2)
imagesc(handles.xh_sp2,handles.xv_sp2,Anew)
caxis(colour_sp2)
title([element_sp2 filename_sp2],'Interpreter','none')

crossx = crossxnew;
crossz = crossznew;
crossxfit = crossxfitnew;
crosszfit = crosszfitnew;

fitnewsave_sp2

% Update calculated information in GUI
keepROI_option_sp2 = 1;
datadisp_sp2
keepROI_option_sp2 = 0;

switch fittype_sp2
    case 'gaussian'
    case 'thomas-fermi'
        fittingTF_sp2;
        datadispTF_sp2;
        fitnewsaveTF_sp2;
end

clear xcamerapixel_sp2 ycamerapixel_sp2 xwidth_sp2 yheight_sp2
