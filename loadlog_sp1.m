% loadlog_sp1.m
% Loads the log file for saved data.

load configdata.mat
load maindata.mat

if windows
    logpath = [logPath '\'];
else
    logpath = [logPath '/'];
end

if handles.olddata == 1
    underscoreIndex = find(filename_sp1 == '_');
    periodIndex = find(filename_sp1 == '.');
    year_log = filename_sp1((underscoreIndex(1) + 6):(underscoreIndex(1) + 9));
    month_log = filename_sp1((underscoreIndex(1) + 3):(underscoreIndex(1) + 5));
    day_log = filename_sp1((underscoreIndex(1) + 1):(underscoreIndex(1) + 2));
    num_log = filename_sp1((underscoreIndex(end) + 1):(periodIndex - 1));
    
    element_sp1 = filename_sp1(2:(underscoreIndex(1) - 1));
    
else
    year_log = num2str(year(date));
    [monthNum month_log] = month(date);
    day_log = num2str(day(date),'%02d');
end

if ~exist([logpath element_sp1 '_' year_log '_' month_log '.dat'],'file')
    copyfile('logtemplate.dat',[logpath element_sp1 '_' year_log '_' month_log '.dat'],'f'); % uncomment for real thing
end

logid_sp1 = fopen([logpath element_sp1 '_' year_log '_' month_log '.dat'],'r');
lfc_sp1 = textscan(logid_sp1, '%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s','delimiter',',');
fclose(logid_sp1);