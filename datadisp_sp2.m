% datadisp_sp2.m
% Extracts useful parameters and displays them in the GUI.

load configdata.mat
load maindata.mat


%% Calculating number

kB = 1.38e-23;
muB = 9.27d-24;
h = 6.63d-34;
omegabar = 2*pi*(xfreq_sp2*yfreq_sp2*zfreq_sp2)^(1/3);

species1 = element_sp2; %cell2mat(handles.species1);

[mass, lambda, gam, Isat, scattXsection, threebodyloss] = elementproperties(species1);

sigma0 = 3*(lambda).^2/(2.0*(pi)); % in SI
sigmatotal = sigma0/(1 + 2*IoverIs_sp2 + 4*(delta_sp2/gam)^2);

if (get(handles.popupmenu_1dsum_sp2,'Value') == 2)  % sum or cut
    verticalsize = crosszfit(4)/(2^0.5)*pixelsize2;
else
    verticalsize = cz(4)/(2^0.5)*pixelsize2;
end

% Correcting for view angle if necessary
if viewAngle_sp2 == 0
    
    if (get(handles.popupmenu_1dsum_sp2,'Value') == 2)  % sum or cut
        h_size_angle_corrected  = crossxfit(4);  % ie no change
    else
        h_size_angle_corrected  = cx(4);  % ie no change
    end
    
    horizontalsize  = h_size_angle_corrected/(2^0.5)*pixelsize2; % Conversion to rms width and microns
    
else
    
    if (get(handles.popupmenu_1dsum_sp2,'Value') == 2)  % sum or cut
        h_size_angle_corrected  = 1/cos(viewAngle_sp2)*(crossxfit(4)^2 - crosszfit(4)^2*sin(viewAngle_sp2)^2)^0.5; % Corrected for angle, still in px
    else
        h_size_angle_corrected  = 1/cos(viewAngle_sp2)*(cx(4)^2 - cz(4)^2*sin(viewAngle_sp2)^2)^0.5; % Corrected for angle, still in px
    end
    
    horizontalsize  = h_size_angle_corrected/(2^0.5)*pixelsize2; % Conversion to rms width  and microns
    
end

%horizontalsize  = cx(4)/(2^0.5)*pixelsize2; % Changed 01/04/11 
Ratio = horizontalsize/verticalsize;

%Ratio = (cx(4))/(cz(4)); % horizontal/vertical

verticalsizetrap = verticalsize/sqrt(1+(2.0*pi*zfreq_sp2*tof_sp2*1.0e-3)^2);
horizontalsizetrap = horizontalsize /sqrt(1+(2.0*pi*xfreq_sp2*tof_sp2*1.0e-3)^2);
Tv = mass*(2.0*pi*zfreq_sp2*verticalsizetrap*(2^0.5)).^2/(2*kB);
Th = mass*(2.0*pi*xfreq_sp2*horizontalsizetrap*(2^0.5)).^2/ (2*kB);

