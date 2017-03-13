% newdatamenu.m
% Loads newly taken images and calls other routines to analyse them.
% Works for both species or just one.

load configdata.mat;
load maindata.mat;


%% Solis image naming

dataA_sp2 = 'data004.asc';
dataB_sp2 = 'data005.asc';
dataC_sp2 = 'data006.asc';


%% Sync to Dexter
% Or assign manual count

% Grab today's date
currentDate = date;

currentYear = num2str(year(date));
[monthNum currentMonth] = month(date);
monthFullName = datestr(date,'mmmm');
currentDay = num2str(day(date),'%02d');

% Get file number based on Dexter filename or manual counting
if (dextersyncValue == 1)
    
    syncID = fopen([dexterSyncPath dexterSyncFile]);
    counterDexter = cell2mat(textscan(syncID,'%f'));
    fclose(syncID);
    
    if counterDexter == 0
        errordlg({'Cannot have Dexter file 0!'},'No zeros');
        return
    end
    
    if counterDexter == 100        
        inspmsg_state = 1;  
    else
        inspmsg_state = 0;
    end
    
    handles.counterDexter_sp2 = num2str(counterDexter);
%     set(handles.dexterfilenum,'String',handles.counterDexter);
    set(handles.text_dexterfilenum_sp2,'String',handles.counterDexter_sp2);
    
    naming = ['_' currentDay currentMonth currentYear '_'];
    
    save('maindata','counterDexter','-append');
        
else
    
%     counterManual = str2num(handles.edit_counter);
    
    naming = ['_' currentDay currentMonth currentYear '_']; % M is appended when the manual counter is used
    
end

if windows
    imagedir_sp2 = [imagePath_sp2 '\'];
else
    imagedir_sp2 = [imagePath_sp2 '/'];
end


%% Load camera images

if (exist(strcat(imagedir_sp2,dataA_sp2)) & exist(strcat(imagedir_sp2,dataB_sp2)) & exist(strcat(imagedir_sp2,dataC_sp2)))
    
    D = loadascii(strcat(imagedir_sp2,dataA_sp2),strcat(dataA_sp2)); %atoms in cloud + background
    E = loadascii(strcat(imagedir_sp2,dataB_sp2),strcat(dataB_sp2)); %probe + background only
    F = loadascii(strcat(imagedir_sp2,dataC_sp2),strcat(dataC_sp2)); %background
    
    D = rot90(D,numrotations_sp2);
    E = rot90(E,numrotations_sp2);
    F = rot90(F,numrotations_sp2);
    
else
    
    errordlg({'Second species data not found.'},'File not found');
    return;
    
end

if (dextersyncValue == 1)
    
    filename_sp2 = [naming num2str(counterDexter)];
    save('maindata','filename_sp2','-append');
    
else
    
    filename_sp2 = [naming 'M' num2str(counterManual + 1)];
    save('maindata','filename_sp2','-append');
    
    % Increment manual counter
    counterManual = counterManual + 1;
    save('maindata','counterManual','-append');
    handles.counterManual = num2str(counterManual);
    set(handles.edit_counter_sp1,'String',handles.counterManual);
    guidata(hObject, handles);
    
end


%% Rename files and put them in the right directory

if (dextersyncValue == 1)
    
    astorename_sp2 = ['a' element_sp2 naming num2str(counterDexter) '.asc']; %create first filename
    bstorename_sp2 = ['b' element_sp2 naming num2str(counterDexter) '.asc']; %create second filename
    cstorename_sp2 = ['c' element_sp2 naming num2str(counterDexter) '.asc']; %create third filename
    
    save('maindata','astorename_sp2','bstorename_sp2','cstorename_sp2','-append');
    
else
    
    astorename_sp2 = ['a' element_sp2 naming 'M' num2str(counterManual) '.asc']; %create first filename
    bstorename_sp2 = ['b' element_sp2 naming 'M' num2str(counterManual) '.asc']; %create second filename
    cstorename_sp2 = ['c' element_sp2 naming 'M' num2str(counterManual) '.asc']; %create third filename
    
    save('maindata','astorename_sp2','bstorename_sp2','cstorename_sp2','-append');
    
end

resultsdir = storagePath;

if windows
    
    if ~exist([resultsdir '\' currentYear '\' currentMonth '\' currentDay])
        
        delete('dataplotterstore.mat'); % New dataplotterstore for a new day
        mkdir([resultsdir '\' currentYear '\' currentMonth '\' currentDay]);
        
    end
    
    movefile(['' imagedir_sp2 dataA_sp2 ''],['' resultsdir '\' currentYear '\' currentMonth '\' currentDay '\' astorename_sp2 '']);
    movefile(['' imagedir_sp2 dataB_sp2 ''],['' resultsdir '\' currentYear '\' currentMonth '\' currentDay '\' bstorename_sp2 '']);
    movefile(['' imagedir_sp2 dataC_sp2 ''],['' resultsdir '\' currentYear '\' currentMonth '\' currentDay '\' cstorename_sp2 '']);
    
else
    
    if ~exist([resultsdir '/' currentYear '/' currentMonth '/' currentDay])
        
        delete('dataplotterstore.mat');
        mkdir([resultsdir '/' currentYear '/' currentMonth '/' currentDay]);
        
    end
    
    movefile(['' imagedir_sp2 dataA_sp2 ''],['' resultsdir '/' currentYear '/' currentMonth '/' currentDay '/' astorename_sp2 '']);
    movefile(['' imagedir_sp2 dataB_sp2 ''],['' resultsdir '/' currentYear '/' currentMonth '/' currentDay '/' bstorename_sp2 '']);
    movefile(['' imagedir_sp2 dataC_sp2 ''],['' resultsdir '/' currentYear '/' currentMonth '/' currentDay '/' cstorename_sp2 '']);
    
end

    
%% Call routines for image analysis

    plotspecies2 = 1;
    save('maindata','plotspecies2','-append');
    ana_sp2;
    
    axes(handles.axes_2d_sp2);
    title(['Absorption image of new data set ' element_sp2 filename_sp2],'Interpreter','none')
    colour = str2num(get(handles.edit_ODrange_sp2,'String'));
    axes(handles.axes_2d_sp2);
    caxis(colour_sp2)

