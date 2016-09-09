% plotstorage_sp2.m
% Stores variables for data plotter


if ~exist('dataplotterstore.mat','file')  % any of the stored variables will do
    
    NOD_store_sp2 = NOD;
    Nh_store_sp2 = Nh;
    Nv_store_sp2 = Nv;
    N_pxsum_store_sp2 = N_pxsum;
    
    Th_store_sp2 = Th;
    Tv_store_sp2 = Tv;
    
    PSD_store_sp2 = psdensity;
    OD_store_sp2 = opticaldepth;
    npk_store_sp2 = npk;
    
    sigma_h_store_sp2 = horizontalsize;
    sigma_v_store_sp2 = verticalsize;
    
    center_h_store_sp2 = cx(3);
    center_v_store_sp2 = cz(3);
    
    variable_store_sp2 = variableValue;
    
    if (dextersyncValue == 0)
        counter_store_sp2 = counterManual;  % Should be used for testing only!
    else
        counter_store_sp2 = counterDexter;
    end
    
    save('dataplotterstore','variable_store_sp2','NOD_store_sp2','Nh_store_sp2','Nv_store_sp2','N_pxsum_store_sp2','Th_store_sp2','Tv_store_sp2','PSD_store_sp2','OD_store_sp2','npk_store_sp2','sigma_h_store_sp2','sigma_v_store_sp2','center_h_store_sp2','center_v_store_sp2','counter_store_sp2');
    
else
    
    load dataplotterstore.mat
    
    if ~exist('NOD_store_sp2','var')
        
        NOD_store_sp2 = [];
        Nh_store_sp2 = [];
        Nv_store_sp2 = [];
        N_pxsum_store_sp2 = [];        
        Th_store_sp2 = [];
        Tv_store_sp2 = [];        
        PSD_store_sp2 = [];
        OD_store_sp2 = [];
        npk_store_sp2 = [];        
        sigma_h_store_sp2 = [];
        sigma_v_store_sp2 = [];        
        center_h_store_sp2 = [];
        center_v_store_sp2 = [];        
        variable_store_sp2 = [];
        counter_store_sp2 = [];
            
    end
        
    
    if (keepROI_option_sp2 == 1) || (handles.setROI_pressed_sp2 == 1) || (handles.zoomout_pressed_sp2 == 1) || (handles.fr_pressed_sp2 == 1)
    % Used for when the ROI is selected or "zoom out" is pressed, so new
    % entries aren't created.
        
        NOD_store_sp2(end) = NOD;
        Nh_store_sp2(end) = Nh;
        Nv_store_sp2(end) = Nv;
        N_pxsum_store_sp2(end) = N_pxsum;
        
        Th_store_sp2(end) = Th;
        Tv_store_sp2(end) = Tv;
        
        PSD_store_sp2(end) = psdensity;
        OD_store_sp2(end) = opticaldepth;
        npk_store_sp2(end) = npk;
        
        sigma_h_store_sp2(end) = horizontalsize;
        sigma_v_store_sp2(end) = verticalsize;
        
        center_h_store_sp2(end) = cx(3);
        center_v_store_sp2(end) = cz(3);
        
        variable_store_sp2(end) = variableValue;
        
        save('dataplotterstore','variable_store_sp2','NOD_store_sp2','Nh_store_sp2','Nv_store_sp2','N_pxsum_store_sp2','Th_store_sp2','Tv_store_sp2','PSD_store_sp2','OD_store_sp2','npk_store_sp2','sigma_h_store_sp2','sigma_v_store_sp2','center_h_store_sp2','center_v_store_sp2','-append');
        
    else
        
        NOD_store_sp2 = [NOD_store_sp2 NOD];
        Nh_store_sp2 = [Nh_store_sp2 Nh];
        Nv_store_sp2 = [Nv_store_sp2 Nv];
        N_pxsum_store_sp2 = [N_pxsum_store_sp2 N_pxsum];
        
        Th_store_sp2 = [Th_store_sp2 Th];
        Tv_store_sp2 = [Tv_store_sp2 Tv];
        
        PSD_store_sp2 = [PSD_store_sp2 psdensity];
        OD_store_sp2 = [OD_store_sp2 opticaldepth];
        npk_store_sp2 = [npk_store_sp2 npk];
        
        sigma_h_store_sp2 = [sigma_h_store_sp2 horizontalsize];
        sigma_v_store_sp2 = [sigma_v_store_sp2 verticalsize];
        
        center_h_store_sp2 = [center_h_store_sp2 cx(3)];
        center_v_store_sp2 = [center_v_store_sp2 cz(3)];
        
        variable_store_sp2 = [variable_store_sp2 variableValue];
        
        if (dextersyncValue == 0)
            
            counter_store_sp2 = [counter_store_sp2 counterManual];  % Should be used for testing only!
            save('dataplotterstore','variable_store_sp2','NOD_store_sp2','Nh_store_sp2','Nv_store_sp2','N_pxsum_store_sp2','Th_store_sp2','Tv_store_sp2','PSD_store_sp2','OD_store_sp2','npk_store_sp2','sigma_h_store_sp2','sigma_v_store_sp2','center_h_store_sp2','center_v_store_sp2','counter_store_sp2','-append');

        else
            
            if isempty(find(counter_store_sp2 == counterDexter))
                
                counter_store_sp2 = [counter_store_sp2 counterDexter];
                save('dataplotterstore','variable_store_sp2','NOD_store_sp2','Nh_store_sp2','Nv_store_sp2','N_pxsum_store_sp2','Th_store_sp2','Tv_store_sp2','PSD_store_sp2','OD_store_sp2','npk_store_sp2','sigma_h_store_sp2','sigma_v_store_sp2','center_h_store_sp2','center_v_store_sp2','counter_store_sp2','-append');
                
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

dailylogname = [element_sp2 '_' currentDay monthFullName(1:3) currentYear];

if ~exist([logPath '\' currentYear '\' monthFullName],'dir')
    mkdir([logPath '\' currentYear '\' monthFullName]);
end

logid = fopen([logPath filesep currentYear filesep monthFullName filesep dailylogname '.dat'],'w');
fprintf(logid,'%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\r\n','count','variable','N (OD)','N (horiz)','N (vert)','N (pixel sum)','Temp (horiz)','Temp (vert)','PSD','OD','npk','sigma (horiz)','sigma (vert)','center (horiz)','center (vert)');
fprintf(logid,'%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f\r\n',[counter_store_sp2; variable_store_sp2; NOD_store_sp2; Nh_store_sp2; Nv_store_sp2; N_pxsum_store_sp2; Th_store_sp2; Tv_store_sp2; PSD_store_sp2; OD_store_sp2; npk_store_sp2; sigma_h_store_sp2; sigma_v_store_sp2; center_h_store_sp2; center_v_store_sp2]);
fclose(logid);