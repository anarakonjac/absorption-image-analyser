% ploteverything.m
% Plots all plottable data vs variable_plotall_sp1 in a seperate figure, ready for
% printing on a landscape A4 page.

getplotrange;

fig = figure(423);
set(fig,'units','centimeters','position',[5 5 29.7 21.0]);   % [left bottom width height]


%% Plotting today's data

if plotstate == 0   % today's data
    
    
    %% Species 1 only
    
    if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)   % Plot species 1 only
        
        % Load things to plot
        NOD_plotall_sp1 = NOD_store_sp1(stored_index_sp1);
        Nx_plotall_sp1 = Nh_store_sp1(stored_index_sp1);
        Nz_plotall_sp1 = Nv_store_sp1(stored_index_sp1);
        N_pxsum_plotall_sp1 = N_pxsum_store_sp1(stored_index_sp1);
        Tx_plotall_sp1 = Th_store_sp1(stored_index_sp1);
        Tz_plotall_sp1 = Tv_store_sp1(stored_index_sp1);
        sigma_x_plotall_sp1 = sigma_h_store_sp1(stored_index_sp1);
        sigma_z_plotall_sp1 = sigma_v_store_sp1(stored_index_sp1);
        center_x_plotall_sp1 = center_h_store_sp1(stored_index_sp1);
        center_z_plotall_sp1 = center_v_store_sp1(stored_index_sp1);
        OD_plotall_sp1 = OD_store_sp1(stored_index_sp1);
        PSD_plotall_sp1 = PSD_store_sp1(stored_index_sp1);
        npk_plotall_sp1 = npk_store_sp1(stored_index_sp1);
        variable_plotall_sp1 = variable_store_sp1(stored_index_sp1);
        
        
        % Row 1
        
        subplot('position',[0.07 0.77 0.25 0.2])
        plot(variable_plotall_sp1,NOD_plotall_sp1,'s')
        ylabel('N_{OD}')
        
        subplot('position',[0.07 0.53 0.25 0.2])
        plot(variable_plotall_sp1,Nx_plotall_sp1,'s')
        ylabel('N_x')
        
        subplot('position',[0.07 0.3 0.25 0.2])
        plot(variable_plotall_sp1,Nz_plotall_sp1,'s')
        ylabel('N_z')
        
        subplot('position',[0.07 0.07 0.25 0.2])
        plot(variable_plotall_sp1,N_pxsum_plotall_sp1,'s')
        xlabel(plotvariablename)
        ylabel('N_{pxsum}')
        
        % Row 2
        
        subplot('position',[0.385 0.77 0.25 0.2])
        plot(variable_plotall_sp1,Tx_plotall_sp1,'s')
        ylabel('T_x (\muK)')
        %title(filename);
        
        subplot('position',[0.385 0.53 0.25 0.2])
        plot(variable_plotall_sp1,Tz_plotall_sp1,'s')
        ylabel('T_z (\muK)')
        
        subplot('position',[0.385 0.3 0.25 0.2])
        plot(variable_plotall_sp1,sigma_x_plotall_sp1,'s')
        ylabel('\sigma_x (px)')
        
        subplot('position',[0.385 0.07 0.25 0.2])
        plot(variable_plotall_sp1,sigma_z_plotall_sp1,'s')
        xlabel(plotvariablename)
        ylabel('\sigma_z (px)')
        
        % Row 3
        
        subplot('position',[0.7 0.82 0.25 0.15])
        plot(variable_plotall_sp1,center_x_plotall_sp1,'s')
        ylabel('x (px)')
        
        subplot('position',[0.7 0.635 0.25 0.15])
        plot(variable_plotall_sp1,center_z_plotall_sp1,'s')
        ylabel('z (px)')
        
        subplot('position',[0.7 0.45 0.25 0.15])
        plot(variable_plotall_sp1,OD_plotall_sp1,'s')
        ylabel('OD')
        
        subplot('position',[0.7 0.26 0.25 0.15])
        plot(variable_plotall_sp1,PSD_plotall_sp1,'s')
        ylabel('PSD')
        
        subplot('position',[0.7 0.07 0.25 0.15])
        plot(variable_plotall_sp1,npk_plotall_sp1,'s')
        xlabel(plotvariablename)
        ylabel('n_{pk}')
        
    end
    
    
    %% Species 2 only
    
    if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 0)    % plot species 2 only
        
        % Load things to plot
        NOD_plotall_sp2 = NOD_store_sp2(stored_index_sp2);
        Nx_plotall_sp2 = Nh_store_sp2(stored_index_sp2);
        Nz_plotall_sp2 = Nv_store_sp2(stored_index_sp2);
        N_pxsum_plotall_sp2 = N_pxsum_store_sp2(stored_index_sp2);
        Tx_plotall_sp2 = Th_store_sp2(stored_index_sp2);
        Tz_plotall_sp2 = Tv_store_sp2(stored_index_sp2);
        sigma_x_plotall_sp2 = sigma_h_store_sp2(stored_index_sp2);
        sigma_z_plotall_sp2 = sigma_v_store_sp2(stored_index_sp2);
        center_x_plotall_sp2 = center_h_store_sp2(stored_index_sp2);
        center_z_plotall_sp2 = center_v_store_sp2(stored_index_sp2);
        OD_plotall_sp2 = OD_store_sp2(stored_index_sp2);
        PSD_plotall_sp2 = PSD_store_sp2(stored_index_sp2);
        npk_plotall_sp2 = npk_store_sp2(stored_index_sp2);
        variable_plotall_sp2 = variable_store_sp2(stored_index_sp2);
        
        
        % Row 1
        
        subplot('position',[0.07 0.77 0.25 0.2])
        plot(variable_plotall_sp2,NOD_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('N_{OD}')
        
        subplot('position',[0.07 0.53 0.25 0.2])
        plot(variable_plotall_sp2,Nx_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('N_x')
        
        subplot('position',[0.07 0.3 0.25 0.2])
        plot(variable_plotall_sp2,Nz_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('N_z')
        
        subplot('position',[0.07 0.07 0.25 0.2])
        plot(variable_plotall_sp2,N_pxsum_plotall_sp2,'o','color',[217 83 25]/255)
        xlabel(plotvariablename)
        ylabel('N_{pxsum}')
        
        % Row 2
        
        subplot('position',[0.385 0.77 0.25 0.2])
        plot(variable_plotall_sp2,Tx_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('T_x (\muK)')
        %title(filename);
        
        subplot('position',[0.385 0.53 0.25 0.2])
        plot(variable_plotall_sp2,Tz_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('T_z (\muK)')
        
        subplot('position',[0.385 0.3 0.25 0.2])
        plot(variable_plotall_sp2,sigma_x_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('\sigma_x (px)')
        
        subplot('position',[0.385 0.07 0.25 0.2])
        plot(variable_plotall_sp2,sigma_z_plotall_sp2,'o','color',[217 83 25]/255)
        xlabel(plotvariablename)
        ylabel('\sigma_z (px)')
        
        % Row 3
        
        subplot('position',[0.7 0.82 0.25 0.15])
        plot(variable_plotall_sp2,center_x_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('x (px)')
        
        subplot('position',[0.7 0.635 0.25 0.15])
        plot(variable_plotall_sp2,center_z_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('z (px)')
        
        subplot('position',[0.7 0.45 0.25 0.15])
        plot(variable_plotall_sp2,OD_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('OD')
        
        subplot('position',[0.7 0.26 0.25 0.15])
        plot(variable_plotall_sp2,PSD_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('PSD')
        
        subplot('position',[0.7 0.07 0.25 0.15])
        plot(variable_plotall_sp2,npk_plotall_sp2,'o','color',[217 83 25]/255)
        xlabel(plotvariablename)
        ylabel('n_{pk}')
                
    end
    
    
    %% Plot both species
    
    if (plotspecies2 == 1) && (plotdata_sp2 == 1) && (plotdata_sp1 == 1)    % Plot species 1 and 2
        
        % Load things to plot - species 1
        NOD_plotall_sp1 = NOD_store_sp1(stored_index_sp1);
        Nx_plotall_sp1 = Nh_store_sp1(stored_index_sp1);
        Nz_plotall_sp1 = Nv_store_sp1(stored_index_sp1);
        N_pxsum_plotall_sp1 = N_pxsum_store_sp1(stored_index_sp1);
        Tx_plotall_sp1 = Th_store_sp1(stored_index_sp1);
        Tz_plotall_sp1 = Tv_store_sp1(stored_index_sp1);
        sigma_x_plotall_sp1 = sigma_h_store_sp1(stored_index_sp1);
        sigma_z_plotall_sp1 = sigma_v_store_sp1(stored_index_sp1);
        center_x_plotall_sp1 = center_h_store_sp1(stored_index_sp1);
        center_z_plotall_sp1 = center_v_store_sp1(stored_index_sp1);
        OD_plotall_sp1 = OD_store_sp1(stored_index_sp1);
        PSD_plotall_sp1 = PSD_store_sp1(stored_index_sp1);
        npk_plotall_sp1 = npk_store_sp1(stored_index_sp1);
        variable_plotall_sp1 = variable_store_sp1(stored_index_sp1);
        
        % Load things to plot - species 2
        NOD_plotall_sp2 = NOD_store_sp2(stored_index_sp2);
        Nx_plotall_sp2 = Nh_store_sp2(stored_index_sp2);
        Nz_plotall_sp2 = Nv_store_sp2(stored_index_sp2);
        N_pxsum_plotall_sp2 = N_pxsum_store_sp2(stored_index_sp2);
        Tx_plotall_sp2 = Th_store_sp2(stored_index_sp2);
        Tz_plotall_sp2 = Tv_store_sp2(stored_index_sp2);
        sigma_x_plotall_sp2 = sigma_h_store_sp2(stored_index_sp2);
        sigma_z_plotall_sp2 = sigma_v_store_sp2(stored_index_sp2);
        center_x_plotall_sp2 = center_h_store_sp2(stored_index_sp2);
        center_z_plotall_sp2 = center_v_store_sp2(stored_index_sp2);
        OD_plotall_sp2 = OD_store_sp2(stored_index_sp2);
        PSD_plotall_sp2 = PSD_store_sp2(stored_index_sp2);
        npk_plotall_sp2 = npk_store_sp2(stored_index_sp2);
        variable_plotall_sp2 = variable_store_sp2(stored_index_sp2);
        
        % Row 1
        
        subplot('position',[0.07 0.77 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,NOD_plotall_sp1,variable_plotall_sp2,NOD_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('N_{OD}')
        
        subplot('position',[0.07 0.53 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,Nx_plotall_sp1,variable_plotall_sp2,Nx_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('N_x')
        
        subplot('position',[0.07 0.3 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,Nz_plotall_sp1,variable_plotall_sp2,Nz_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('N_z')
        
        subplot('position',[0.07 0.07 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,N_pxsum_plotall_sp1,variable_plotall_sp2,N_pxsum_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        xlabel(plotvariablename)
        ylabel('N_{pxsum}')
        
        % Row 2
        
        subplot('position',[0.385 0.77 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,Tx_plotall_sp1,variable_plotall_sp2,Tx_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('T_x (\muK)')
        %title(filename);
        
        subplot('position',[0.385 0.53 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,Tz_plotall_sp1,variable_plotall_sp2,Tz_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('T_z (\muK)')
        
        subplot('position',[0.385 0.3 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,sigma_x_plotall_sp1,variable_plotall_sp2,sigma_x_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('\sigma_x (px)')
        
        subplot('position',[0.385 0.07 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,sigma_z_plotall_sp1,variable_plotall_sp2,sigma_z_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        xlabel(plotvariablename)
        ylabel('\sigma_z (px)')
        
        % Row 3
        
        subplot('position',[0.7 0.82 0.25 0.15])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,center_x_plotall_sp1,variable_plotall_sp2,center_x_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('x (px)')
        
        subplot('position',[0.7 0.635 0.25 0.15])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,center_z_plotall_sp1,variable_plotall_sp2,center_z_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('z (px)')
        
        subplot('position',[0.7 0.45 0.25 0.15])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,OD_plotall_sp1,variable_plotall_sp2,OD_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('OD')
        
        subplot('position',[0.7 0.26 0.25 0.15])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,PSD_plotall_sp1,variable_plotall_sp2,PSD_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('PSD')
        
        subplot('position',[0.7 0.07 0.25 0.15])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,npk_plotall_sp1,variable_plotall_sp2,npk_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        xlabel(plotvariablename)
        ylabel('n_{pk}')
        
    end
    
else
    
    
    %% Plotting saved data
    
    if ((plotdata_sp1 == 1) && (plotdata_sp2 == 0)) || ((plotdata_sp1 == 1) && (plotdata_sp2 == 1))
        
        for ii = 1:1:length(stored_index_sp1)
            
            variable_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{4}(stored_index_sp1(ii)))));
            NOD_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{22}(stored_index_sp1(ii)))));
            Nx_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{10}(stored_index_sp1(ii)))));
            Nz_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{11}(stored_index_sp1(ii)))));
            N_pxsum_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{23}(stored_index_sp1(ii)))));
            Tx_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{24}(stored_index_sp1(ii)))));
            Tz_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{25}(stored_index_sp1(ii)))));
            PSD_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{26}(stored_index_sp1(ii)))));
            OD_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{5}(stored_index_sp1(ii)))));
            npk_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{27}(stored_index_sp1(ii)))));
            sigma_x_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{6}(stored_index_sp1(ii)))));
            sigma_z_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{7}(stored_index_sp1(ii)))));
            center_x_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{8}(stored_index_sp1(ii)))));
            center_z_plotall_sp1(ii) = str2num(cell2mat((lfc_sp1{9}(stored_index_sp1(ii)))));
            
        end
        
    end
    
    if ((plotdata_sp1 == 0) && (plotdata_sp2 == 1)) || ((plotdata_sp1 == 1) && (plotdata_sp2 == 1))
        
        for ii = 1:1:length(stored_index_sp2)
            
            variable_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{4}(stored_index_sp2(ii)))));
            NOD_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{22}(stored_index_sp2(ii)))));
            Nx_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{10}(stored_index_sp2(ii)))));
            Nz_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{11}(stored_index_sp2(ii)))));
            N_pxsum_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{23}(stored_index_sp2(ii)))));
            Tx_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{24}(stored_index_sp2(ii)))));
            Tz_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{25}(stored_index_sp2(ii)))));
            PSD_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{26}(stored_index_sp2(ii)))));
            OD_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{5}(stored_index_sp2(ii)))));
            npk_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{27}(stored_index_sp2(ii)))));
            sigma_x_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{6}(stored_index_sp2(ii)))));
            sigma_z_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{7}(stored_index_sp2(ii)))));
            center_x_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{8}(stored_index_sp2(ii)))));
            center_z_plotall_sp2(ii) = str2num(cell2mat((lfc_sp2{9}(stored_index_sp2(ii)))));
            
        end
        
    end
    
    
    %% Plot species 1 only
    
    if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
        
        % Row 1
        
        subplot('position',[0.07 0.77 0.25 0.2])
        plot(variable_plotall_sp1,NOD_plotall_sp1,'s')
        ylabel('N_{OD}')
        
        subplot('position',[0.07 0.53 0.25 0.2])
        plot(variable_plotall_sp1,Nx_plotall_sp1,'s')
        ylabel('N_x')
        
        subplot('position',[0.07 0.3 0.25 0.2])
        plot(variable_plotall_sp1,Nz_plotall_sp1,'s')
        ylabel('N_z')
        
        subplot('position',[0.07 0.07 0.25 0.2])
        plot(variable_plotall_sp1,N_pxsum_plotall_sp1,'s')
        xlabel(plotvariablename)
        ylabel('N_{pxsum}')
        
        % Row 2
        
        subplot('position',[0.385 0.77 0.25 0.2])
        plot(variable_plotall_sp1,Tx_plotall_sp1,'s')
        ylabel('T_x (\muK)')
        %title(filename);
        
        subplot('position',[0.385 0.53 0.25 0.2])
        plot(variable_plotall_sp1,Tz_plotall_sp1,'s')
        ylabel('T_z (\muK)')
        
        subplot('position',[0.385 0.3 0.25 0.2])
        plot(variable_plotall_sp1,sigma_x_plotall_sp1,'s')
        ylabel('\sigma_x (px)')
        
        subplot('position',[0.385 0.07 0.25 0.2])
        plot(variable_plotall_sp1,sigma_z_plotall_sp1,'s')
        xlabel(plotvariablename)
        ylabel('\sigma_z (px)')
        
        % Row 3
        
        subplot('position',[0.7 0.82 0.25 0.15])
        plot(variable_plotall_sp1,center_x_plotall_sp1,'s')
        ylabel('x (px)')
        
        subplot('position',[0.7 0.635 0.25 0.15])
        plot(variable_plotall_sp1,center_z_plotall_sp1,'s')
        ylabel('z (px)')
        
        subplot('position',[0.7 0.45 0.25 0.15])
        plot(variable_plotall_sp1,OD_plotall_sp1,'s')
        ylabel('OD')
        
        subplot('position',[0.7 0.26 0.25 0.15])
        plot(variable_plotall_sp1,PSD_plotall_sp1,'s')
        ylabel('PSD')
        
        subplot('position',[0.7 0.07 0.25 0.15])
        plot(variable_plotall_sp1,npk_plotall_sp1,'s')
        xlabel(plotvariablename)
        ylabel('n_{pk}')
        
    end
    
    
    %% Plot species 2 only
    
    if (plotdata_sp1 == 0) && (plotdata_sp2 == 1)
        
        % Row 1
        
        subplot('position',[0.07 0.77 0.25 0.2])
        plot(variable_plotall_sp2,NOD_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('N_{OD}')
        
        subplot('position',[0.07 0.53 0.25 0.2])
        plot(variable_plotall_sp2,Nx_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('N_x')
        
        subplot('position',[0.07 0.3 0.25 0.2])
        plot(variable_plotall_sp2,Nz_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('N_z')
        
        subplot('position',[0.07 0.07 0.25 0.2])
        plot(variable_plotall_sp2,N_pxsum_plotall_sp2,'o','color',[217 83 25]/255)
        xlabel(plotvariablename)
        ylabel('N_{pxsum}')
        
        % Row 2
        
        subplot('position',[0.385 0.77 0.25 0.2])
        plot(variable_plotall_sp2,Tx_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('T_x (\muK)')
        %title(filename);
        
        subplot('position',[0.385 0.53 0.25 0.2])
        plot(variable_plotall_sp2,Tz_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('T_z (\muK)')
        
        subplot('position',[0.385 0.3 0.25 0.2])
        plot(variable_plotall_sp2,sigma_x_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('\sigma_x (px)')
        
        subplot('position',[0.385 0.07 0.25 0.2])
        plot(variable_plotall_sp2,sigma_z_plotall_sp2,'o','color',[217 83 25]/255)
        xlabel(plotvariablename)
        ylabel('\sigma_z (px)')
        
        % Row 3
        
        subplot('position',[0.7 0.82 0.25 0.15])
        plot(variable_plotall_sp2,center_x_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('x (px)')
        
        subplot('position',[0.7 0.635 0.25 0.15])
        plot(variable_plotall_sp2,center_z_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('z (px)')
        
        subplot('position',[0.7 0.45 0.25 0.15])
        plot(variable_plotall_sp2,OD_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('OD')
        
        subplot('position',[0.7 0.26 0.25 0.15])
        plot(variable_plotall_sp2,PSD_plotall_sp2,'o','color',[217 83 25]/255)
        ylabel('PSD')
        
        subplot('position',[0.7 0.07 0.25 0.15])
        plot(variable_plotall_sp2,npk_plotall_sp2,'o','color',[217 83 25]/255)
        xlabel(plotvariablename)
        ylabel('n_{pk}')
                
    end
    
    
    %% Plot both species
    
    if (plotdata_sp1 == 1) && (plotdata_sp2 == 1)
    
    % Row 1
        
        subplot('position',[0.07 0.77 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,NOD_plotall_sp1,variable_plotall_sp2,NOD_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('N_{OD}')
        
        subplot('position',[0.07 0.53 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,Nx_plotall_sp1,variable_plotall_sp2,Nx_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('N_x')
        
        subplot('position',[0.07 0.3 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,Nz_plotall_sp1,variable_plotall_sp2,Nz_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('N_z')
        
        subplot('position',[0.07 0.07 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,N_pxsum_plotall_sp1,variable_plotall_sp2,N_pxsum_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        xlabel(plotvariablename)
        ylabel('N_{pxsum}')
        
        % Row 2
        
        subplot('position',[0.385 0.77 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,Tx_plotall_sp1,variable_plotall_sp2,Tx_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('T_x (\muK)')
        %title(filename);
        
        subplot('position',[0.385 0.53 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,Tz_plotall_sp1,variable_plotall_sp2,Tz_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('T_z (\muK)')
        
        subplot('position',[0.385 0.3 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,sigma_x_plotall_sp1,variable_plotall_sp2,sigma_x_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('\sigma_x (px)')
        
        subplot('position',[0.385 0.07 0.25 0.2])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,sigma_z_plotall_sp1,variable_plotall_sp2,sigma_z_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        xlabel(plotvariablename)
        ylabel('\sigma_z (px)')
        
        % Row 3
        
        subplot('position',[0.7 0.82 0.25 0.15])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,center_x_plotall_sp1,variable_plotall_sp2,center_x_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('x (px)')
        
        subplot('position',[0.7 0.635 0.25 0.15])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,center_z_plotall_sp1,variable_plotall_sp2,center_z_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('z (px)')
        
        subplot('position',[0.7 0.45 0.25 0.15])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,OD_plotall_sp1,variable_plotall_sp2,OD_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('OD')
        
        subplot('position',[0.7 0.26 0.25 0.15])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,PSD_plotall_sp1,variable_plotall_sp2,PSD_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        ylabel('PSD')
        
        subplot('position',[0.7 0.07 0.25 0.15])
        [hAx,hLine1,hLine2] = plotyy(variable_plotall_sp1,npk_plotall_sp1,variable_plotall_sp2,npk_plotall_sp2);
        hLine1.Marker = 's';
        hLine2.Marker = 'o';
        hLine1.LineStyle = 'none';
        hLine2.LineStyle = 'none';
        axis tight
        xlabel(plotvariablename)
        ylabel('n_{pk}')
        
    end
    
end