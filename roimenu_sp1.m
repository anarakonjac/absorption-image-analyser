% roimenu_sp1.m
% Does the ROI things when the ROI is set in the GUI

load maindata

A = handles.A_sp1;
O = handles.O;

% Draw box with mouse
t = waitforbuttonpress;    % wait for mouse button to be pressed

point1 = get(gca,'CurrentPoint');    % button down detected
finalRect = rbbox;                   % return figure units
point2 = get(gca,'CurrentPoint');    % button up detected
point1 = point1(1,1:2);              % extract x and y
point2 = point2(1,1:2);
p1 = min(point1,point2);    % Do this so thing works no matter which way box is dragged
p2 = max(point1,point2);
offset = abs(p1 - p2);         

xcamerapixel_sp1 = p1(1);
ycamerapixel_sp1 = p1(2);
xwidth_sp1 = offset(1);
yheight_sp1 = offset(2);

% If square ROI is chosen
if (get(handles.checkbox_square_sp1,'Value') == 1)
    xwidth_sp1 = max([xwidth_sp1 yheight_sp1]);
    yheight_sp1 = max([xwidth_sp1 yheight_sp1]);
end

set(handles.text_coordvalues_sp1,'String',[num2str(xcamerapixel_sp1) ',' num2str(ycamerapixel_sp1) ',' num2str(xwidth_sp1) ',' num2str(yheight_sp1)]);

% ROI box
ax_sp1(1) = round(xcamerapixel_sp1);
ax_sp1(2) = round(xcamerapixel_sp1 + xwidth_sp1);
ax_sp1(3) = round(ycamerapixel_sp1);
ax_sp1(4) = round(ycamerapixel_sp1 + yheight_sp1);

% Store ROI limits
save('maindata','ax_sp1','yheight_sp1','xwidth_sp1','xcamerapixel_sp1','ycamerapixel_sp1','-append');

Anew = A(ax_sp1(3):ax_sp1(4),ax_sp1(1):ax_sp1(2));
disp(size(Anew));
Inew1 = sum(Anew);
Anew = Anew';
Inew2 = sum(Anew);
Anew = Anew';
c1 = findsta(Inew1);
c2 = findsta(Inew2);
disp('Refitting plots for smaller Roi');
cxnew = fminsearch('fitfun',c1,O,Inew1);
cznew = fminsearch('fitfun',c2,O,Inew2);

A_sum = sum(sum(Anew));
handles.A_sum_sp1 = A_sum;

cx = cxnew;
cz = cznew;
I1 = Inew1;
I2 = Inew2;

centerxnew = round(cxnew(3));
centerznew = round(cznew(3));

if ((centerznew > 0) && (centerznew < yheight_sp1))  % checks if fit led to a centre inside the ROI box
    crossxnew = Anew(centerznew,:);
else
    crossxnew = Anew(round(yheight_sp1/2),:);
    msgbox('Bad fit along x!','Warning','error')
    waitforbuttonpress
end

if ((centerxnew > 0) && (centerxnew < xwidth_sp1))   % checks if fit led to a centre inside the ROI box
    crossznew = Anew(:,centerxnew)';
else
    crossznew = Anew(:,round(xwidth_sp1/2))';
    msgbox('Bad fit along z!','Warning','error')
    waitforbuttonpress
end

c1 = findsta(crossxnew);
c2 = findsta(crossznew);
crossxfitnew = fminsearch('fitfun',c1,O,crossxnew);
crosszfitnew = fminsearch('fitfun',c2,O,crossznew);
opticaldepth = crossxfitnew(2) + crossxfitnew(1); % Background added to give real OD of cloud (SLC - 26/03/02)

