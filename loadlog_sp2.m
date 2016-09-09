%loaddirectories

load configdata.mat
load maindata.mat

if windows
    logpath = [logPath '\'];
else
    logpath = [logPath '/'];
end

if handles.olddata == 1
    underscoreIndex = find(filename_sp2 == '_');
    periodIndex = find(filename_sp2 == '.');
    year_log = filename_sp2((underscoreIndex(1) + 6):(underscoreIndex(1) + 9));
    month_log = filename_sp2((underscoreIndex(1) + 3):(underscoreIndex(1) + 5));
    day_log = filename_sp2((underscoreIndex(1) + 1):(underscoreIndex(1) + 2));
    num_log = filename_sp2((underscoreIndex(end) + 1):(periodIndex - 1));
    
    element_sp2 = filename_sp2(2:(underscoreIndex(1) - 1));
    
else
    year_log = num2str(year(date));
    [monthNum month_log] = month(date);
    day_log = num2str(day(date),'%02d');
end

if ~exist([logpath element_sp2 '_' year_log '_' month_log '.dat'],'file')
    copyfile('logtemplate.dat',[logpath element_sp2 '_' year_log '_' month_log '.dat'],'f'); % uncomment for real thing
end

logid_sp2 = fopen([logpath element_sp2 '_' year_log '_' month_log '.dat'],'r');
lfc_sp2 = textscan(logid_sp2, '%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s','delimiter',',');
fclose(logid_sp2);

% if (twospecies == 1)
%     logid_sp2 = fopen([logpath element_sp2 '_' year_log '_' month_log '.dat'],'r');
%     lfc_sp2 = textscan(logid_sp2, '%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s','delimiter',',');
%     fclose(logid_sp2);
% end

% Arem = cellfun('isempty',lfc{15});
% 
% remloc = find(Arem == 1);
% 
% for count = 1:21
%     lfc{count}(remloc) = [];
% end