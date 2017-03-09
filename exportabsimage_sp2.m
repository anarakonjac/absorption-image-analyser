% exportabsimage_sp1.m
% Exports the absorption image into a separate Matlab figure

load maindata

fitnewload_sp2;

xlimits = get(handles.axes_2d_sp2,'XLim');
ylimits = get(handles.axes_2d_sp2,'YLim');

xpts = xlimits(1):xlimits(2);
ypts = ylimits(1):ylimits(2);

% A_save = Anew_sp2(ypts,xpts);
A_save = Anew_sp2;

figure(72)
imagesc(xpts,ypts,A_save)
caxis(colour_sp2)
colormap(abs_colormap_sp2)
axis equal
axis tight
title([element_sp2 filename_sp2],'Interpreter','none')