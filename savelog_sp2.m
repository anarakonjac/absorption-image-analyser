% savelog_sp2.m
% Saves the data.

if handles.olddata == 1
    year_log = year_log;
    month_log = month_log;
else
    year_log = num2str(year(date));
    [monthNum month_log] = month(date);
end

if ~exist([logpath element_sp2 '_' year_log '_' month_log '.dat'],'file')
    copyfile('logtemplate.dat',[logpath element_sp2 '_' year_log '_' month_log '.dat'],'f');
end

newlog = newlog.';

logid = fopen([logpath element_sp2 '_' year_log '_' month_log '.dat'],'w+');
fprintf(logid,'%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\r\n',newlog{:});
fclose(logid);