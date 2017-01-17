% datadisp_sp1.m
% Extracts useful parameters and displays them in the GUI.

load configdata.mat
load maindata.mat


%% Calculating number

kB = 1.38e-23;
muB = 9.27d-24;
h = 6.63d-34;
omegabar = 2*pi*(xfreq_sp1*yfreq_sp1*zfreq_sp1)^(1/3);

species1 = element_sp1; %cell2mat(handles.species1);

[mass, lambda, gam, Isat, scattXsection, threebodyloss] = elementproperties(species1);

sigma0 = 3*(lambda).^2/(2.0*(pi)); % in SI
sigmatotal = sigma0/(1 + 2*IoverIs_sp1 + 4*(delta_sp1/gam)^2);

if (get(handles.popupmenu_1dsum_sp1,'Value') == 2)  % sum or cut
    verticalsize = crosszfit(4)/(2^0.5)*pixelsize1;
else
    verticalsize = cz(4)/(2^0.5)*pixelsize1;
end

% Correcting for view angle if necessary
if viewAngle_sp1 == 0
    
    if (get(handles.popupmenu_1dsum_sp1,'Value') == 2)  % sum or cut
        h_size_angle_corrected  = crossxfit(4);  % ie no change
    else
        h_size_angle_corrected  = cx(4);  % ie no change
    end
    
    horizontalsize  = h_size_angle_corrected/(2^0.5)*pixelsize1; % Conversion to rms width and microns
    
else
    
    if (get(handles.popupmenu_1dsum_sp1,'Value') == 2)  % sum or cut
        h_size_angle_corrected  = 1/cos(viewAngle_sp1)*(crossxfit(4)^2 - crosszfit(4)^2*sin(viewAngle_sp1)^2)^0.5; % Corrected for angle, still in px
    else
        h_size_angle_corrected  = 1/cos(viewAngle_sp1)*(cx(4)^2 - cz(4)^2*sin(viewAngle_sp1)^2)^0.5; % Corrected for angle, still in px
    end
    
    horizontalsize  = h_size_angle_corrected/(2^0.5)*pixelsize1; % Conversion to rms width  and microns
    
end

Ratio = horizontalsize/verticalsize;

verticalsizetrap = verticalsize/sqrt(1+(2.0*pi*zfreq_sp1*tof_sp1*1.0e-3)^2);
horizontalsizetrap = horizontalsize /sqrt(1+(2.0*pi*xfreq_sp1*tof_sp1*1.0e-3)^2);
Tv = mass*(2.0*pi*zfreq_sp1*verticalsizetrap*(2^0.5)).^2/(2*kB);
Th = mass*(2.0*pi*xfreq_sp1*horizontalsizetrap*(2^0.5)).^2/ (2*kB);

