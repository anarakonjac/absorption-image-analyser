% updateplottab.m
% Automatically updates plot tab as data is collected.
%
% What thing is plotted?
% 1 = counter_store
% 2 = variable_store
% 3 = NOD_store_sp1
% 4 = Nh_store_sp1
% 5 = Nv_store_sp1
% 6 = N_pxsum_store_sp1
% 7 = Th_store_sp1
% 8 = Tv_store_sp1
% 9 = PSD_store_sp1
% 10 = OD_store_sp1
% 11 = npk_store_sp1
% 12 = sigma_h_store_sp1
% 13 = sigma_v_store_sp1
% 14 = center_h_store_sp1
% 15 = center_v_store_sp1
%
% Use above for argument in setplotvariable(menuvalue).
% If you want to add more variables, then edit the menu and
% "setplotvariable" accordingly.

getplotrange;   % grabs plot range from text box


%% Plot 1

axes(handles.dataplot1);

if menuvalue_x1 == 2
    x1_label = plotvariablename;
    save('maindata','x1_label','-append');
end

if menuvalue_y1 == 2
    y1_label = plotvariablename;
    save('maindata','y1_label','-append');
end

[x1_points_sp1, x1_points_sp2] = setplotvariable(menuvalue_x1,sepspecies,plotspecies2);
[y1_points_sp1, y1_points_sp2] = setplotvariable(menuvalue_y1,sepspecies,plotspecies2);

if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
    
    plot(x1_points_sp1(stored_index_sp1),y1_points_sp1(stored_index_sp1),'s')   
    axis tight
    
end
    
if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 0)
    
    plot(x1_points_sp2(stored_index_sp2),y1_points_sp2(stored_index_sp2),'o','color',[217 83 25]/255)
    axis tight
    
end
        
if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 1)
    
    [hAx,hLine1,hLine2] = plotyy(x1_points_sp1(stored_index_sp1),y1_points_sp1(stored_index_sp1),x1_points_sp2(stored_index_sp2),y1_points_sp2(stored_index_sp2));
    hLine1.Marker = 's';
    hLine2.Marker = 'o';
    hLine1.LineStyle = 'none';
    hLine2.LineStyle = 'none';
    axis tight
    
end

xlabel(x1_label)
ylabel(y1_label)


%% Plot 2

axes(handles.dataplot2);

if menuvalue_x2 == 2
    x2_label = plotvariablename;
    save('maindata','x2_label','-append');
end

if menuvalue_y2 == 2
    y2_label = plotvariablename;
    save('maindata','y2_label','-append');
end

[x2_points_sp1, x2_points_sp2] = setplotvariable(menuvalue_x2,sepspecies,plotspecies2);
[y2_points_sp1, y2_points_sp2] = setplotvariable(menuvalue_y2,sepspecies,plotspecies2);

if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
    
    plot(x2_points_sp1(stored_index_sp1),y2_points_sp1(stored_index_sp1),'s')
    axis tight
    
end
    
if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 0)
    
    plot(x2_points_sp2(stored_index_sp2),y2_points_sp2(stored_index_sp2),'o','color',[217 83 25]/255)
    axis tight
    
end

if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 1)
    
    [hAx,hLine1,hLine2] = plotyy(x2_points_sp1(stored_index_sp1),y2_points_sp1(stored_index_sp1),x2_points_sp2(stored_index_sp2),y2_points_sp2(stored_index_sp2));
    hLine1.Marker = 's';
    hLine2.Marker = 'o';
    hLine1.LineStyle = 'none';
    hLine2.LineStyle = 'none';
    axis tight
    
end

xlabel(x2_label)
ylabel(y2_label)


%% Plot 3

axes(handles.dataplot3);

if menuvalue_x3 == 2
    x3_label = plotvariablename;
    save('maindata','x3_label','-append');
end

if menuvalue_y3 == 2
    y3_label = plotvariablename;
    save('maindata','y3_label','-append');
end

[x3_points_sp1, x3_points_sp2] = setplotvariable(menuvalue_x3,sepspecies,plotspecies2);
[y3_points_sp1, y3_points_sp2] = setplotvariable(menuvalue_y3,sepspecies,plotspecies2);

if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
    
    plot(x3_points_sp1(stored_index_sp1),y3_points_sp1(stored_index_sp1),'s')
    axis tight
    
end
    
if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 0) 
    
    plot(x3_points_sp2(stored_index_sp2),y3_points_sp2(stored_index_sp2),'o','color',[217 83 25]/255)
    axis tight
    
end
        
