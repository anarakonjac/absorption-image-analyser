% newdatamenu.m
% Loads newly taken images and calls other routines to analyse them.
% Works for both species or just one.

load configdata.mat;
load maindata.mat;


%% Solis image naming - rename if needed!

dataA_sp1 = 'Rb001.asc';
dataB_sp1 = 'Rb002.asc';
dataC_sp1 = 'Rb003.asc';
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
    
    handles.counterDexter = num2str(counterDexter);
    set(handles.dexterfilenum,'String',handles.counterDexter);
    
    if twospecies == 1
        handles.counterDexter_sp2 = num2str(counterDexter);
        set(handles.text_dexterfilenum_sp2,'String',handles.counterDexter_sp2);
    end
    
    naming = ['_' currentDay currentMonth currentYear '_'];
    
    save('maindata','counterDexter','-append');
        
else
    
%     counterManual = str2num(handles.edit_counter);
    
    naming = ['_' currentDay currentMonth currentYear '_']; % M is appended when the manual counter is used
    
end

if windows
    imagedir_sp1 = [imagePath_sp1 '\'];
    imagedir_sp2 = [imagePath_sp2 '\'];
else
    imagedir_sp1 = [imagePath_sp1 '/'];
    imagedir_sp2 = [imagePath_sp2 '/'];
end


%% Load camera images

if (exist(strcat(imagedir_sp1,dataA_sp1)) & exist(strcat(imagedir_sp1,dataB_sp1)) & exist(strcat(imagedir_sp1,dataC_sp1)))
    disp('Loading data files from last camera shots');
    % ImageAnalyser expects the file names to be in this format:
    % 'data00x.asc'. If you don't like this, you can rename them here.
    
    A = loadascii(strcat(imagedir_sp1,dataA_sp1),strcat(dataA_sp1)); %atoms in cloud + background
    B = loadascii(strcat(imagedir_sp1,dataB_sp1),strcat(dataB_sp1)); %probe + background only 
    C = loadascii(strcat(imagedir_sp1,dataC_sp1),strcat(dataC_sp1)); %background
    % Note that loadascii rotates the image 90 degrees for some reason.
    
    A = rot90(A,numrotations_sp1);
    B = rot90(B,numrotations_sp1);
    C = rot90(C,numrotations_sp1);
    
    if (twospecies == 1)
        
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
        
    end
    
else
    
    errordlg({'Images for data processing not found!','Please run camera program before.'},'File not found');
    return;
    
end

if (dextersyncValue == 1)
    
    filename_sp1 = [naming num2str(counterDexter)];
    save('maindata','filename_sp1','-append');
    
    
    if twospecies == 1
        filename_sp2 = [naming num2str(counterDexter)];
        save('maindata','filename_sp2','-append');
    end
    
else
    
    filename_sp1 = [naming 'M' num2str(counterManual + 1)]; 
    save('maindata','filename_sp1','-append');
    
    if twospecies == 1
        filename_sp2 = [naming 'M' num2str(counterManual + 1)];
        save('maindata','filename_sp2','-append');
    end
    
    % Increment manual counter
    counterManual = counterManual + 1;
    save('maindata','counterManual','-append');
    handles.counterManual = num2str(counterManual);
    set(handles.edit_counter_sp1,'String',handles.counterManual);
    guidata(hObject, handles);
    
end


%% Rename files and put them in the right directory

if (dextersyncValue == 1)
    
    astorename_sp1 = ['a' element_sp1 naming num2str(counterDexter) '.asc']; %create first filename
    bstorename_sp1 = ['b' element_sp1 naming num2str(counterDexter) '.asc']; %create second filename
    cstorename_sp1 = ['c' element_sp1 naming num2str(counterDexter) '.asc']; %create third filename
    
    save('maindata','astorename_sp1','bstorename_sp1','cstorename_sp1','-append');
    
    if (twospecies == 1)
        
        astorename_sp2 = ['a' element_sp2 naming num2str(counterDexter) '.asc']; %create first filename
        bstorename_sp2 = ['b' element_sp2 naming num2str(counterDexter) '.asc']; %create second filename
        cstorename_sp2 = ['c' element_sp2 naming num2str(counterDexter) '.asc']; %create third filename
        
        save('maindata','astorename_sp2','bstorename_sp2','cstorename_sp2','-append');
        
    end
    
else
    
    astorename_sp1 = ['a' element_sp1 naming 'M' num2str(counterManual) '.asc']; %create first filename
    bstorename_sp1 = ['b' element_sp1 naming 'M' num2str(counterManual) '.asc']; %create second filename
    cstorename_sp1 = ['c' element_sp1 naming 'M' num2str(counterManual) '.asc']; %create third filename
    
    save('maindata','astorename_sp1','bstorename_sp1','cstorename_sp1','-append');
    
    if (twospecies == 1)
        
        astorename_sp2 = ['a' element_sp2 naming 'M' num2str(counterManual) '.asc']; %create first filename
        bstorename_sp2 = ['b' element_sp2 naming 'M' num2str(counterManual) '.asc']; %create second filename
        cstorename_sp2 = ['c' element_sp2 naming 'M' num2str(counterManual) '.asc']; %create third filename
        
        save('maindata','astorename_sp2','bstorename_sp2','cstorename_sp2','-append');
        
    end
    
end
    
resultsdir = storagePath;

if windows
    
    if ~exist([resultsdir '\' currentYear '\' currentMonth '\' currentDay])
        
        delete('dataplotterstore.mat'); % New dataplotterstore for a new day
        mkdir([resultsdir '\' currentYear '\' currentMonth '\' currentDay]);
        
    end
    
    movefile(['' imagedir_sp1 dataA_sp1 ''],['' resultsdir '\' currentYear '\' currentMonth '\' currentDay '\' astorename_sp1 '']);
    movefile(['' imagedir_sp1 dataB_sp1 ''],['' resultsdir '\' currentYear '\' currentMonth '\' currentDay '\' bstorename_sp1 '']);
    movefile(['' imagedir_sp1 dataC_sp1 ''],['' resultsdir '\' currentYear '\' currentMonth '\' currentDay '\' cstorename_sp1 '']);
    
    if (twospecies == 1)
        
        movefile(['' imagedir_sp2 dataA_sp2 ''],['' resultsdir '\' currentYear '\' currentMonth '\' currentDay '\' astorename_sp2 '']);
        movefile(['' imagedir_sp2 dataB_sp2 ''],['' resultsdir '\' currentYear '\' currentMonth '\' currentDay '\' bstorename_sp2 '']);
        movefile(['' imagedir_sp2 dataC_sp2 ''],['' resultsdir '\' currentYear '\' currentMonth '\' currentDay '\' cstorename_sp2 '']);
        
    end
    
else
    
    if ~exist([resultsdir '/' currentYear '/' currentMonth '/' currentDay])
        
        delete('dataplotterstore.mat');
        mkdir([resultsdir '/' currentYear '/' currentMonth '/' currentDay]);
        
    end
    
    movefile(['' imagedir_sp1 dataA_sp1 ''],['' resultsdir '/' currentYear '/' currentMonth '/' currentDay '/' astorename_sp1 '']);
    movefile(['' imagedir_sp1 dataB_sp1 ''],['' resultsdir '/' currentYear '/' currentMonth '/' currentDay '/' bstorename_sp1 '']);
    movefile(['' imagedir_sp1 dataC_sp1 ''],['' resultsdir '/' currentYear '/' currentMonth '/' currentDay '/' cstorename_sp1 '']);
    
    if (twospecies == 1)
        
        movefile(['' imagedir_sp2 dataA_sp2 ''],['' resultsdir '/' currentYear '/' currentMonth '/' currentDay '/' astorename_sp2 '']);
        movefile(['' imagedir_sp2 dataB_sp2 ''],['' resultsdir '/' currentYear '/' currentMonth '/' currentDay '/' bstorename_sp2 '']);
        movefile(['' imagedir_sp2 dataC_sp2 ''],['' resultsdir '/' currentYear '/' currentMonth '/' currentDay '/' cstorename_sp2 '']);
        
    end
    
end

    
%% Call routines for image analysis

plotspecies2 = 0;   % Doesn't plot species 2 until species 2 data is processed
save('maindata','plotspecies2','-append');
ana_sp1;    % analysis code

axes(handles.axes_2d_sp1);
% title(['Absorption image of new data set ' element_sp1 filename_sp1],'Interpreter','none')
title([element_sp1 filename_sp1],'Interpreter','none')
colour = str2num(get(handles.edit_ODrange_sp1,'String'));
axes(handles.axes_2d_sp1);
caxis(colour_sp1)

if (twospecies == 1)
    
    plotspecies2 = 1;
    plotdata_sp2 = 1;
    save('maindata','plotspecies2','-append');
    ana_sp2;
    
    axes(handles.axes_2d_sp2);
    title(['Absorption image of new data set ' element_sp2 filename_sp2],'Interpreter','none')
    colour = str2num(get(handles.edit_ODrange_sp2,'String'));
    axes(handles.axes_2d_sp2);
    caxis(colour)
    
end
