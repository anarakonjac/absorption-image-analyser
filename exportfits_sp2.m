% exportfits_sp2.m
% Exports raw data and fits from window.


[filename, pathname] = uiputfile('*.csv','Save graph data as');

fitnewload_sp2

xlimits = get(handles.axes_1dh_sp2,'XLim');
ylimits = get(handles.axes_1dv_sp2,'XLim');

Anew_sp2 = Anew_sp2(ylimits(1):ylimits(2),xlimits(1):xlimits(2));

x = xlimits(1):xlimits(2);
y = ylimits(1):ylimits(2);

% figure(70)
% imagesc(Anew_sp2)

dlmwrite([pathname filename(1:end-4) '_1DH_sum' filename(end-3:end)],[x.' I1.'],'precision',10,'delimiter',',')
dlmwrite([pathname filename(1:end-4) '_1DV_sum' filename(end-3:end)],[y.' I2.'],'precision',10,'delimiter',',')
dlmwrite([pathname filename(1:end-4) '_1DH_cut' filename(end-3:end)],[x.' crossx.'],'precision',10,'delimiter',',')
dlmwrite([pathname filename(1:end-4) '_1DV_cut' filename(end-3:end)],[y.' crossz.'],'precision',10,'delimiter',',')
% dlmwrite([pathname filename(1:end-4) '_2D' filename(end-3:end)],Anew_sp2,'precision',10,'delimiter',',')
    
    