if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 1)
        
    [hAx,hLine1,hLine2] = plotyy(x3_points_sp1(stored_index_sp1),y3_points_sp1(stored_index_sp1),x3_points_sp2(stored_index_sp2),y3_points_sp2(stored_index_sp2));
    hLine1.Marker = 's';
    hLine2.Marker = 'o';
    hLine1.LineStyle = 'none';
    hLine2.LineStyle = 'none';
    axis tight
    
end

xlabel(x3_label)
ylabel(y3_label)


%% Plot 4

axes(handles.dataplot4);

if menuvalue_x4 == 2
    x4_label = plotvariablename;
    save('maindata','x4_label','-append');
end

if menuvalue_y4 == 2
    y4_label = plotvariablename;
    save('maindata','y4_label','-append');
end

[x4_points_sp1, x4_points_sp2] = setplotvariable(menuvalue_x4,sepspecies,plotspecies2);
[y4_points_sp1, y4_points_sp2] = setplotvariable(menuvalue_y4,sepspecies,plotspecies2);

if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
    
    plot(x4_points_sp1(stored_index_sp1),y4_points_sp1(stored_index_sp1),'s')
    axis tight
    
end
    
if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 0)
    
    plot(x4_points_sp2(stored_index_sp2),y4_points_sp2(stored_index_sp2),'o','color',[217 83 25]/255)
    axis tight
    
end
        
if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 1)
    
    [hAx,hLine1,hLine2] = plotyy(x4_points_sp1(stored_index_sp1),y4_points_sp1(stored_index_sp1),x4_points_sp2(stored_index_sp2),y4_points_sp2(stored_index_sp2));
    hLine1.Marker = 's';
    hLine2.Marker = 'o';
    hLine1.LineStyle = 'none';
    hLine2.LineStyle = 'none';
    axis tight
    
end

xlabel(x4_label)
ylabel(y4_label)


%% Plot 5

axes(handles.dataplot5);

if menuvalue_x5 == 2
    x5_label = plotvariablename;
    save('maindata','x5_label','-append');
end

if menuvalue_y5 == 2
    y5_label = plotvariablename;
    save('maindata','y5_label','-append');
end

[x5_points_sp1, x5_points_sp2] = setplotvariable(menuvalue_x5,sepspecies,plotspecies2);
[y5_points_sp1, y5_points_sp2] = setplotvariable(menuvalue_y5,sepspecies,plotspecies2);

if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
    
    plot(x5_points_sp1(stored_index_sp1),y5_points_sp1(stored_index_sp1),'s')
    axis tight
    
end
    
if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 0)
    
    plot(x5_points_sp2(stored_index_sp2),y5_points_sp2(stored_index_sp2),'o','color',[217 83 25]/255)
    axis tight
    
end
        
if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 1)
    
    [hAx,hLine1,hLine2] = plotyy(x5_points_sp1(stored_index_sp1),y5_points_sp1(stored_index_sp1),x5_points_sp2(stored_index_sp2),y5_points_sp2(stored_index_sp2));
    hLine1.Marker = 's';
    hLine2.Marker = 'o';
    hLine1.LineStyle = 'none';
    hLine2.LineStyle = 'none';
    axis tight
    
end

xlabel(x5_label)
ylabel(y5_label)


%% Plot 6

axes(handles.dataplot6);

if menuvalue_x6 == 2
    x6_label = plotvariablename;
    save('maindata','x6_label','-append');
end

if menuvalue_y6 == 2
    y6_label = plotvariablename;
    save('maindata','y6_label','-append');
end

[x6_points_sp1, x6_points_sp2] = setplotvariable(menuvalue_x6,sepspecies,plotspecies2);
[y6_points_sp1, y6_points_sp2] = setplotvariable(menuvalue_y6,sepspecies,plotspecies2);

if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
    
    plot(x6_points_sp1(stored_index_sp1),y6_points_sp1(stored_index_sp1),'s')
    axis tight
    
end
    
if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 0)
    
    plot(x6_points_sp2(stored_index_sp2),y6_points_sp2(stored_index_sp2),'o','color',[217 83 25]/255)
    axis tight
    
end

if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 1)
    
    [hAx,hLine1,hLine2] = plotyy(x6_points_sp1(stored_index_sp1),y6_points_sp1(stored_index_sp1),x6_points_sp2(stored_index_sp2),y6_points_sp2(stored_index_sp2));
    hLine1.Marker = 's';
    hLine2.Marker = 'o';
    hLine1.LineStyle = 'none';
    hLine2.LineStyle = 'none';
    axis tight
    
end

xlabel(x6_label)
ylabel(y6_label)
