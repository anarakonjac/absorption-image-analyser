% getplotrange.m
% Gets the plot range according to file number from the text box.


load maindata.mat
load configdata.mat

if exist('dataplotterstore.mat','file') == 2
    load dataplotterstore.mat
end

filerange = get(handles.edit_dataplot_range,'String');  % grabs text from text box
filesToPlot = textscan(filerange, '%s','delimiter',',');

filesToPlot = filesToPlot{1};

for count = 1:length(filesToPlot)
    ranges{count} = textscan(filesToPlot{count}, '%s','delimiter','-');
end

if plotstate == 1   % for plotting saved data
    
    if plotdata_sp1 == 1
        
        loadlog_sp1;    % loads saved data log file
        dataCellIndices = strfind(lfc_sp1{2},rootPlot); % finds cells with correct date (can't use "find" function for cells)
        dataCellMatrix = ~cellfun('isempty',dataCellIndices);  % gets nonzero
        dataIndex_sp1 = find(dataCellMatrix);
        
    end
    
    %if (twospecies == 1) && (plotspecies2 == 1)
    if plotdata_sp2 == 1
    
        loadlog_sp2;    % loads saved data log file
        dataCellIndices = strfind(lfc_sp2{2},rootPlot); % finds cells with correct date (can't use "find" function for cells)
        dataCellMatrix = ~cellfun('isempty',dataCellIndices);  % gets nonzero
        dataIndex_sp2 = find(dataCellMatrix);
        
    end    
    
end
    
for count = 1:length(ranges)
    
    lowest(count) = round(str2num(ranges{count}{1}{1}));
    
    if length(ranges{count}{1}) == 2
        
        if strcmp(ranges{count}{1}{2},'end')
            
            if plotstate == 0
                
                if exist('counter_store_sp1','var') && exist('counter_store_sp2','var')
                    highest(count) = max([max(counter_store_sp1) max(counter_store_sp2)]);
                elseif exist('counter_store_sp1','var') && ~exist('counter_store_sp2','var')
                    highest(count) = max(counter_store_sp1);
                elseif ~exist('counter_store_sp1','var') && exist('counter_store_sp2','var')
                    highest(count) = max(counter_store_sp2);
                end
                
            else
                
                if (plotdata_sp1 == 1) && (plotdata_sp2 == 0)
                    
                    highest(count) = str2num(cell2mat(lfc_sp1{3}(max(dataIndex_sp1))));
                    
                elseif (plotdata_sp1 == 0) && (plotdata_sp2 == 1)
                    
                    highest(count) = str2num(cell2mat(lfc_sp2{3}(max(dataIndex_sp2))));
                    
                elseif (plotdata_sp1 == 1) && (plotdata_sp2 == 1)
                    
                    highest_sp1 = str2num(cell2mat(lfc_sp1{3}(max(dataIndex_sp1))));
                    highest_sp2 = str2num(cell2mat(lfc_sp2{3}(max(dataIndex_sp2))));
                    highest(count) = max([highest_sp1 highest_sp2]);
                    
                end
                    
            end
            
        else
            
            highest(count) = round(str2num(ranges{count}{1}{2}));
            
        end
        
    else
        
        highest(count) = 0;
        
    end
    
end

remindex = [];

for count = 1:length(ranges)
    if highest(count) ~= 0
        remindex(length(remindex)+1:length(remindex)+(highest(count)-lowest(count))+1) = lowest(count):1:highest(count);
    else
        remindex(length(remindex)+1) = lowest(count);
    end
end

% Find index of stored data

if plotstate == 0   % new data
    
    if ~isempty(remindex)
    
        for ii = 1:1:length(remindex)
            
            %if (twospecies == 1) && (plotspecies2 == 1)
            if (plotdata_sp1 == 1) && (plotdata_sp2 == 1)
                
                file_index_sp1 = find(counter_store_sp1 == remindex(ii));
                
                if plotspecies2 == 1
                    file_index_sp2 = find(counter_store_sp2 == remindex(ii));
                end
                
                %elseif (sepspecies == 1) && (plotspecies2 == 1)
            elseif (plotdata_sp1 == 0) && (plotdata_sp2 == 1) && (plotspecies2 == 1)
                
                if exist('counter_store_sp1','var') && exist('counter_store_sp2','var')
                    file_index_sp2 = find(counter_store_sp2 == remindex(ii));
                elseif exist('counter_store_sp1','var') && ~exist('counter_store_sp2','var')
                    file_index_sp1 = find(counter_store_sp1 == remindex(ii));
                elseif ~exist('counter_store_sp1','var') && exist('counter_store_sp2','var')
                    file_index_sp2 = find(counter_store_sp2 == remindex(ii));
                end
                
            else
                
                file_index_sp1 = find(counter_store_sp1 == remindex(ii));
                
            end
            
            %if (sepspecies == 0) || ((sepspecies == 1) && (plotspecies2 == 0))
            if plotdata_sp1 == 1
                
                if isempty(file_index_sp1)
                    file_index_string = num2str(remindex(ii));
                    %         datamsg = msgbox(['File ' file_index_string ' does not exist!']);
                else
                    stored_index_sp1(ii) = file_index_sp1;
                end
                
            end
            
            %if ((twospecies == 1) && (plotspecies2 == 1)) || ((sepspecies == 1) && (plotspecies2 == 1))
            if (plotdata_sp2 == 1) && (plotspecies2 == 1)
                
                if ~isempty(file_index_sp2)
                    stored_index_sp2(ii) = file_index_sp2;
                end
                
            end
            
        end
    
    else
        
        if plotdata_sp1 == 1
            stored_index_sp1 = [];
        end
        
        if plotdata_sp2 == 1
            stored_index_sp2 = [];
        end
        
    end
    
else   % saved data
    
    if ~isempty(remindex)
    
        for ii = 1:1:length(remindex)
            
            if plotdata_sp1 == 1
                
                filePos_cell = ismember(lfc_sp1{3}(dataIndex_sp1),num2str(remindex(ii)));
                file_index_sp1 = find(filePos_cell) + min(dataIndex_sp1) - 1;
                
                if ~isempty(file_index_sp1)
                    stored_index_sp1(ii) = file_index_sp1;
                end
                
            end
            
            if plotdata_sp2 == 1
                
                filePos_cell = ismember(lfc_sp2{3}(dataIndex_sp2),num2str(remindex(ii)));
                file_index_sp2 = find(filePos_cell) + min(dataIndex_sp2) - 1;
                
                if ~isempty(file_index_sp2)
                    stored_index_sp2(ii) = file_index_sp2;
                end
                
            end
        end
        
    else % what do do if data plotter asks for images that don't exist
        
        if plotdata_sp1 == 1
            stored_index_sp1 = [];
        end
        
        if plotdata_sp2 == 1
            stored_index_sp2 = [];
        end
        
    end
end

if plotstate == 0   % new data
    
    if plotdata_sp1 == 1
        stored_index_sp1 = stored_index_sp1(find(stored_index_sp1));
    end
    
    if (plotdata_sp2 == 1) && (plotspecies2 == 1)
        stored_index_sp2 = stored_index_sp2(find(stored_index_sp2));
    end
    
else    % saved data
    
    if plotdata_sp1 == 1
        stored_index_sp1 = stored_index_sp1(find(stored_index_sp1));
    end
    
    if plotdata_sp2 == 1
        stored_index_sp2 = stored_index_sp2(find(stored_index_sp2));
    end
    
end