% Take into account offset of cloud center due to choice of ROI
cxnew(3) = cxnew(3) + (xcamerapixel_sp1-1);
cznew(3) = cznew(3) + (ycamerapixel_sp1-1);
cx(3) = cxnew(3);
cz(3) = cznew(3);
crossxfitnew(3) = crossxfitnew(3) + (xcamerapixel_sp1-1);
crosszfitnew(3) = crosszfitnew(3) + (ycamerapixel_sp1-1);

% Generate fit data for horizontal sum
axes(handles.axes_1dh_sp1);
x = ax_sp1(1):ax_sp1(2);
R1 = cxnew(1) + cxnew(2)*exp(- (x-cxnew(3)).^2 / (cxnew(4).^2) );

if (get(handles.popupmenu_1dsum_sp1,'Value') == 1) % plot the sums
    handles.xh_sp1 = x;
    handles.onedhplot_sp1 = plot(x,Inew1,x,R1,'r');
    set(handles.axes_1dh_sp1,'xlim',[ax_sp1(1) ax_sp1(2)]);
    title('Intensity along x-axis after z-integration (vertical)');
end

% Generate fit data for vertical sum
axes(handles.axes_1dv_sp1);
x = ax_sp1(3):ax_sp1(4);
R2 = cznew(1) + cznew(2)*exp(- (x-cznew(3)).^2 / (cznew(4).^2) );

if (get(handles.popupmenu_1dsum_sp1,'Value') == 1) % plot the sums
    handles.xv_sp1 = x;
    handles.onedvplot_sp1 = plot(x,Inew2,x,R2,'r');
    set(handles.axes_1dv_sp1,'xlim',[ax_sp1(3) ax_sp1(4)]);
    title('Intensity along z-axis after x-integration (horizontal)');
end

% Generate fit data for horizontal crosscut
axes(handles.axes_1dh_sp1);
x = ax_sp1(1):ax_sp1(2);
Rx = crossxfitnew(1) + crossxfitnew(2)*exp(- (x-crossxfitnew(3)).^2 / (crossxfitnew(4).^2) );

if (get(handles.popupmenu_1dsum_sp1,'Value') == 2) % plot the crosscuts
    handles.xh_sp1 = x;
    handles.onedhplot_sp1 = plot(x,crossxnew,x,Rx,'r');
    set(handles.axes_1dh_sp1,'xlim',[ax_sp1(1) ax_sp1(2)]);
    title('Intensity along x-axis through center');
end

% Generate fit data for vertical crosscut
axes(handles.axes_1dv_sp1);
x = ax_sp1(3):ax_sp1(4);
Rz = crosszfitnew(1)+crosszfitnew(2)*exp(- (x-crosszfitnew(3)).^2 / (crosszfitnew(4).^2) );

if (get(handles.popupmenu_1dsum_sp1,'Value') == 2) % plot the crosscuts
    handles.xv_sp1 = x;
    handles.onedvplot_sp1 = plot(x,crossznew,x,Rz,'r');
    set(handles.axes_1dv_sp1,'xlim',[ax_sp1(3) ax_sp1(4)]);
    title('Intensity along z-axis through center');
end

% set(handles.axes_2d_sp1,'xlim',[ax_sp1(1) ax_sp1(2)],'ylim',[ax_sp1(3) ax_sp1(4)]);
axes(handles.axes_2d_sp1)
imagesc(handles.xh_sp1,handles.xv_sp1,A(ax_sp1(3):ax_sp1(4),ax_sp1(1):ax_sp1(2)));
caxis(colour_sp1)
title([element_sp1 filename_sp1],'Interpreter','none')

crossx = crossxnew;
crossz = crossznew;
crossxfit = crossxfitnew;
crosszfit = crosszfitnew;

fitnewsave_sp1;
datadisp_sp1;   % extract parameters and display in GUI

switch fittype_sp1
    case 'gaussian'
    case 'thomas-fermi'
        fittingTF_sp1;
        datadispTF_sp1;
        fitnewsaveTF_sp1;
end

% clear xcamerapixel ycamerapixel xwidth yheight
