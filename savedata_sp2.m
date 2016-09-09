% savedata.m
% Saving the variables to log files.

load maindata.mat
load configdata.mat


if handles.olddata == 1
    filename_sp2 = handles.oldfilename_sp2;
end

loadlog_sp2;

if handles.olddata == 1
    
    syear = ismember(lfc_sp2{1},year_log);
    sroot = ismember(lfc_sp2{2},[day_log month_log]);
    snum = ismember(lfc_sp2{3},num_log);
    
else
    
    syear = ismember(lfc_sp2{1},num2str(year(date)));
    [monthNum currentMonth] = month(date);
    currentDay = num2str(day(date),'%02d');
    sroot = ismember(lfc_sp2{2},[currentDay currentMonth]);
    
    if (dextersyncValue == 0)
        snum = ismember(lfc_sp2{3},['M' get(handles.edit_counter_sp1,'String')]);
    else
        snum = ismember(lfc_sp2{3},get(handles.dexterfilenum,'String'));
    end
    
end

stot = syear + sroot + snum;

% Spits out the position of the matching record if we are looking
% at data that already exists. It overwrites the old record with
% the new data being saved.

recpos = find(stot == 3);

if isempty(recpos)
    recpos = length(lfc_sp2{1}) + 1;
else
end

% Log file

if handles.olddata == 1
    
    lfc_sp2{1}{recpos} = handles.oldyear; % Year
    lfc_sp2{2}{recpos} = handles.oldroot; % Root
    lfc_sp2{3}{recpos} = handles.oldcount; % Counter
    
else
    
    lfc_sp2{1}{recpos} = year_log; % Year
    lfc_sp2{2}{recpos} = [day_log month_log]; % Root
    
    if (dextersyncValue == 0)
        num_log = ['M' get(handles.edit_counter_sp1,'String')];
    else
        num_log = get(handles.dexterfilenum,'String');
    end
    
    lfc_sp2{3}{recpos} = num_log; % Counter
    
end

lfc_sp2{4}{recpos} = get(handles.edit_variable,'String'); % Control voltage
lfc_sp2{5}{recpos} = num2str(handles.odtof_sp2,'%6.3f'); % Optical depth
lfc_sp2{6}{recpos} = num2str(handles.sig_h_sp2,'%6.3f'); % Sigma H TOF (px)
lfc_sp2{7}{recpos} = num2str(handles.sig_v_sp2,'%6.3f'); % Sigma V TOF (px)
lfc_sp2{8}{recpos} = num2str(handles.cen_h_sp2,'%6.3f'); % Centre H (px)
lfc_sp2{9}{recpos} = num2str(handles.cen_v_sp2,'%6.3f'); % Centre V (px)
lfc_sp2{10}{recpos} = num2str(handles.Nh_sp2,'%6.3e'); % Number H
lfc_sp2{11}{recpos} = num2str(handles.Nv_sp2,'%6.3e'); % Number V
lfc_sp2{12}{recpos} = num2str(handles.back_h_sp2,'%6.3f'); % Offset H
lfc_sp2{13}{recpos} = num2str(handles.back_v_sp2,'%6.3f'); % Offset V

% I/Isat
switch analysis_type_sp2
    case 'Classic'
        lfc_sp2{14}{recpos} = num2str(IoverIs_sp2);
    case 'px-by-px'
        lfc_sp2{14}{recpos} = num2str(Isat_eff_sp2);
    case 'High Intensity'
        lfc_sp2{14}{recpos} = num2str(Isat_eff_sp2);
end

lfc_sp2{15}{recpos} = get(handles.edit_detuning_sp2,'string');  % detuning
lfc_sp2{16}{recpos} = get(handles.edit_tof_sp2,'String'); % TOF (ms)
lfc_sp2{17}{recpos} = get(handles.edit_xfreq_sp2,'String'); % x frequency (Hz)
lfc_sp2{18}{recpos} = get(handles.edit_yfreq_sp2,'String'); % y frequency (Hz)
lfc_sp2{19}{recpos} = get(handles.edit_zfreq_sp2,'String'); % z frequency (Hz)
lfc_sp2{20}{recpos} = num2str(pixelsize2);

stringtemp = get(handles.edit_label_sp2,'String'); % Extract comment for particular file
stringtemp(stringtemp == ',') = ';'; % Replace commas with semicolons, as commas mess up csv log file.
lfc_sp2{21}{recpos} = stringtemp; % Comment for particular file

lfc_sp2{22}{recpos} = num2str(handles.NOD_sp1,'%6.3f'); % Number from OD
lfc_sp2{23}{recpos} = num2str(handles.Npx_sp1,'%6.3f'); % Number from pixel sum
lfc_sp2{24}{recpos} = num2str(handles.Th_sp1,'%6.3f'); % Temp H (microK)
lfc_sp2{25}{recpos} = num2str(handles.Tv_sp1,'%6.3f'); % Temp V (microK)
lfc_sp2{26}{recpos} = num2str(handles.psdensity_sp1,'%6.3f'); % Phase space density
lfc_sp2{27}{recpos} = num2str(handles.npk_sp1,'%6.3f'); % Peak density

% Test if we are doing TF fitting
if isfield(handles,'sig_h_C_sp2')
    lfc_sp2{28}{recpos} = num2str(handles.sig_h_C_sp2,'%6.3f'); % TF radius H
    lfc_sp2{29}{recpos} = num2str(handles.sig_v_C_sp2,'%6.3f'); % TF radius V
    lfc_sp2{30}{recpos} = num2str(handles.condFrac_sp2,'%6.3f'); % Condensate fraction
else
    lfc_sp2{28}{recpos} = '0'; % TF radius H
    lfc_sp2{29}{recpos} = '0'; % TF radius V
    lfc_sp2{30}{recpos} = '0'; % Condensate fraction
end

lfc_sp2{31}{recpos} = num2str(handles.aspecttof_sp2,'%6.3f'); % Aspect ratio

if exist('configfilename','var')
    lfc_sp2{32}{recpos} = configfilename; % Config file name if it has been saved
else
    lfc_sp2{32}{recpos} = 'N/A';
end

newlog = [lfc_sp2{1},lfc_sp2{2},lfc_sp2{3},lfc_sp2{4},lfc_sp2{5},lfc_sp2{6},lfc_sp2{7},...
    lfc_sp2{8},lfc_sp2{9},lfc_sp2{10},lfc_sp2{11},lfc_sp2{12},lfc_sp2{13},...
    lfc_sp2{14},lfc_sp2{15},lfc_sp2{16},lfc_sp2{17},lfc_sp2{18},lfc_sp2{19},...
    lfc_sp2{20},lfc_sp2{21},lfc_sp2{22},lfc_sp2{23},lfc_sp2{24},lfc_sp2{25},...
    lfc_sp2{26},lfc_sp2{27},lfc_sp2{28},lfc_sp2{29},lfc_sp2{30},lfc_sp2{31},...
    lfc_sp2{32}];

savelog_sp2;

datamsg = msgbox('Data is saved!','','help');
pause(1)
close(datamsg)
