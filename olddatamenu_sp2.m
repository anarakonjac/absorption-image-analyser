% olddatamenu_sp2.m
% Loads old data.


load configdata.mat;
load maindata.mat;


%% Get file details and load file

% Grab today's date
currentDate = date;
currentYear = num2str(year(date));
[monthNum currentMonth] = month(date);
monthFullName = datestr(date,'mmmm');
currentDay = num2str(day(date),'%02d');

if windows
    pathname_olddata = [storagePath '\' currentYear '\' currentMonth '\'];
    [filename_sp2,pathname_olddata] = uigetfile([pathname_olddata '\*.asc']);
else
    pathname_olddata = [storagePath '/' currentYear '/' currentMonth '/'];
    [filename_sp2,pathname_olddata] = uigetfile([pathname_olddata '/*.asc']);
end

save('maindata','pathname_olddata','filename_sp2','-append');

filename_sp2_cut = filename_sp2(2:end); % removes "a" from file name

underscoreIndex = find(filename_sp2_cut == '_');
numI1 = underscoreIndex(end);
numI2 = find(filename_sp2_cut == '.');
filenum = filename_sp2_cut((numI1 + 1):(numI2 - 1));
handles.filenum = filenum;

% Display file number
%set(handles.dexterfilenum,'String',handles.filenum);

patha = [pathname_olddata 'a' filename_sp2_cut];
pathb = [pathname_olddata 'b' filename_sp2_cut];
pathc = [pathname_olddata 'c' filename_sp2_cut];

if ~(exist(patha) && exist(pathb) && exist(pathc))
    
    Errordlg({'Image and associated files do not exist, try again'},'File not found');
    return;
    
else

    A = loadascii(patha,['a' filename_sp2_cut]); %atoms in cloud + background
    B = loadascii(pathb,['b' filename_sp2_cut]); %probe + background only
    C = loadascii(pathc,['c' filename_sp2_cut]); %background
    
end

astorename_sp2 = ['a' filename_sp2_cut];
bstorename_sp2 = ['b' filename_sp2_cut];
cstorename_sp2 = ['c' filename_sp2_cut];

save('maindata','astorename_sp2','bstorename_sp2','cstorename_sp2','-append');

clear patha pathb pathc

% These lines of code rotate the images anticlockwise if needed.
A = rot90(A,numrotations_sp2);
B = rot90(B,numrotations_sp2);
C = rot90(C,numrotations_sp2);

loadlog_sp2;    % load saved data from log

handles.oldfilename_sp2 = filename_sp2_cut;

underscoreIndex = find(filename_sp2_cut == '_');
syear = ismember(lfc_sp2{1},year_log);
sroot = ismember(lfc_sp2{2},[day_log month_log]);
snum = ismember(lfc_sp2{3},num_log);
stot = syear + sroot + snum;


% Spits out the position of the matching record if we are looking
% at data that already exists. It overwrites the old record with
% the new data being saved.

recpos = find(stot == 3);

if isempty(recpos)
    
    handles.oldyear = year_log;
    handles.oldroot = [day_log month_log];
    handles.oldcount = num_log;
    
else
    
    handles.oldyear = lfc_sp2{1}{recpos};
    handles.oldroot = lfc_sp2{2}{recpos};
    handles.oldcount = lfc_sp2{3}{recpos};
    set(handles.edit_variable,'String',lfc_sp2{4}{recpos}); % Control voltage
    set(handles.edit_detuning_sp2,'String',lfc_sp2{15}{recpos}) % Detuning (MHz)
    set(handles.edit_tof_sp2,'String',lfc_sp2{16}{recpos}); % TOF (ms)
    set(handles.edit_xfreq_sp2,'String',lfc_sp2{17}{recpos}); % x frequency (Hz)
    set(handles.edit_yfreq_sp2,'String',lfc_sp2{18}{recpos}); % y frequency (Hz)
    set(handles.edit_zfreq_sp2,'String',lfc_sp2{19}{recpos}); % z frequency (Hz)
    set(handles.edit_label_sp2,'String',lfc_sp2{21}{recpos}); % Comment for image
    
end


%% Analysis

ana_sp2;

axes(handles.axes_2d_sp2);
underscores = find(filename_sp2_cut == '_');
filename_sp2_cut(underscores) = ' ';
title(['Absorption image of old data set (' filename_sp2_cut ')']);
colour = str2num(get(handles.edit_ODrange_sp2,'String'));
axes(handles.axes_2d_sp2);
caxis(colour_sp2)

