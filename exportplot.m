% exportplot.m
% Opens data plotter plots in a new figure for saving.

%[pdf_filename, pdf_pathname] = uiputfile('.pdf');  % No need for this
%anymore, since people can just save the image in whatever form they want.

figure(61)

getplotrange;

% Plots today's data or saved data
if plotstate == 0   % today's data
    
    
    %% Plot 1
    
    subplot(2,3,1)
    
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
    
    subplot(2,3,2)
    
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
    
    subplot(2,3,3)
    
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
    
    subplot(2,3,4)
    
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
    
    subplot(2,3,5)
    
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
    
    subplot(2,3,6)
    
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
    
else    % Export saved data
    
    if ((plotdata_sp1 == 1) && (plotdata_sp2 == 0)) || ((plotdata_sp1 == 1) && (plotdata_sp2 == 1))
        
        for ii = 1:1:length(stored_index_sp1)
            
            filenum_sp1(ii) = str2num(cell2mat((lfc_sp1{3}(stored_index_sp1(ii)))));
            variable(ii) = str2num(cell2mat((lfc_sp1{4}(stored_index_sp1(ii)))));
            NOD_sp1(ii) = str2num(cell2mat((lfc_sp1{22}(stored_index_sp1(ii)))));
            Nh_sp1(ii) = str2num(cell2mat((lfc_sp1{10}(stored_index_sp1(ii)))));
            Nv_sp1(ii) = str2num(cell2mat((lfc_sp1{11}(stored_index_sp1(ii)))));
            N_pxsum_sp1(ii) = str2num(cell2mat((lfc_sp1{23}(stored_index_sp1(ii)))));
            Th_sp1(ii) = str2num(cell2mat((lfc_sp1{24}(stored_index_sp1(ii)))));
            Tv_sp1(ii) = str2num(cell2mat((lfc_sp1{25}(stored_index_sp1(ii)))));
            PSD_sp1(ii) = str2num(cell2mat((lfc_sp1{26}(stored_index_sp1(ii)))));
            OD_sp1(ii) = str2num(cell2mat((lfc_sp1{5}(stored_index_sp1(ii)))));
            npk_sp1(ii) = str2num(cell2mat((lfc_sp1{27}(stored_index_sp1(ii)))));
            sigma_h_sp1(ii) = str2num(cell2mat((lfc_sp1{6}(stored_index_sp1(ii)))));
            sigma_v_sp1(ii) = str2num(cell2mat((lfc_sp1{7}(stored_index_sp1(ii)))));
            center_h_sp1(ii) = str2num(cell2mat((lfc_sp1{8}(stored_index_sp1(ii)))));
            center_v_sp1(ii) = str2num(cell2mat((lfc_sp1{9}(stored_index_sp1(ii)))));
            
        end
        
    end
    
    if ((plotdata_sp1 == 0) && (plotdata_sp2 == 1)) || ((plotdata_sp1 == 1) && (plotdata_sp2 == 1))
        
        for ii = 1:1:length(stored_index_sp2)
            
            filenum_sp2(ii) = str2num(cell2mat((lfc_sp2{3}(stored_index_sp2(ii)))));
            variable(ii) = str2num(cell2mat((lfc_sp2{4}(stored_index_sp2(ii)))));
            NOD_sp2(ii) = str2num(cell2mat((lfc_sp2{22}(stored_index_sp2(ii)))));
            Nh_sp2(ii) = str2num(cell2mat((lfc_sp2{10}(stored_index_sp2(ii)))));
            Nv_sp2(ii) = str2num(cell2mat((lfc_sp2{11}(stored_index_sp2(ii)))));
            N_pxsum_sp2(ii) = str2num(cell2mat((lfc_sp2{23}(stored_index_sp2(ii)))));
            Th_sp2(ii) = str2num(cell2mat((lfc_sp2{24}(stored_index_sp2(ii)))));
            Tv_sp2(ii) = str2num(cell2mat((lfc_sp2{25}(stored_index_sp2(ii)))));
            PSD_sp2(ii) = str2num(cell2mat((lfc_sp2{26}(stored_index_sp2(ii)))));
            OD_sp2(ii) = str2num(cell2mat((lfc_sp2{5}(stored_index_sp2(ii)))));
            npk_sp2(ii) = str2num(cell2mat((lfc_sp2{27}(stored_index_sp2(ii)))));
            sigma_h_sp2(ii) = str2num(cell2mat((lfc_sp2{6}(stored_index_sp2(ii)))));
            sigma_v_sp2(ii) = str2num(cell2mat((lfc_sp2{7}(stored_index_sp2(ii)))));
            center_h_sp2(ii) = str2num(cell2mat((lfc_sp2{8}(stored_index_sp2(ii)))));
            center_v_sp2(ii) = str2num(cell2mat((lfc_sp2{9}(stored_index_sp2(ii)))));
            
        end
        
    end
    
    
    %% Plot 1
    
    subplot(2,3,1)
    
    if menuvalue_x1 == 2
        x1_label = plotvariablename;
        save('maindata','x1_label','-append');
    end
    
    if menuvalue_y1 == 2
        y1_label = plotvariablename;
        save('maindata','y1_label','-append');
    end
    
    if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
        
        x1_points_sp1 = setplotvariable_saveddata(menuvalue_x1,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        y1_points_sp1 = setplotvariable_saveddata(menuvalue_y1,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        
        plot(x1_points_sp1,y1_points_sp1,'s')
        axis tight
        
    elseif (plotdata_sp1 == 0) && (plotdata_sp2 == 1)
        
        x1_points_sp2 = setplotvariable_saveddata(menuvalue_x1,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        y1_points_sp2 = setplotvariable_saveddata(menuvalue_y1,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        
        plot(x1_points_sp2,y1_points_sp2,'o','color',[217 83 25]/255)
        axis tight
        
    elseif (plotdata_sp1 == 1) && (plotdata_sp2 == 1)
        
        x1_points_sp1 = setplotvariable_saveddata(menuvalue_x1,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        y1_points_sp1 = setplotvariable_saveddata(menuvalue_y1,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        
        x1_points_sp2 = setplotvariable_saveddata(menuvalue_x1,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        y1_points_sp2 = setplotvariable_saveddata(menuvalue_y1,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        
        [hAx,hLine1,hLine2] = plotyy(x1_points_sp1,y1_points_sp1,x1_points_sp2,y1_points_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        
    end
    
    xlabel(x1_label)
    ylabel(y1_label)
    
    
    %% Plot 2
    
    subplot(2,3,2)
    
    if menuvalue_x2 == 2
        x2_label = plotvariablename;
        save('maindata','x2_label','-append');
    end
    
    if menuvalue_y2 == 2
        y2_label = plotvariablename;
        save('maindata','y2_label','-append');
    end
    
    if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
        
        x2_points_sp1 = setplotvariable_saveddata(menuvalue_x2,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        y2_points_sp1 = setplotvariable_saveddata(menuvalue_y2,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        
        plot(x2_points_sp1,y2_points_sp1,'s')
        axis tight
        
    elseif (plotdata_sp1 == 0) && (plotdata_sp2 == 1)
        
        x2_points_sp2 = setplotvariable_saveddata(menuvalue_x2,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        y2_points_sp2 = setplotvariable_saveddata(menuvalue_y2,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        
        plot(x1_points_sp2,y1_points_sp2,'o','color',[217 83 25]/255)
        axis tight
        
    elseif (plotdata_sp1 == 1) && (plotdata_sp2 == 1)
        
        x2_points_sp1 = setplotvariable_saveddata(menuvalue_x2,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        y2_points_sp1 = setplotvariable_saveddata(menuvalue_y2,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        
        x2_points_sp2 = setplotvariable_saveddata(menuvalue_x2,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        y2_points_sp2 = setplotvariable_saveddata(menuvalue_y2,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        
        [hAx,hLine1,hLine2] = plotyy(x2_points_sp1,y2_points_sp1,x2_points_sp2,y2_points_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        
    end
    
    xlabel(x2_label)
    ylabel(y2_label)
    
    
    %% Plot 3
    
    subplot(2,3,3)
    
    if menuvalue_x3 == 2
        x3_label = plotvariablename;
        save('maindata','x3_label','-append');
    end
    
    if menuvalue_y3 == 2
        y3_label = plotvariablename;
        save('maindata','y3_label','-append');
    end
    
    if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
        
        x3_points_sp1 = setplotvariable_saveddata(menuvalue_x3,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        y3_points_sp1 = setplotvariable_saveddata(menuvalue_y3,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        
        plot(x3_points_sp1,y3_points_sp1,'s')
        axis tight
        
    elseif (plotdata_sp1 == 0) && (plotdata_sp2 == 1)
        
        x3_points_sp2 = setplotvariable_saveddata(menuvalue_x3,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        y3_points_sp2 = setplotvariable_saveddata(menuvalue_y3,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        
        plot(x3_points_sp2,y3_points_sp2,'o','color',[217 83 25]/255)
        axis tight
        
    elseif (plotdata_sp1 == 1) && (plotdata_sp2 == 1)
        
        x3_points_sp1 = setplotvariable_saveddata(menuvalue_x3,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        y3_points_sp1 = setplotvariable_saveddata(menuvalue_y3,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        
        x3_points_sp2 = setplotvariable_saveddata(menuvalue_x3,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        y3_points_sp2 = setplotvariable_saveddata(menuvalue_y3,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        
        [hAx,hLine1,hLine2] = plotyy(x3_points_sp1,y3_points_sp1,x3_points_sp2,y3_points_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        
    end
    
    xlabel(x3_label)
    ylabel(y3_label)
    
    
    %% Plot 4
    
    subplot(2,3,4)
    
    if menuvalue_x4 == 2
        x4_label = plotvariablename;
        save('maindata','x4_label','-append');
    end
    
    if menuvalue_y4 == 2
        y4_label = plotvariablename;
        save('maindata','y4_label','-append');
    end
    
    if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
        
        x4_points_sp1 = setplotvariable_saveddata(menuvalue_x4,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        y4_points_sp1 = setplotvariable_saveddata(menuvalue_y4,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        
        plot(x4_points_sp1,y4_points_sp1,'s')
        axis tight
        
    elseif (plotdata_sp1 == 0) && (plotdata_sp2 == 1)
        
        x4_points_sp2 = setplotvariable_saveddata(menuvalue_x4,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        y4_points_sp2 = setplotvariable_saveddata(menuvalue_y4,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        
        plot(x4_points_sp2,y4_points_sp2,'o','color',[217 83 25]/255)
        axis tight
        
    elseif (plotdata_sp1 == 1) && (plotdata_sp2 == 1)
        
        x4_points_sp1 = setplotvariable_saveddata(menuvalue_x4,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        y4_points_sp1 = setplotvariable_saveddata(menuvalue_y4,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        
        x4_points_sp2 = setplotvariable_saveddata(menuvalue_x4,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        y4_points_sp2 = setplotvariable_saveddata(menuvalue_y4,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        
        [hAx,hLine1,hLine2] = plotyy(x4_points_sp1,y4_points_sp1,x4_points_sp2,y4_points_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        
    end
    
    xlabel(x4_label)
    ylabel(y4_label)
    
    
    %% Plot 5
    
    subplot(2,3,5)
    
    if menuvalue_x5 == 2
        x5_label = plotvariablename;
        save('maindata','x5_label','-append');
    end
    
    if menuvalue_y5 == 2
        y5_label = plotvariablename;
        save('maindata','y5_label','-append');
    end
    
    if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
        
        x5_points_sp1 = setplotvariable_saveddata(menuvalue_x5,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        y5_points_sp1 = setplotvariable_saveddata(menuvalue_y5,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        
        plot(x5_points_sp1,y5_points_sp1,'s')
        axis tight
        
    elseif (plotdata_sp1 == 0) && (plotdata_sp2 == 1)
        
        x5_points_sp2 = setplotvariable_saveddata(menuvalue_x5,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        y5_points_sp2 = setplotvariable_saveddata(menuvalue_y5,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        
        plot(x5_points_sp2,y5_points_sp2,'o','color',[217 83 25]/255)
        axis tight
        
    elseif (plotdata_sp1 == 1) && (plotdata_sp2 == 1)
        
        x5_points_sp1 = setplotvariable_saveddata(menuvalue_x5,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        y5_points_sp1 = setplotvariable_saveddata(menuvalue_y5,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        
        x5_points_sp2 = setplotvariable_saveddata(menuvalue_x5,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        y5_points_sp2 = setplotvariable_saveddata(menuvalue_y5,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        
        [hAx,hLine1,hLine2] = plotyy(x5_points_sp1,y5_points_sp1,x5_points_sp2,y5_points_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        
    end
    
    xlabel(x5_label)
    ylabel(y5_label)
    
    
    %% Plot 6
    
    subplot(2,3,6)
    
    if menuvalue_x6 == 2
        x6_label = plotvariablename;
        save('maindata','x6_label','-append');
    end
    
    if menuvalue_y6 == 2
        y6_label = plotvariablename;
        save('maindata','y6_label','-append');
    end
    
    if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
        
        x6_points_sp1 = setplotvariable_saveddata(menuvalue_x6,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        y6_points_sp1 = setplotvariable_saveddata(menuvalue_y6,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        
        plot(x6_points_sp1,y6_points_sp1,'s')
        axis tight
        
    elseif (plotdata_sp1 == 0) && (plotdata_sp2 == 1)
        
        x6_points_sp2 = setplotvariable_saveddata(menuvalue_x6,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        y6_points_sp2 = setplotvariable_saveddata(menuvalue_y6,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        
        plot(x6_points_sp2,y6_points_sp2,'o','color',[217 83 25]/255)
        axis tight
        
    elseif (plotdata_sp1 == 1) && (plotdata_sp2 == 1)
        
        x6_points_sp1 = setplotvariable_saveddata(menuvalue_x6,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        y6_points_sp1 = setplotvariable_saveddata(menuvalue_y6,filenum_sp1,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1);
        
        x6_points_sp2 = setplotvariable_saveddata(menuvalue_x6,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        y6_points_sp2 = setplotvariable_saveddata(menuvalue_y6,filenum_sp2,variable,NOD_sp2,Nh_sp2,Nv_sp2,N_pxsum_sp2,Th_sp2,Tv_sp2,PSD_sp2,OD_sp2,npk_sp2,sigma_h_sp2,sigma_v_sp2,center_h_sp2,center_v_sp2);
        
        [hAx,hLine1,hLine2] = plotyy(x6_points_sp1,y6_points_sp1,x6_points_sp2,y6_points_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        
    end
    
    xlabel(x6_label)
    ylabel(y6_label)
    
end
    