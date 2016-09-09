% datadispTF_sp1.m
% Displays data from Thomas-Fermi fit in the GUI.

load configdata.mat
load maindata.mat


%% Calculating total number

kB = 1.38e-23;
muB = 9.27d-24;
h = 6.63d-34;
hbar = h/(2*pi);
omegabar = 2*pi*(xfreq_sp1*yfreq_sp1*zfreq_sp1)^(1/3);

species1 = element_sp1; %cell2mat(handles.species1);

[mass, lambda, gam, Isat, scattXsection, threebodyloss] = elementproperties(species1);

sigma0 = 3*(lambda).^2/(2.0*(pi)); % in SI
sigmatotal = sigma0/(1 + 2*IoverIs_sp1 + 4*(delta_sp1/gam)^2);

ODratio = DGfit(7)/DGfit(2);

% elasticRate = mass*omegabar^3*scattXsection*NOD/(2*pi^2*kB*Tm);
% threebodytotal = threebodyloss*omegabar^6*NOD^2*(mass/(2*pi*kB*Tm))^3;

if viewAngle_sp1 == 0
    thermhorizsize_corrected  = DGfit(4);  % ie no change
    thermhorizsize = thermhorizsize_corrected/(2^0.5)*pixelsize1; % Conversion to rms width and microns
else
    thermhorizsize_corrected  = 1/cos(viewAngle_sp1)*(DGfit(4)^2 - DGfit(6)^2*sin(viewAngle_sp1)^2)^0.5; % Corrected for angle, still in px
    thermhorizsize  = thermhorizsize_corrected/(2^0.5)*pixelsize1; % Conversion to rms width  and microns
end

thermvertsize  = DGfit(6)/(2^0.5)*pixelsize1;
thermaspect = thermhorizsize/thermvertsize;

%condhorizsize  = DGfit(9)/(2^0.5)*pixelsize1;

if viewAngle_sp1 == 0
    condhorizsize_corrected  = DGfit(9);  % ie no change
    condhorizsize = condhorizsize_corrected/(2^0.5)*pixelsize1; % Conversion to rms width and microns
else
    condhorizsize_corrected  = 1/cos(viewAngle_sp1)*(DGfit(9)^2 - DGfit(11)^2*sin(viewAngle_sp1)^2)^0.5; % Corrected for angle, still in px
    condhorizsize = condhorizsize_corrected/(2^0.5)*pixelsize1; % Conversion to rms width  and microns
end

condvertsize  = DGfit(11)/(2^0.5)*pixelsize1;
condaspect = condhorizsize/condvertsize;

[nnew,mnew] = size(Anew);

switch analysis_type_sp1
    
    case 'Classic'
        
        Ntot = (sum(sum(Anew)) - mnew*nnew*DGfit(1))*pixelsize1^2/sigmatotal;
        Ntherm = (sum(sum(Thermfit_pixel)) - DGfit(1))*pixelsize1^2/sigmatotal;
        Ncond = sum(sum(parabola2D_pixel))*pixelsize1^2/sigmatotal;
        
    case 'px-by-px' % untested!
        
        sigma_px = sigma0./(1 + 2*B./Isat_eff + 4*(delta_sp1/gam)^2);
        Ntot = sum(sum((Anew - DGfit(1))./sigma_px))*pixelsize1^2;
        Ntherm = sum(sum((Thermfit_pixel - DGfit(1))./sigma_px))*pixelsize1^2;
        Ncond = sum(sum(parabola2D_pixel./sigma_px))*pixelsize1^2;
        
    case 'High Intensity'   % untested!
        
        sigma_px = sigma0./(1 + 2*B./Isat_eff + 4*(delta_sp1/gam)^2);
        Ntot = sum(sum((Anew - DGfit(1))./sigma_px))*pixelsize1^2;
        Ntherm = sum(sum((Thermfit_pixel - DGfit(1))./sigma_px))*pixelsize1^2;
        Ncond = sum(sum(parabola2D_pixel./sigma_px))*pixelsize1^2;
        
end

condensateFraction = Ncond/(Ntherm + Ncond);