switch analysis_type_sp1
    
    case 'Classic'

        NOD = 2*opticaldepth*pi*verticalsize*horizontalsize/sigmatotal;
        Nh = (sum(I1)-cx(1)*length(I1))*pixelsize1^2/sigmatotal;
        Nv = (sum(I2)-cz(1)*length(I2))*pixelsize1^2/sigmatotal;
        N_pxsum = handles.A_sum_sp1*pixelsize1^2/sigmatotal;
        
    case 'px-by-px'
        
        sigma_px = sigma0./(1 + 2*B./Isat_eff_sp1 + 4*(delta_sp1/gam)^2);
        Nh = sum(sum((A - cx(1)/length(I1))./sigma_px))*pixelsize1^2;
        Nv = sum(sum((A' - cz(1)/length(I2))./sigma_px'))*pixelsize1^2;
        
        if roi_used == 1
            NOD = 2*opticaldepth*pi*verticalsize*horizontalsize/sigma_px(round(crosszfit(3) - (ycamerapixel_sp1-1)),round(crossxfit(3) - (xcamerapixel_sp1-1)));
        else
            NOD = 2*opticaldepth*pi*verticalsize*horizontalsize/sigma_px(round(crosszfit(3)),round(crossxfit(3)));
        end
        
        N_pxsum = sum(sum(A*pixelsize1^2./sigma_px));
        
    case 'High Intensity'
        
        sigma_px = sigma0./(1 + 2*B./Isat_eff_sp1 + 4*(delta_sp1/gam)^2);
        Nh = sum(sum((A - cx(1)/length(I1))./sigma_px))*pixelsize1^2;
        Nv = sum(sum((A' - cz(1)/length(I2))./sigma_px'))*pixelsize1^2;
        
        if roi_used == 1
            NOD = 2*opticaldepth*pi*verticalsize*horizontalsize/sigma_px(round(crosszfit(3) - (ycamerapixel_sp1-1)),round(crossxfit(3) - (xcamerapixel_sp1-1)));
        else
            NOD = 2*opticaldepth*pi*verticalsize*horizontalsize/sigma_px(round(crosszfit(3)),round(crossxfit(3)));
        end
        
        N_pxsum = sum(sum(A*pixelsize1^2./sigma_px));
        
end

npk = NOD*omegabar^3*(mass/(2*pi*kB*mean([Tv Th])))^(3/2);
psdensity = npk*(h/((2*pi*mass*kB*mean([Tv Th]))^0.5))^3;

% elasticRate = mass*omegabar^3*scattXsection*NOD/(2*pi^2*kB*Tm);
% threebodytotal = threebodyloss*omegabar^6*NOD^2*(mass/(2*pi*kB*Tm))^3;


%% Display graphics and text in the GUI

if (get(handles.popupmenu_1dsum_sp1,'Value') == 2)  % sum or cut
    
    set(handles.text_back_h_sp1,'String',num2str(crossxfit(1),'%6.2f'))
    handles.back_h_sp1 = crossxfit(1);
    set(handles.text_amp_h_sp1,'String',num2str(crossxfit(2),'%6.2f'))
    handles.amp_h_sp1 = crossxfit(2);
    set(handles.text_cen_h_sp1,'String',num2str(crossxfit(3),'%6.2f'))
    handles.cen_h_sp1 = crossxfit(3);
    set(handles.text_sig_h_sp1,'String',num2str(crossxfit(4)/2^0.5,'%6.2f'))
    handles.sig_h_sp1 = crossxfit(4)/2^0.5; % Converting to RMS width.
    
    set(handles.text_back_v_sp1,'String',num2str(crosszfit(1),'%6.2f'))
    handles.back_v_sp1 = crosszfit(1);
    set(handles.text_amp_v_sp1,'String',num2str(crosszfit(2),'%6.2f'))
    handles.amp_v_sp1 = crosszfit(2);
    set(handles.text_cen_v_sp1,'String',num2str(crosszfit(3),'%6.2f'))
    handles.cen_v_sp1 = crosszfit(3);
    set(handles.text_sig_v_sp1,'String',num2str(crosszfit(4)/2^0.5,'%6.2f'))
    handles.sig_v_sp1 = crosszfit(4)/2^0.5; % Converting to RMS width.
    
else
    
    set(handles.text_back_h_sp1,'String',num2str(cx(1),'%6.2f'))
    handles.back_h_sp1 = cx(1);
    set(handles.text_amp_h_sp1,'String',num2str(cx(2),'%6.2f'))
    handles.amp_h_sp1 = cx(2);
    set(handles.text_cen_h_sp1,'String',num2str(cx(3),'%6.2f'))
    handles.cen_h_sp1 = cx(3);
    set(handles.text_sig_h_sp1,'String',num2str(cx(4)/2^0.5,'%6.2f'))
    handles.sig_h_sp1 = cx(4)/2^0.5; % Converting to RMS width.
    
    set(handles.text_back_v_sp1,'String',num2str(cz(1),'%6.2f'))
    handles.back_v_sp1 = cz(1);
    set(handles.text_amp_v_sp1,'String',num2str(cz(2),'%6.2f'))
    handles.amp_v_sp1 = cz(2);
    set(handles.text_cen_v_sp1,'String',num2str(cz(3),'%6.2f'))
    handles.cen_v_sp1 = cz(3);
    set(handles.text_sig_v_sp1,'String',num2str(cz(4)/2^0.5,'%6.2f'))
    handles.sig_v_sp1 = cz(4)/2^0.5; % Converting to RMS width.
    
end

set(handles.text_aspecttof_sp1,'String',num2str(Ratio,'%6.2f'))
handles.aspecttof_sp1 = Ratio;
set(handles.text_odtof_sp1,'String',num2str(opticaldepth,'%6.2f'))
handles.odtof_sp1 = opticaldepth;
set(handles.text_psd_sp1,'String',num2str(psdensity,'%6.2e'))
handles.psdensity_sp1 = psdensity;
handles.npk_sp1 = npk;

set(handles.text_vsigtrap_sp1,'String',num2str(verticalsizetrap*1d6,'%6.2f'))
set(handles.text_hsigtrap_sp1,'String',num2str(horizontalsizetrap*1d6,'%6.2f'))
set(handles.text_vtemp_sp1,'String',num2str(Tv*1e6,'%8.3f'))
handles.Tv_sp1 = Tv*1e6;
set(handles.text_htemp_sp1,'String',num2str(Th*1e6,'%8.3f'))
handles.Th_sp1 = Th*1e6;

set(handles.text_vsigtof_sp1,'String',num2str(verticalsize*1d6,'%6.2f'))
handles.vsigtof_sp1 = verticalsize*1d6;
set(handles.text_hsigtof_sp1,'String',num2str(horizontalsize*1d6,'%6.2f'))
handles.hsigtof_sp1 = horizontalsize*1d6;
set(handles.text_vnum_sp1,'String',num2str(Nv,'%6.3e'))
handles.Nv_sp1 = Nv;
set(handles.text_hnum_sp1,'String',num2str(Nh,'%6.3e'))
handles.Nh_sp1 = Nh;
set(handles.text_NOD_sp1,'String',num2str(NOD,'%6.3e'))
handles.NOD_sp1 = NOD;
set(handles.text_Npx_sp1,'String',num2str(N_pxsum,'%6.3e'))
handles.Npx_sp1 = N_pxsum;

if varsync == 1
    
    % grab variableValue from file
    logid_var = fopen([varPath varFilename],'r');
    varfiledata = textscan(logid_var,'%s %s','delimiter',',');
    fclose(logid_var);
    
    dexterfilenum_mat = cellfun(@str2num,varfiledata{1}(1:end));    % change index if the variable sync file has headings
    var_mat = cellfun(@str2num,varfiledata{2}(1:end));
    
    dex_index = find(dexterfilenum_mat == counterDexter);
    variableValue = var_mat(dex_index);
    
    if isempty(variableValue)
            
            errordlg({'Variable value is non-numeric! Check your variable sync file. Variable value assigned to zero.'},'Bad thing')
            variableValue = 0;
            
    else
    
    set(handles.edit_variable,'String',num2str(variableValue));    
    save('maindata','variableValue','-append');
    
end
    

%% Plot in data plotter

if handles.olddata == 0
    
    plotspecies2 = 0;
    plotdata_sp2 = 0;
    save('maindata','plotspecies2','-append');
    plotstorage_sp1;
    
    if plotstate == 0
        updateplottab;
    else
        plotsaveddata;
    end
    
end