switch analysis_type_sp2
    
    case 'Classic'
        
        NOD = 2*opticaldepth*pi*verticalsize*horizontalsize/sigmatotal;
        Nh = (sum(I1)-cx(1)*length(I1))*pixelsize2^2/sigmatotal;
        Nv = (sum(I2)-cz(1)*length(I2))*pixelsize2^2/sigmatotal;
        N_pxsum = handles.A_sum_sp2*pixelsize2^2/sigmatotal;
        
    case 'px-by-px'   % untested!

        sigma_px = sigma0./(1 + 2*B./Isat_eff_sp2 + 4*(delta_sp2/gam)^2);
        Nh = sum(sum((A - cx(1)/length(I1))./sigma_px))*pixelsize2^2;
        Nv = sum(sum((A' - cz(1)/length(I2))./sigma_px'))*pixelsize2^2;
        NOD = 2*opticaldepth*pi*verticalsize*horizontalsize/sigma_px(round(crosszfit(3) - (ycamerapixel_sp2-1)),round(crossxfit(3) - (xcamerapixel_sp2-1)));
        N_pxsum = sum(sum(A*pixelsize2^2./sigma_px));
        
    case 'High Intensity'   % untested!
        
        sigma_px = sigma0./(1 + 2*B./Isat_eff_sp2 + 4*(delta_sp2/gam)^2);
        Nh = sum(sum((A - cx(1)/length(I1))./sigma_px))*pixelsize2^2;
        Nv = sum(sum((A' - cz(1)/length(I2))./sigma_px'))*pixelsize2^2;
        NOD = 2*opticaldepth*pi*verticalsize*horizontalsize/sigma_px(round(crosszfit(3) - (ycamerapixel_sp2-1)),round(crossxfit(3) - (xcamerapixel_sp2-1)));
        N_pxsum = sum(sum(A*pixelsize2^2./sigma_px));
        
end

npk = NOD*omegabar^3*(mass/(2*pi*kB*mean([Tv Th])))^(3/2);
psdensity = npk*(h/((2*pi*mass*kB*mean([Tv Th]))^0.5))^3;

% elasticRate = mass*omegabar^3*scattXsection*NOD/(2*pi^2*kB*Tm);
% threebodytotal = threebodyloss*omegabar^6*NOD^2*(mass/(2*pi*kB*Tm))^3;


%% Display graphics and text in the GUI

if (get(handles.popupmenu_1dsum_sp2,'Value') == 2)  % sum or cut
    
    set(handles.text_back_h_sp2,'String',num2str(crossxfit(1),'%6.2f'))
    handles.back_h_sp2 = crossxfit(1);
    set(handles.text_amp_h_sp2,'String',num2str(crossxfit(2),'%6.2f'))
    handles.amp_h_sp2 = crossxfit(2);
    set(handles.text_cen_h_sp2,'String',num2str(crossxfit(3),'%6.2f'))
    handles.cen_h_sp2 = crossxfit(3);
    set(handles.text_sig_h_sp2,'String',num2str(crossxfit(4)/2^0.5,'%6.2f'))
    handles.sig_h_sp2 = crossxfit(4)/2^0.5; % Converting to RMS width.
    
    set(handles.text_back_v_sp2,'String',num2str(crosszfit(1),'%6.2f'))
    handles.back_v_sp2 = crosszfit(1);
    set(handles.text_amp_v_sp2,'String',num2str(crosszfit(2),'%6.2f'))
    handles.amp_v_sp2 = crosszfit(2);
    set(handles.text_cen_v_sp2,'String',num2str(crosszfit(3),'%6.2f'))
    handles.cen_v_sp2 = crosszfit(3);
    set(handles.text_sig_v_sp2,'String',num2str(crosszfit(4)/2^0.5,'%6.2f'))
    handles.sig_v_sp2 = crosszfit(4)/2^0.5; % Converting to RMS width.
    
else
    
    set(handles.text_back_h_sp2,'String',num2str(cx(1),'%6.2f'))
    handles.back_h_sp2 = cx(1);
    set(handles.text_amp_h_sp2,'String',num2str(cx(2),'%6.2f'))
    handles.amp_h_sp2 = cx(2);
    set(handles.text_cen_h_sp2,'String',num2str(cx(3),'%6.2f'))
    handles.cen_h_sp2 = cx(3);
    set(handles.text_sig_h_sp2,'String',num2str(cx(4)/2^0.5,'%6.2f'))
    handles.sig_h_sp2 = cx(4)/2^0.5; % Converting to RMS width.
    
    set(handles.text_back_v_sp2,'String',num2str(cz(1),'%6.2f'))
    handles.back_v_sp2 = cz(1);
    set(handles.text_amp_v_sp2,'String',num2str(cz(2),'%6.2f'))
    handles.amp_v_sp2 = cz(2);
    set(handles.text_cen_v_sp2,'String',num2str(cz(3),'%6.2f'))
    handles.cen_v_sp2 = cz(3);
    set(handles.text_sig_v_sp2,'String',num2str(cz(4)/2^0.5,'%6.2f'))
    handles.sig_v_sp2 = cz(4)/2^0.5; % Converting to RMS width.
    
end

set(handles.text_aspecttof_sp2,'String',num2str(Ratio,'%6.2f'))
handles.aspecttof_sp2 = Ratio;
set(handles.text_odtof_sp2,'String',num2str(opticaldepth,'%6.2f'))
handles.odtof_sp2 = opticaldepth;
set(handles.text_psd_sp2,'String',num2str(psdensity,'%6.2e'))
handles.psdensity_sp2 = psdensity;
handles.npk_sp2 = npk;

set(handles.text_vsigtrap_sp2,'String',num2str(verticalsizetrap*1d6,'%6.2f'))
set(handles.text_hsigtrap_sp2,'String',num2str(horizontalsizetrap*1d6,'%6.2f'))
set(handles.text_vtemp_sp2,'String',num2str(Tv*1e6,'%8.3f'))
handles.Tv_sp2 = Tv*1e6;
set(handles.text_htemp_sp2,'String',num2str(Th*1e6,'%8.3f'))
handles.Th_sp2 = Th*1e6;

set(handles.text_vsigtof_sp2,'String',num2str(verticalsize*1d6,'%6.2f'))
handles.vsigtof_sp2 = verticalsize*1d6;
set(handles.text_hsigtof_sp2,'String',num2str(horizontalsize*1d6,'%6.2f'))
handles.hsigtof_sp2 = horizontalsize*1d6;
set(handles.text_vnum_sp2,'String',num2str(Nv,'%6.3e'))
handles.Nv_sp2 = Nv;
set(handles.text_hnum_sp2,'String',num2str(Nh,'%6.3e'))
handles.Nh_sp2 = Nh;
set(handles.text_NOD_sp2,'String',num2str(NOD,'%6.3e'))
handles.NOD_sp2 = NOD;
set(handles.text_Npx_sp2,'String',num2str(N_pxsum,'%6.3e'))
handles.Npx_sp2 = N_pxsum;

if varsync == 1
    
    % grab variableValue from file
    logid_var = fopen([varPath varFilename],'r');
    varfiledata = textscan(logid_var,'%s %s','delimiter',',');
    fclose(logid_var);
    
    dexterfilenum_mat = cellfun(@str2num,varfiledata{1}(4:end));
    var_mat = cellfun(@str2num,varfiledata{2}(4:end));
    
    dex_index = find(dexterfilenum_mat == counterDexter);
    variableValue = var_mat(dex_index);
    
    set(handles.edit_variable_sp2,'String',num2str(variableValue));
    
    save('maindata','variableValue','-append');
    
end


%% Plot in data plotter

if handles.olddata == 0
    
    plotstorage_sp2;
    plotspecies2 = 1;
    save('maindata','plotspecies2','-append');
    
    if plotstate == 0
        updateplottab;
    else
        plotsaveddata;
    end
    
end

