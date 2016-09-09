[filename,pathname] = uiputfile('*.csv','Save graph data as');

fitnewload

xlimits = get(handles.axes_1dh,'XLim');
ylimits = get(handles.axes_1dv,'XLim');

Anew = Anew(ylimits(1):ylimits(2),xlimits(1):xlimits(2));

x = xlimits(1):xlimits(2);
y = ylimits(1):ylimits(2);

figure(2)
imagesc(Anew)

dlmwrite([pathname filename(1:end-4) '_1DH_sum' filename(end-3:end)],[x.' I1.'],'precision',10,'delimiter',',')
dlmwrite([pathname filename(1:end-4) '_1DV_sum' filename(end-3:end)],[y.' I2.'],'precision',10,'delimiter',',')
dlmwrite([pathname filename(1:end-4) '_1DH_cut' filename(end-3:end)],[x.' crossx.'],'precision',10,'delimiter',',')
dlmwrite([pathname filename(1:end-4) '_1DV_cut' filename(end-3:end)],[y.' crossz.'],'precision',10,'delimiter',',')
dlmwrite([pathname filename(1:end-4) '_2D' filename(end-3:end)],Anew,'precision',10,'delimiter',',')