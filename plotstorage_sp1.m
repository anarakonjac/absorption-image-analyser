% plotstorage_sp1.m
% Stores variables for data plotter.

if ~exist('dataplotterstore.mat','file')   % Make a new file if one doesn't exist already. Used for the first shot of the day.
    
    NOD_store_sp1 = NOD;
    Nh_store_sp1 = Nh;
    Nv_store_sp1 = Nv;
    N_pxsum_store_sp1 = N_pxsum;
    
    Th_store_sp1 = Th;
    Tv_store_sp1 = Tv;
    
    PSD_store_sp1 = psdensity;
    OD_store_sp1 = opticaldepth;
    npk_store_sp1 = npk;
    
    sigma_h_store_sp1 = horizontalsize;
    sigma_v_store_sp1 = verticalsize;
    
    center_h_store_sp1 = cx(3);
    center_v_store_sp1 = cz(3);
    
    variable_store_sp1 = variableValue;
    
    if (dextersyncValue == 0)
        counter_store_sp1 = counterManual;  % Should be used for testing only!
    else
        counter_store_sp1 = counterDexter;
    end
    
    save('dataplotterstore','variable_store_sp1','NOD_store_sp1','Nh_store_sp1','Nv_store_sp1','N_pxsum_store_sp1','Th_store_sp1','Tv_store_sp1','PSD_store_sp1','OD_store_sp1','npk_store_sp1','sigma_h_store_sp1','sigma_v_store_sp1','center_h_store_sp1','center_v_store_sp1','counter_store_sp1');
    
else
    
    load dataplotterstore.mat
    
    if ~exist('NOD_store_sp1','var')
        
        NOD_store_sp1 = [];
        Nh_store_sp1 = [];
        Nv_store_sp1 = [];
        N_pxsum_store_sp1 = [];        
        Th_store_sp1 = [];
        Tv_store_sp1 = [];        
        PSD_store_sp1 = [];
        OD_store_sp1 = [];
        npk_store_sp1 = [];        
        sigma_h_store_sp1 = [];
        sigma_v_store_sp1 = [];        
        center_h_store_sp1 = [];
        center_v_store_sp1 = [];        
        variable_store_sp1 = [];
        counter_store_sp1 = [];
            
    end
    
    if (keepROI_option_sp1 == 1) || (handles.setROI_pressed_sp1 == 1) || (handles.zoomout_pressed_sp1 == 1) || (handles.fr_pressed_sp1 == 1)
    % Used for when the ROI is selected or "zoom out" is pressed, so new
    % entries aren't created.
        
        NOD_store_sp1(end) = NOD;
        Nh_store_sp1(end) = Nh;
        Nv_store_sp1(end) = Nv;
        N_pxsum_store_sp1(end) = N_pxsum;
        
        Th_store_sp1(end) = Th;
        Tv_store_sp1(end) = Tv;
        
        PSD_store_sp1(end) = psdensity;
        OD_store_sp1(end) = opticaldepth;
        npk_store_sp1(end) = npk;
        
        sigma_h_store_sp1(end) = horizontalsize;
        sigma_v_store_sp1(end) = verticalsize;
        
        center_h_store_sp1(end) = cx(3);
        center_v_store_sp1(end) = cz(3);
        
        variable_store_sp1(end) = variableValue;
        
        save('dataplotterstore','variable_store_sp1','NOD_store_sp1','Nh_store_sp1','Nv_store_sp1','N_pxsum_store_sp1','Th_store_sp1','Tv_store_sp1','PSD_store_sp1','OD_store_sp1','npk_store_sp1','sigma_h_store_sp1','sigma_v_store_sp1','center_h_store_sp1','center_v_store_sp1','-append');
        
    else
        
        NOD_store_sp1 = [NOD_store_sp1 NOD];
        Nh_store_sp1 = [Nh_store_sp1 Nh];
        Nv_store_sp1 = [Nv_store_sp1 Nv];
        N_pxsum_store_sp1 = [N_pxsum_store_sp1 N_pxsum];
        
        Th_store_sp1 = [Th_store_sp1 Th];
        Tv_store_sp1 = [Tv_store_sp1 Tv];
        
        PSD_store_sp1 = [PSD_store_sp1 psdensity];
        OD_store_sp1 = [OD_store_sp1 opticaldepth];
        npk_store_sp1 = [npk_store_sp1 npk];
        
        sigma_h_store_sp1 = [sigma_h_store_sp1 horizontalsize];
        sigma_v_store_sp1 = [sigma_v_store_sp1 verticalsize];
        
        center_h_store_sp1 = [center_h_store_sp1 cx(3)];
        center_v_store_sp1 = [center_v_store_sp1 cz(3)];
        
        variable_store_sp1 = [variable_store_sp1 variableValue];
        
        if (dextersyncValue == 0)
            
            counter_store_sp1 = [counter_store_sp1 counterManual];  % Should be used for testing only!
            save('dataplotterstore','variable_store_sp1','NOD_store_sp1','Nh_store_sp1','Nv_store_sp1','N_pxsum_store_sp1','Th_store_sp1','Tv_store_sp1','PSD_store_sp1','OD_store_sp1','npk_store_sp1','sigma_h_store_sp1','sigma_v_store_sp1','center_h_store_sp1','center_v_store_sp1','counter_store_sp1','-append');
            
        else
            
            if isempty(find(counter_store_sp1 == counterDexter))
                
                counter_store_sp1 = [counter_store_sp1 counterDexter];
                save('dataplotterstore','variable_store_sp1','NOD_store_sp1','Nh_store_sp1','Nv_store_sp1','N_pxsum_store_sp1','Th_store_sp1','Tv_store_sp1','PSD_store_sp1','OD_store_sp1','npk_store_sp1','sigma_h_store_sp1','sigma_v_store_sp1','center_h_store_sp1','center_v_store_sp1','counter_store_sp1','-append');
                
            else
                
                errordlg({'Pressed "New Data" too soon! Run again.'},'Error');  % Bails out and doesn't save anything in dataplotterstore
                
            end            
        end                
    end    
end

currentYear = num2str(year(date));
[monthNum currentMonth] = month(date);
monthFullName = datestr(date,'mmmm');
currentDay = num2str(day(date),'%02d');

dailylogname = [element_sp1 '_' currentDay monthFullName(1:3) currentYear];

if ~exist([logPath '\' currentYear '\' monthFullName],'dir')
    mkdir([logPath '\' currentYear '\' monthFullName]);
end

logid = fopen([logPath filesep currentYear filesep monthFullName filesep dailylogname '.dat'],'w');
fprintf(logid,'%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\r\n','count','variable','N (OD)','N (horiz)','N (vert)','N (pixel sum)','Temp (horiz)','Temp (vert)','PSD','OD','npk','sigma (horiz)','sigma (vert)','center (horiz)','center (vert)');
fprintf(logid,'%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\r\n',[counter_store_sp1; variable_store_sp1; NOD_store_sp1; Nh_store_sp1; Nv_store_sp1; N_pxsum_store_sp1; Th_store_sp1; Tv_store_sp1; PSD_store_sp1; OD_store_sp1; npk_store_sp1; sigma_h_store_sp1; sigma_v_store_sp1; center_h_store_sp1; center_v_store_sp1]);
fclose(logid);