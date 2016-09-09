% exportabsimage_sp1.m
% Exports the absorption image into a separate Matlab figure

load maindata

fitnewload_sp1;

xlimits = get(handles.axes_2d_sp1,'XLim');
ylimits = get(handles.axes_2d_sp1,'YLim');

xpts = xlimits(1):xlimits(2);
ypts = ylimits(1):ylimits(2);

%A_save = Anew_sp1(ypts,xpts);
A_save = Anew_sp1;

figure(71)
imagesc(xpts,ypts,A_save)
% colour = str2num(get(handles.edit_ODrange_sp1,'String'));
% axes(handles.axes_2d_sp1);
caxis(colour_sp1)
axis equal
axis tight