intrapthermvertsize = thermvertsize/sqrt(1+(2.0*pi*zfreq_sp1*tof_sp1*1.0e-3)^2);
intrapthermhorizsize = thermhorizsize/sqrt(1+(2.0*pi*xfreq_sp1*tof_sp1*1.0e-3)^2);
tempx =  mass*(2.0*pi*xfreq_sp1*intrapthermhorizsize*(2^0.5)).^2/(2*kB);
tempz = mass*(2.0*pi*zfreq_sp1*intrapthermvertsize*(2^0.5)).^2/(2*kB);

opticaldepth = mean([max(fitFun_x) max(fitFun_z)]);

npk = Ntherm*omegabar^3*(mass/(2*pi*kB*mean([tempx tempz])))^(3/2);
psdensity = npk*(h/((2*pi*mass*kB*mean([tempx tempz]))^0.5))^3;

Tc = 0.94*hbar*omegabar*Ntot^(1/3)/kB;


%% Displaying the graphics and Text

set(handles.text_back_h_sp1,'String',num2str(DGfit(1),'%6.2f'))
handles.back_h_sp1 = DGfit(1);
set(handles.text_amp_h_sp1,'String',num2str(DGfit(2),'%6.2f'))
handles.amp_h_sp1 = DGfit(2);
set(handles.text_cen_h_sp1,'String',num2str(DGfit(3),'%6.2f'))
handles.cen_h_sp1 = DGfit(3);
set(handles.text_sig_h_sp1,'String',num2str(DGfit(4)/2^0.5,'%6.2f'))
handles.sig_h_sp1 = DGfit(4)/2^0.5; % Converting to RMS width.

set(handles.text_back_v_sp1,'String',num2str(DGfit(1),'%6.2f'))
handles.back_v_sp1 = DGfit(1);
set(handles.text_amp_v_sp1,'String',num2str(DGfit(2),'%6.2f'))
handles.amp_v_sp1 = DGfit(2);
set(handles.text_cen_v_sp1,'String',num2str(DGfit(5),'%6.2f'))
handles.cen_v_sp1 = DGfit(5);
set(handles.text_sig_v_sp1,'String',num2str(DGfit(6)/2^0.5,'%6.2f'))
handles.sig_v_sp1 = DGfit(6)/2^0.5; % Converting to RMS width.

set(handles.text_aspecttof_sp1,'String',num2str(thermaspect,'%6.2f'))
set(handles.text_odtof_sp1,'String',num2str(opticaldepth,'%6.2f'))
handles.odtof_sp1 = opticaldepth;
set(handles.text_psd_sp1,'String',num2str(psdensity,'%6.2e'))

set(handles.text_vsigtrap_sp1,'String',num2str(thermvertsize*1d6,'%6.2f'))
set(handles.text_hsigtrap_sp1,'String',num2str(thermhorizsize*1d6,'%6.2f'))
set(handles.text_vtemp_sp1,'String',num2str(tempz*1e6,'%8.3f'))
handles.Tv_sp1 = tempz*1e6;
set(handles.text_htemp_sp1,'String',num2str(tempx*1e6,'%8.3f'))
handles.Th_sp1 = tempx*1e6;

set(handles.text_vsigtof_sp1,'String',num2str(condvertsize*1d6,'%6.2f'))
handles.vsigtof_sp1 = condvertsize*1d6;
set(handles.text_hsigtof_sp1,'String',num2str(condhorizsize*1d6,'%6.2f'))
handles.hsigtof_sp1 = condhorizsize*1d6;
set(handles.text_Npx_sp2,'String',num2str(Ntot,'%6.3e'))

DGfit_sp1 = DGfit;

% Condensate part
set(handles.text_cond_cen_h_sp1,'String',num2str(DGfit(8),'%6.3e'));
set(handles.text_cond_cen_v_sp1,'String',num2str(DGfit(10),'%6.3e'));
set(handles.text_tfrad_h_sp1,'String',num2str(DGfit(9),'%6.3e'));
set(handles.text_tfrad_v_sp1,'String',num2str(DGfit(11),'%6.3e'));
set(handles.text_tfrad_mic_h_sp1,'String',num2str(DGfit(9)*pixelsize1,'%6.3e'));
set(handles.text_tfrad_mic_v_sp1,'String',num2str(DGfit(11)*pixelsize2,'%6.3e'));
set(handles.text_condfrac_sp1,'String',num2str(condensateFraction,'%6.3e'));
set(handles.text_aspectratio_sp1,'String',num2str(DGfit(9)/DGfit(11),'%6.3e'));
