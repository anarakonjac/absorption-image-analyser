function varargout = ImageAnalyser(varargin)
% IMAGEANALYSER MATLAB code for ImageAnalyser.fig
%      IMAGEANALYSER, by itself, creates a new IMAGEANALYSER or raises the existing
%      singleton*.
%
%      H = IMAGEANALYSER returns the handle to a new IMAGEANALYSER or the handle to
%      the existing singleton*.
%
%      IMAGEANALYSER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGEANALYSER.M with the given input arguments.
%
%      IMAGEANALYSER('Property','Value',...) creates a new IMAGEANALYSER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ImageAnalyser_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ImageAnalyser_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ImageAnalyser

% Last Modified by GUIDE v2.5 09-Mar-2017 15:39:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ImageAnalyser_OpeningFcn, ...
                   'gui_OutputFcn',  @ImageAnalyser_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ImageAnalyser is made visible.
function ImageAnalyser_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ImageAnalyser (see VARARGIN)

% Initialise data file if it doesn't already exist
if ~exist('maindata.mat') 
    
    dummy = 0;
    save('maindata','dummy');
    newTabName1 = 'Species 1';
    newTabName2 = 'Species 2';
    
else
    
    load maindata.mat
    
    if ~exist('newTabName1')        
        newTabName1 = 'Species 1';
    end
    
    if ~exist('newTabName2')
        newTabName2 = 'Species 2';
    end
    
end

% Set up tabs
handles.tgroup = uitabgroup('Parent', handles.figure_main,'TabLocation', 'top');
handles.tab1 = uitab('Parent', handles.tgroup, 'Title', newTabName1);
handles.tab2 = uitab('Parent', handles.tgroup, 'Title', newTabName2);
handles.tab3 = uitab('Parent', handles.tgroup, 'Title', 'Data Plotter');

set(handles.uipanel1,'Parent',handles.tab1)
set(handles.uipanel2,'Parent',handles.tab2)
set(handles.uipanel3,'Parent',handles.tab3)

set(handles.uipanel2,'position',get(handles.uipanel1,'position'));
set(handles.uipanel3,'position',get(handles.uipanel1,'position'));

% Choose default command line output for ImageAnalyser
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

loadMainState(handles);   % Loads previous state of main GUI

guidata(hObject, handles);



% UIWAIT makes ImageAnalyser wait for user response (see UIRESUME)
% uiwait(handles.figure_main);


% --- Outputs from this function are returned to the command line.
function varargout = ImageAnalyser_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function filemenu_Callback(hObject, eventdata, handles)
% hObject    handle to filemenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function configfile_Callback(hObject, eventdata, handles)
% hObject    handle to configfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

configfileeditor


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton_newdata.
function pushbutton_newdata_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_newdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.olddata = 0;
% handles.firstrun = 0; % old

guidata(hObject, handles);

% Sets ROI state
handles.setROI_pressed_sp1 = 0;
handles.setROI_pressed_sp2 = 0;
handles.zoomout_pressed_sp1 = 0;
handles.zoomout_pressed_sp2 = 0;
handles.fr_pressed_sp1 = 0;
handles.fr_pressed_sp2 = 0;
keepROI_option_sp1 = 0;
keepROI_option_sp2 = 0;

plotstate = 0;  % Plot current day's data. plotstate = 0 -> plot today's data
                % plotstate = 1 -> plot saved data
                
load maindata
load configdata

roi_used = 0;
newdatamenu     % Processes the new images and does everything else

if (twospecies == 1)
    if useROI_sp2 == 1
        keeproi_sp2
    end
end

if inspmsg_state == 1
    inspmsg;
end

guidata(hObject, handles);


% --- Executes on button press in dextersync.
function dextersync_Callback(hObject, eventdata, handles)
% hObject    handle to dextersync (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of dextersync

if (get(hObject,'Value') == get(hObject,'Max'))
    handles.dextersyncValue = 0;     % Do not synchronise with Dexter
else
    handles.dextersyncValue = 1;     % Synchronise with Dexter
end

dextersyncValue = handles.dextersyncValue;

save('maindata','dextersyncValue','-append');



function edit_counter_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_counter_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_counter_sp1 as text
%        str2double(get(hObject,'String')) returns contents of edit_counter_sp1 as a double

handles.counterManual = get(hObject,'String');
counterManual = str2num(handles.counterManual);

save('maindata','counterManual','-append');

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_counter_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_counter_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in selectspecies1.
function setspecies1_Callback(hObject, eventdata, handles)
% hObject    handle to setspecies1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns selectspecies1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from selectspecies1

menuContents = cellstr(get(hObject,'String'));
handles.species1 = menuContents(get(hObject,'Value'));

element_sp1 = cell2mat(handles.species1);
newTabName1 = cell2mat(handles.species1);

save('maindata','newTabName1','element_sp1','-append');

handles.tab1.Title = newTabName1;

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function setspecies1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to setspecies1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject,'String',{'K-39'; 'K-40'; 'K-41'; 'Rb-85'; 'Rb-87'; 'Cs-133'; 'Yb-168'; 'Yb-170'; 'Yb-171'; 'Yb-172'; 'Yb-173'; 'Yb-174'; 'Yb-176'});


% --- Executes during object creation, after setting all properties.
function dexterfilenum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dexterfilenum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in popupmenu_1dsum_sp1.
function popupmenu_1dsum_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_1dsum_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_1dsum_sp1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_1dsum_sp1

species = 'sp1';
sumorcut(species,handles);


% --- Executes during object creation, after setting all properties.
function popupmenu_1dsum_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_1dsum_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_detuning_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_detuning_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_detuning_sp1 as text
%        str2double(get(hObject,'String')) returns contents of edit_detuning_sp1 as a double

handles.detuning_sp1 = get(hObject,'String');
delta_sp1 = str2num(handles.detuning_sp1);

if isempty(delta_sp1)
    
    errordlg({'Value must be numeric! Please re-enter.'},'Bad thing')
    
else
    
    save('maindata','delta_sp1','-append');
    load maindata
    
    switch fittype_sp1
        
        case 'gaussian'
            
            fitnewload_sp1;
            A = Anew_sp1;
            B = Bnew;
            keepROI_option_sp1 = 1;
            roi_used = 1;
            datadisp_sp1;
            roi_used = 0;
            keepROI_option_sp1 = 0;
            
        case 'thomas-fermi'
            
            fitnewloadTF_sp1;
            keepROI_option_sp1 = 1;
            datadispTF_sp1;
            keepROI_option_sp1 = 0;
            
    end
    
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_detuning_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_detuning_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_tof_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_tof_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_tof_sp1 as text
%        str2double(get(hObject,'String')) returns contents of edit_tof_sp1 as a double

handles.tof_sp1 = get(hObject,'String');
tof_sp1 = str2num(handles.tof_sp1);

if isempty(tof_sp1)
    
    errordlg({'Value must be numeric! Please re-enter.'},'Bad thing')
    
else
    
    save('maindata','tof_sp1','-append');
    load maindata
    
    switch fittype_sp1
        
        case 'gaussian'
            
            fitnewload_sp1;
            A = Anew_sp1;
            B = Bnew;
            keepROI_option_sp1 = 1;
            roi_used = 1;
            datadisp_sp1;
            roi_used = 0;
            keepROI_option_sp1 = 0;
            
        case 'thomas-fermi'
            
            fitnewloadTF_sp1;
            keepROI_option_sp1 = 1;
            datadispTF_sp1;
            keepROI_option_sp1 = 0;
            
    end
        
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_tof_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_tof_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_xfreq_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_xfreq_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_xfreq_sp1 as text
%        str2double(get(hObject,'String')) returns contents of edit_xfreq_sp1 as a double

handles.xfreq_sp1 = get(hObject,'String');
xfreq_sp1 = str2num(handles.xfreq_sp1);

if isempty(xfreq_sp1)
    
    errordlg({'Value must be numeric! Please re-enter.'},'Bad thing')
    
else
    
    save('maindata','xfreq_sp1','-append');
    load maindata
    
    switch fittype_sp1
        
        case 'gaussian'
            
            fitnewload_sp1;
            A = Anew_sp1;
            B = Bnew;
            keepROI_option_sp1 = 1;
            roi_used = 1;
            datadisp_sp1;
            roi_used = 0;
            keepROI_option_sp1 = 0;
            
        case 'thomas-fermi'
            
            fitnewloadTF_sp1;
            keepROI_option_sp1 = 1;
            datadispTF_sp1;
            keepROI_option_sp1 = 0;
            
    end
    
end

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit_xfreq_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_xfreq_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_yfreq_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_yfreq_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_yfreq_sp1 as text
%        str2double(get(hObject,'String')) returns contents of edit_yfreq_sp1 as a double

handles.yfreq_sp1 = get(hObject,'String');
yfreq_sp1 = str2num(handles.yfreq_sp1);

if isempty(yfreq_sp1)
    
    errordlg({'Value must be numeric! Please re-enter.'},'Bad thing')
    
else
    
    save('maindata','yfreq_sp1','-append');
    load maindata
    
    switch fittype_sp1
        
        case 'gaussian'
            
            fitnewload_sp1;
            A = Anew_sp1;
            B = Bnew;
            keepROI_option_sp1 = 1;
            roi_used = 1;
            datadisp_sp1;
            roi_used = 0;
            keepROI_option_sp1 = 0;
            
        case 'thomas-fermi'
            
            fitnewloadTF_sp1;
            keepROI_option_sp1 = 1;
            datadispTF_sp1;
            keepROI_option_sp1 = 0;
            
    end
    
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_yfreq_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_yfreq_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_zfreq_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_zfreq_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_zfreq_sp1 as text
%        str2double(get(hObject,'String')) returns contents of edit_zfreq_sp1 as a double

handles.zfreq_sp1 = get(hObject,'String');
zfreq_sp1 = str2num(handles.zfreq_sp1);

if isempty(zfreq_sp1)
    
    errordlg({'Value must be numeric! Please re-enter.'},'Bad thing')
    
else
    
    save('maindata','zfreq_sp1','-append');
    load maindata
    
    switch fittype_sp1
        
        case 'gaussian'
            
            fitnewload_sp1;
            A = Anew_sp1;
            B = Bnew;
            keepROI_option_sp1 = 1;
            roi_used = 1;
            datadisp_sp1;
            roi_used = 0;
            keepROI_option_sp1 = 0;
            
        case 'thomas-fermi'
            
            fitnewloadTF_sp1;
            keepROI_option_sp1 = 1;
            datadispTF_sp1;
            keepROI_option_sp1 = 0;
            
    end
    
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_zfreq_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_zfreq_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figure_main.
function figure_main_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure

saveMainState(handles);
delete(hObject);


% --- Executes during object creation, after setting all properties.
function choose_ana_type_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choose_ana_type_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in choose_ana_type_sp1.
function choose_ana_type_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to choose_ana_type_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns choose_ana_type_sp1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from choose_ana_type_sp1

menuContents = cellstr(get(hObject,'String'));
handles.ana_type_sp1 = menuContents(get(hObject,'Value'));
analysis_type_sp1 = cell2mat(handles.ana_type_sp1);

save('maindata','analysis_type_sp1','-append');

guidata(hObject, handles);



function edit_ODrange_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ODrange_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ODrange_sp1 as text
%        str2double(get(hObject,'String')) returns contents of edit_ODrange_sp1 as a double

colour_sp1 = str2num(get(handles.edit_ODrange_sp1,'String'));
axes(handles.axes_2d_sp1);
caxis(colour_sp1)

save('maindata','colour_sp1','-append');


% --- Executes during object creation, after setting all properties.
function edit_ODrange_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ODrange_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_olddata_sp1.
function pushbutton_olddata_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_olddata_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.olddata = 1;
handles.firstrun = 0;

handles.fr_pressed_sp1 = 0;
handles.fr_pressed_sp2 = 0;

guidata(hObject, handles);

roi_used = 0;
olddatamenu_sp1;

guidata(hObject, handles);


% --- Executes on button press in pushbutton_setroi_sp1.
function pushbutton_setroi_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_setroi_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.setROI_pressed_sp1 = 1;
keepROI_option_sp1 = 0;
roimenu_sp1;
handles.setROI_pressed_sp1 = 0;

guidata(hObject, handles);

% --- Executes on button press in checkbox_square_sp1.
function checkbox_useROI_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_square_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_useROI_sp1

if (get(hObject,'Value') == get(hObject,'Max'))
    handles.useROI_sp1 = 1;     % Use ROI
else
    handles.useROI_sp1 = 0;     % Don't use ROI
end

useROI_sp1 = handles.useROI_sp1;

save('maindata','useROI_sp1','-append');


% --- Executes on button press in checkbox_square_sp1.
function checkbox_square_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_square_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_square_sp1



% --- Executes on button press in pushbutton_zoomout_sp1.
function pushbutton_zoomout_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_zoomout_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.zoomout_pressed_sp1 = 1;
keepROI_option_sp1 = 0;
zoomoutmenu_sp1;
handles.zoomout_pressed_sp1 = 0;

guidata(hObject, handles);


% --- Executes on button press in pushbutton_savedata.
function pushbutton_savedata_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_savedata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

savedata


% --- Executes on button press in pushbutton_crosscut_sp1.
function pushbutton_crosscut_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_crosscut_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

species = 'sp1';
plotlinemenu(species,handles);  % Does the crosscut thing

guidata(hObject, handles);


% --- Executes on selection change in popupmenu_colourmap_sp1.
function popupmenu_colourmap_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_colourmap_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_colourmap_sp1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_colourmap_sp1

species = 'sp1';
setmapmenu(species,handles);    % Sets the colourmap


% --- Executes during object creation, after setting all properties.
function popupmenu_colourmap_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_colourmap_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6



function edit_counter_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_counter_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_counter_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_counter_sp2 as a double


% --- Executes during object creation, after setting all properties.
function edit_counter_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_counter_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in setspecies2.
function setspecies2_Callback(hObject, eventdata, handles)
% hObject    handle to setspecies2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns setspecies2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from setspecies2

menuContents = cellstr(get(hObject,'String'));
handles.species2 = menuContents(get(hObject,'Value'));

element_sp2 = cell2mat(handles.species2);
newTabName2 = cell2mat(handles.species2);

save('maindata','newTabName2','element_sp2','-append');

handles.tab2.Title = newTabName2;

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function setspecies2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to setspecies2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

set(hObject,'String',{'K-39'; 'K-40'; 'K-41'; 'Rb-85'; 'Rb-87'; 'Cs-133'; 'Yb-168'; 'Yb-170'; 'Yb-171'; 'Yb-172'; 'Yb-173'; 'Yb-174'; 'Yb-176'});



% --- Executes on selection change in popupmenu_1dsum_sp2.
function popupmenu_1dsum_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_1dsum_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_1dsum_sp2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_1dsum_sp2

species = 'sp2';
sumorcut(species,handles);


% --- Executes during object creation, after setting all properties.
function popupmenu_1dsum_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_1dsum_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_detuning_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_detuning_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_detuning_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_detuning_sp2 as a double

handles.detuning_sp2 = get(hObject,'String');
delta_sp2 = str2num(handles.detuning_sp2);

if isempty(delta_sp2)
    
    errordlg({'Value must be numeric! Please re-enter.'},'Bad thing')
    
else
    
    save('maindata','delta_sp2','-append');
    load maindata
    
    switch fittype_sp2
        
        case 'gaussian'
            
            fitnewload_sp2;
            A = Anew_sp2;
            B = Bnew;
            keepROI_option_sp2 = 1;
            roi_used = 1;
            datadisp_sp2;
            roi_used = 0;
            keepROI_option_sp2 = 0;
            
        case 'thomas-fermi'
            
            fitnewloadTF_sp2;
            keepROI_option_sp2 = 1;
            datadispTF_sp2;
            keepROI_option_sp2 = 0;
            
    end
    
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_detuning_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_detuning_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_tof_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_tof_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_tof_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_tof_sp2 as a double

handles.tof_sp2 = get(hObject,'String');
tof_sp2 = str2num(handles.tof_sp2);

if isempty(tof_sp2)
    
    errordlg({'Value must be numeric! Please re-enter.'},'Bad thing')
    
else
    
    save('maindata','tof_sp2','-append');
    load maindata
    
    switch fittype_sp2
        
        case 'gaussian'
            
            fitnewload_sp2;
            A = Anew_sp2;
            B = Bnew;
            keepROI_option_sp2 = 1;
            roi_used = 1;
            datadisp_sp2;
            roi_used = 0;
            keepROI_option_sp2 = 0;
            
        case 'thomas-fermi'
            
            fitnewloadTF_sp2;
            keepROI_option_sp2 = 1;
            datadispTF_sp2;
            keepROI_option_sp2 = 0;
            
    end
    
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_tof_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_tof_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_xfreq_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_xfreq_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_xfreq_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_xfreq_sp2 as a double

handles.xfreq_sp2 = get(hObject,'String');
xfreq_sp2 = str2num(handles.xfreq_sp2);

if isempty(xfreq_sp2)
    
    errordlg({'Value must be numeric! Please re-enter.'},'Bad thing')
    
else
    
    save('maindata','xfreq_sp2','-append');
    load maindata
    
    switch fittype_sp2
        
        case 'gaussian'
            
            fitnewload_sp2;
            A = Anew_sp2;
            B = Bnew;
            keepROI_option_sp2 = 1;
            roi_used = 1;
            datadisp_sp2;
            roi_used = 0;
            keepROI_option_sp2 = 0;
            
        case 'thomas-fermi'
            
            fitnewloadTF_sp2;
            keepROI_option_sp2 = 1;
            datadispTF_sp2;
            keepROI_option_sp2 = 0;
            
    end
    
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_xfreq_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_xfreq_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_yfreq_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_yfreq_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_yfreq_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_yfreq_sp2 as a double

handles.yfreq_sp2 = get(hObject,'String');
yfreq_sp2 = str2num(handles.yfreq_sp2);

if isempty(yfreq_sp2)
    
    errordlg({'Value must be numeric! Please re-enter.'},'Bad thing')
    
else
    
    save('maindata','yfreq_sp2','-append');
    load maindata
    
    switch fittype_sp2
        
        case 'gaussian'
            
            fitnewload_sp2;
            A = Anew_sp2;
            B = Bnew;
            keepROI_option_sp2 = 1;
            roi_used = 1;
            datadisp_sp2;
            roi_used = 0;
            keepROI_option_sp2 = 0;
            
        case 'thomas-fermi'
            
            fitnewloadTF_sp2;
            keepROI_option_sp2 = 1;
            datadispTF_sp2;
            keepROI_option_sp2 = 0;
            
    end
    
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_yfreq_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_yfreq_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_zfreq_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_zfreq_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_zfreq_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_zfreq_sp2 as a double

handles.zfreq_sp2 = get(hObject,'String');
zfreq_sp2 = str2num(handles.zfreq_sp2);

if isempty(zfreq_sp2)
    
    errordlg({'Value must be numeric! Please re-enter.'},'Bad thing')
    
else
    
    save('maindata','zfreq_sp2','-append');
    load maindata
    
    switch fittype_sp2
        
        case 'gaussian'
            
            fitnewload_sp2;
            A = Anew_sp2;
            B = Bnew;
            keepROI_option_sp2 = 1;
            roi_used = 1;
            datadisp_sp2;
            roi_used = 0;
            keepROI_option_sp2 = 0;
            
        case 'thomas-fermi'
            
            fitnewloadTF_sp2;
            keepROI_option_sp2 = 1;
            datadispTF_sp2;
            keepROI_option_sp2 = 0;
            
    end
    
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_zfreq_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_zfreq_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in choose_ana_type_sp2.
function choose_ana_type_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to choose_ana_type_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns choose_ana_type_sp2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from choose_ana_type_sp2

menuContents = cellstr(get(hObject,'String'));
handles.ana_type_sp2 = menuContents(get(hObject,'Value'));
analysis_type_sp2 = cell2mat(handles.ana_type_sp2);

save('maindata','analysis_type_sp2','-append');

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function choose_ana_type_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choose_ana_type_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ODrange_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ODrange_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ODrange_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_ODrange_sp2 as a double

colour_sp2 = str2num(get(handles.edit_ODrange_sp2,'String'));
axes(handles.axes_2d_sp2);
caxis(colour_sp2)

save('maindata','colour_sp2','-append');


% --- Executes during object creation, after setting all properties.
function edit_ODrange_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ODrange_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_setroi_sp2.
function pushbutton_setroi_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_setroi_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.setROI_pressed_sp2 = 1;
keepROI_option_sp2 = 0;
roimenu_sp2
handles.setROI_pressed_sp2 = 0;

guidata(hObject, handles);


% --- Executes on button press in checkbox_useROI_sp2.
function checkbox_useROI_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_useROI_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_useROI_sp2

if (get(hObject,'Value') == get(hObject,'Max'))
    handles.useROI_sp2 = 1;     % Use ROI
else
    handles.useROI_sp2 = 0;     % Don't use ROI
end

useROI_sp2 = handles.useROI_sp2;

save('maindata','useROI_sp2','-append');


% --- Executes on button press in checkbox_square_sp2.
function checkbox_square_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_square_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_square_sp2


% --- Executes on button press in pushbutton_zoomout_sp2.
function pushbutton_zoomout_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_zoomout_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.zoomout_pressed_sp2 = 1;
keepROI_option_sp2 = 0;
zoomoutmenu_sp2;
handles.zoomout_pressed_sp2 = 0;

guidata(hObject, handles);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_crosscut_sp2.
function pushbutton_crosscut_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_crosscut_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

species = 'sp2';
plotlinemenu(species,handles);

guidata(hObject, handles);


% --- Executes on selection change in popupmenu_colourmap_sp2.
function popupmenu_colourmap_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_colourmap_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_colourmap_sp2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_colourmap_sp2

species = 'sp2';
setmapmenu(species,handles);


% --- Executes during object creation, after setting all properties.
function popupmenu_colourmap_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_colourmap_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_refit_sp2.
function checkbox_refit_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_refit_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_refit_sp2


% --- Executes on button press in checkbox_refit_sp1.
function checkbox_refit_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_refit_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_refit_sp1


% --- Executes on button press in pushbutton_olddata_sp2.
function pushbutton_olddata_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_olddata_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% This bit doesn't actually do anything, because there's no option to load
% old data into the second tab. Leave it just in case we want to extend to
% load two images at once.

handles.olddata = 1;
handles.firstrun = 0;

guidata(hObject, handles);

handles.olddata = 1;

roi_used = 0;
olddatamenu_sp2;    % unfinished!

load maindata.mat

if useROI_sp2 == 1
    keeproi_sp2;
end

guidata(hObject, handles);



function edit_variable_Callback(hObject, eventdata, handles)
% hObject    handle to edit_variable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_variable as text
%        str2double(get(hObject,'String')) returns contents of edit_variable as a double

handles.variable = get(hObject,'String');

load maindata
load configdata
    
variableValue = str2num(handles.variable);
    
if isempty(variableValue)
    
    errordlg({'Value must be numeric! Please re-enter.'},'Bad thing')
    
else
    
    save('maindata','variableValue','-append');
    
    load dataplotterstore
    
    if sepspecies == 0
        
        variable_store_sp1(end) = variableValue;    % update data plotter storage file if variable is edited
        save('dataplotterstore','variable_store_sp1','-append');
        
        if twospecies == 1
            variable_store_sp2(end) = variableValue;
            save('dataplotterstore','variable_store_sp2','-append');
        end
        
    else
        
        variable_store_sp1(end) = variableValue;    % update data plotter storage file if variable is edited
        save('dataplotterstore','variable_store_sp1','-append');
        
    end
    
    updateplottab;

end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_variable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_variable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_label_Callback(hObject, eventdata, handles)
% hObject    handle to edit_label (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_label as text
%        str2double(get(hObject,'String')) returns contents of edit_label as a double



% --- Executes during object creation, after setting all properties.
function edit_label_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_label (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_fittype_sp1.
function popupmenu_fittype_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_fittype_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_fittype_sp1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_fittype_sp1

fittype_val = get(handles.popupmenu_fittype_sp1,'Value');

switch fittype_val
    case 1
        fittype_sp1 = 'gaussian';
    case 2
        fittype_sp1 = 'thomas-fermi';
end

save('maindata','fittype_sp1','-append');


% --- Executes during object creation, after setting all properties.
function popupmenu_fittype_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_fittype_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_fittype_sp2.
function popupmenu_fittype_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_fittype_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_fittype_sp2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_fittype_sp2

fittype_val = get(handles.popupmenu_fittype_sp2,'Value');

switch fittype_val
    case 1
        fittype_sp2 = 'gaussian';
    case 2
        fittype_sp2 = 'thomas-fermi';
end

save('maindata','fittype_sp2','-append');


% --- Executes during object creation, after setting all properties.
function popupmenu_fittype_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_fittype_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_useFF_sp2.
function checkbox_useFF_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_useFF_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_useFF_sp2

if (get(hObject,'Value') == get(hObject,'Max'))
    handles.useFF_sp2 = 1;     % Use Fourier filter
else
    handles.useFF_sp2 = 0;     % Don't Fourier filter
end

useFF_sp2 = handles.useFF_sp2;

save('maindata','useFF_sp2','-append');


% --- Executes on button press in checkbox_useFF_sp1.
function checkbox_useFF_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_useFF_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_useFF_sp1

if (get(hObject,'Value') == get(hObject,'Max'))
    handles.useFF_sp1 = 1;     % Use Fourier filter
else
    handles.useFF_sp1 = 0;     % Don't use Fourier filter
end

useFF_sp1 = handles.useFF_sp1;

save('maindata','useFF_sp1','-append');


% --- Executes on selection change in popupmenu_dataplot_x1.
function popupmenu_dataplot_x1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_x1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_x1

load maindata.mat

menuvalue_x1 = get(handles.popupmenu_dataplot_x1,'Value');

if menuvalue_x1 == 2
    xlabel(plotvariablename)
    x1_label = plotvariablename;
else
    menuContents = cellstr(get(hObject,'String'));
    axes(handles.dataplot1);
    xlabel(menuContents(menuvalue_x1))
    x1_label = menuContents(menuvalue_x1);
end

guidata(hObject, handles);
save('maindata','menuvalue_x1','x1_label','-append');

if plotstate == 0
    updateplottab;
else
    plotsaveddata;
end



% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_y1.
function popupmenu_dataplot_y1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_y1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_y1

load maindata.mat

menuvalue_y1 = get(handles.popupmenu_dataplot_y1,'Value');

if menuvalue_y1 == 2
    ylabel(plotvariablename)
    y1_label = plotvariablename;
else
    menuContents = cellstr(get(hObject,'String'));
    axes(handles.dataplot1);
    ylabel(menuContents(menuvalue_y1))
    y1_label = menuContents(menuvalue_y1);
end

guidata(hObject, handles);
save('maindata','menuvalue_y1','y1_label','-append');

if plotstate == 0
    updateplottab;
else
    plotsaveddata;
end



% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_x2.
function popupmenu_dataplot_x2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_x2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_x2

load maindata.mat

menuvalue_x2 = get(handles.popupmenu_dataplot_x2,'Value');

if menuvalue_x2 == 2
    xlabel(plotvariablename)
    x2_label = plotvariablename;
else
    menuContents = cellstr(get(hObject,'String'));
    axes(handles.dataplot2);
    xlabel(menuContents(menuvalue_x2))
    x2_label = menuContents(menuvalue_x2);
end

guidata(hObject, handles);
save('maindata','menuvalue_x2','x2_label','-append');

if plotstate == 0
    updateplottab;
else
    plotsaveddata;
end


% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_y2.
function popupmenu_dataplot_y2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_y2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_y2

load maindata.mat

menuvalue_y2 = get(handles.popupmenu_dataplot_y2,'Value');

if menuvalue_y2 == 2
    ylabel(plotvariablename)
    y2_label = plotvariablename;
else
    menuContents = cellstr(get(hObject,'String'));
    axes(handles.dataplot2);
    ylabel(menuContents(menuvalue_y2))
    y2_label = menuContents(menuvalue_y2);
end

guidata(hObject, handles);
save('maindata','menuvalue_y2','y2_label','-append');

if plotstate == 0
    updateplottab;
else
    plotsaveddata;
end


% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_y3.
function popupmenu_dataplot_y3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_y3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_y3

load maindata.mat

menuvalue_y3 = get(handles.popupmenu_dataplot_y3,'Value');

if menuvalue_y3 == 2
    ylabel(plotvariablename)
    y3_label = plotvariablename;
else
    menuContents = cellstr(get(hObject,'String'));
    axes(handles.dataplot3);
    ylabel(menuContents(menuvalue_y3))
    y3_label = menuContents(menuvalue_y3);
end

guidata(hObject, handles);
save('maindata','menuvalue_y3','y3_label','-append');

if plotstate == 0
    updateplottab;
else
    plotsaveddata;
end


% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_y3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_x3.
function popupmenu_dataplot_x3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_x3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_x3

load maindata.mat

menuvalue_x3 = get(handles.popupmenu_dataplot_x3,'Value');

if menuvalue_x3 == 2
    xlabel(plotvariablename)
    x3_label = plotvariablename;
else
    menuContents = cellstr(get(hObject,'String'));
    axes(handles.dataplot3);
    xlabel(menuContents(menuvalue_x3))
    x3_label = menuContents(menuvalue_x3);
end

guidata(hObject, handles);
save('maindata','menuvalue_x3','x3_label','-append');

if plotstate == 0
    updateplottab;
else
    plotsaveddata;
end


% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_x3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_y4.
function popupmenu_dataplot_y4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_y4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_y4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_y4

load maindata.mat

menuvalue_y4 = get(handles.popupmenu_dataplot_y4,'Value');

if menuvalue_y4 == 2
    ylabel(plotvariablename)
    y4_label = plotvariablename;
else
    menuContents = cellstr(get(hObject,'String'));
    axes(handles.dataplot4);
    ylabel(menuContents(menuvalue_y4))
    y4_label = menuContents(menuvalue_y4);
end

guidata(hObject, handles);
save('maindata','menuvalue_y4','y4_label','-append');

if plotstate == 0
    updateplottab;
else
    plotsaveddata;
end


% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_y4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_y4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_y5.
function popupmenu_dataplot_y5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_y5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_y5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_y5

load maindata.mat

menuvalue_y5 = get(handles.popupmenu_dataplot_y5,'Value');

if menuvalue_y5 == 2
    ylabel(plotvariablename)
    y5_label = plotvariablename;
else
    menuContents = cellstr(get(hObject,'String'));
    axes(handles.dataplot5);
    ylabel(menuContents(menuvalue_y5))
    y5_label = menuContents(menuvalue_y5);
end

guidata(hObject, handles);
save('maindata','menuvalue_y5','y5_label','-append');

if plotstate == 0
    updateplottab;
else
    plotsaveddata;
end


% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_y5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_y5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_x4.
function popupmenu_dataplot_x4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_x4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_x4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_x4

load maindata.mat

menuvalue_x4 = get(handles.popupmenu_dataplot_x4,'Value');

if menuvalue_x4 == 2
    xlabel(plotvariablename)
    x4_label = plotvariablename;
else
    menuContents = cellstr(get(hObject,'String'));
    axes(handles.dataplot4);
    xlabel(menuContents(menuvalue_x4))
    x4_label = menuContents(menuvalue_x4);
end

guidata(hObject, handles);
save('maindata','menuvalue_x4','x4_label','-append');

if plotstate == 0
    updateplottab;
else
    plotsaveddata;
end

% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_x4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_x4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_x5.
function popupmenu_dataplot_x5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_x5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_x5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_x5

load maindata.mat

menuvalue_x5 = get(handles.popupmenu_dataplot_x5,'Value');

if menuvalue_x5 == 2
    xlabel(plotvariablename)
    x5_label = plotvariablename;
else
    menuContents = cellstr(get(hObject,'String'));
    axes(handles.dataplot5);
    xlabel(menuContents(menuvalue_x5))
    x5_label = menuContents(menuvalue_x5);
end

guidata(hObject, handles);
save('maindata','menuvalue_x5','x5_label','-append');

if plotstate == 0
    updateplottab;
else
    plotsaveddata;
end


% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_x5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_x5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_x6.
function popupmenu_dataplot_x6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_x6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_x6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_x6

load maindata.mat

menuvalue_x6 = get(handles.popupmenu_dataplot_x6,'Value');

if menuvalue_x6 == 2
    xlabel(plotvariablename)
    x6_label = plotvariablename;
else
    menuContents = cellstr(get(hObject,'String'));
    axes(handles.dataplot6);
    xlabel(menuContents(menuvalue_x6))
    x6_label = menuContents(menuvalue_x6);
end

guidata(hObject, handles);
save('maindata','menuvalue_x6','x6_label','-append');

if plotstate == 0
    updateplottab;
else
    plotsaveddata;
end


% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_x6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_x6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_y6.
function popupmenu_dataplot_y6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_y6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_y6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_y6

load maindata.mat

menuvalue_y6 = get(handles.popupmenu_dataplot_y6,'Value');

if menuvalue_y6 == 2
    ylabel(plotvariablename)
    y6_label = plotvariablename;
else
    menuContents = cellstr(get(hObject,'String'));
    axes(handles.dataplot6);
    ylabel(menuContents(menuvalue_y6))
    y6_label = menuContents(menuvalue_y6);
end

guidata(hObject, handles);
save('maindata','menuvalue_y6','y6_label','-append');

if plotstate == 0
    updateplottab;
else
    plotsaveddata;
end


% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_y6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_y6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_year.
function popupmenu_dataplot_year_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_year contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_year


% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_year_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_month.
function popupmenu_dataplot_month_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_month contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_month


% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_month_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_dataplot_day.
function popupmenu_dataplot_day_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_dataplot_day contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_dataplot_day


% --- Executes during object creation, after setting all properties.
function popupmenu_dataplot_day_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_dataplot_day (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_dataplot_range_Callback(hObject, eventdata, handles)
% hObject    handle to edit_dataplot_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_dataplot_range as text
%        str2double(get(hObject,'String')) returns contents of edit_dataplot_range as a double

% filerange = get(handles.edit_dataplot_range,'String');
% filenumbers = textscan(filerange, '%s','delimiter',',');

load maindata.mat

if plotstate == 1   % plot saved data
    plotsaveddata;
else
    updateplottab;
end


% --- Executes during object creation, after setting all properties.
function edit_dataplot_range_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_dataplot_range (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_plotvarname_Callback(hObject, eventdata, handles)
% hObject    handle to edit_plotvarname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_plotvarname as text
%        str2double(get(hObject,'String')) returns contents of edit_plotvarname as a double

load maindata

handles.plotvariablename = get(hObject,'String');
plotvariablename = handles.plotvariablename;

save('maindata','plotvariablename','-append');

if plotstate == 0
    updateplottab;
else
    plotsaveddata;
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_plotvarname_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_plotvarname (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton_plotolddata.
function togglebutton_plotolddata_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton_plotolddata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton_plotolddata

load maindata.mat
load configdata.mat

plotstate = get(hObject,'Value');

% Grab today's date
currentDate = date;

currentYear = num2str(year(date));
[monthNum currentMonth] = month(date);
monthFullName = datestr(date,'mmmm');
currentDay = num2str(day(date),'%02d');

% Plot from current day or old saved data
if plotstate == 1   % plots saved data
    
    handles.plotsaved = 1;
    pathname = [storagePath filesep currentYear filesep currentMonth filesep currentDay];
    [filename_plot_sp1,directoryname] = uigetfile([pathname filesep '*.asc']);
    set(handles.text_plotdate,'String',['Data from ' directoryname]);
    rootPlot = filename_plot_sp1(8:12);
    yearPlot = filename_plot_sp1(13:16);
    filename_plot_sp2 = filename_plot_sp1;
    save('maindata','rootPlot','yearPlot','filename_plot_sp1','filename_plot_sp2','-append');
    
else
    
    handles.plotsaved = 0;
    set(handles.text_plotdate,'String','Plot as you go!');
    
end

save('maindata','plotstate','-append');

guidata(hObject, handles);
    
    


% --- Executes on button press in checkbox_varsync.
function checkbox_varsync_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_varsync (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_varsync

varsync = get(hObject,'Value');
handles.varsync = varsync;

save('maindata','varsync','-append');

guidata(hObject, handles);


% --- Executes on button press in checkbox_useFR_sp2.
function checkbox_useFR_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_useFR_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_useFR_sp2

if (get(hObject,'Value') == get(hObject,'Max'))
    handles.useFR_sp2 = 1;     % Use Fourier filter
else
    handles.useFR_sp2 = 0;     % Don't use Fourier filter
end

useFR_sp2 = handles.useFR_sp2;

save('maindata','useFR_sp2','-append');


% --- Executes on button press in checkbox_useFR_sp1.
function checkbox_useFR_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_useFR_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_useFR_sp1

if (get(hObject,'Value') == get(hObject,'Max'))
    handles.useFR_sp1 = 1;     % Use Fourier filter
else
    handles.useFR_sp1 = 0;     % Don't use Fourier filter
end

useFR_sp1 = handles.useFR_sp1;

save('maindata','useFR_sp1','-append');


% --------------------------------------------------------------------
function menu_exportplotterdata_Callback(hObject, eventdata, handles)
% hObject    handle to menu_exportplotterdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

exportplotterdataCSV;


% --------------------------------------------------------------------
function menu_exportplot_Callback(hObject, eventdata, handles)
% hObject    handle to menu_exportplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

exportplot;


% --------------------------------------------------------------------
function menu_exportfitdata_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to menu_exportfitdata_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

exportfits_sp1;


% --------------------------------------------------------------------
function menu_exportfitdata_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to menu_exportfitdata_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

exportfits_sp2;


% --------------------------------------------------------------------
function exportthings_Callback(hObject, eventdata, handles)
% hObject    handle to exportthings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_exportabsimage_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to menu_exportabsimage_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

exportabsimage_sp1;


% --------------------------------------------------------------------
function menu_exportabsimage_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to menu_exportabsimage_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

exportabsimage_sp2;


% --- Executes on button press in pushbutton_fr_sp1.
function pushbutton_fr_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_fr_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.fr_pressed_sp1 = 1;
keepROI_option_sp1 = 0;

removefringes_sp1;

handles.fr_pressed_sp1 = 0;

guidata(hObject, handles);


% --- Executes on button press in pushbutton_fr_sp2.
function pushbutton_fr_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_fr_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.fr_pressed_sp2 = 1;
keepROI_option_sp2 = 0;

removefringes_sp2;

handles.fr_pressed_sp2 = 0;

guidata(hObject, handles);


% --- Executes on button press in pushbutton_newdata_sp2.
function pushbutton_newdata_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_newdata_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.olddata = 0;
% handles.firstrun = 0; % old

guidata(hObject, handles);

% Sets ROI state
handles.setROI_pressed_sp1 = 0;
handles.setROI_pressed_sp2 = 0;
handles.zoomout_pressed_sp1 = 0;
handles.zoomout_pressed_sp2 = 0;
handles.fr_pressed_sp1 = 0;
handles.fr_pressed_sp2 = 0;
keepROI_option_sp1 = 0;
keepROI_option_sp2 = 0;

plotstate = 0;  % Plot current day's data. plotstate = 0 -> plot today's data
                % plotstate = 1 -> plot saved data
                
load maindata
load configdata

roi_used = 0;   % no ROI when first loaded

if sepspecies == 1
    newdatamenu_sp2     % Processes the new images and does everything else
elseif twospecies == 1
    newdatamenu
else
    errordlg({'Single species mode selected. Please check the configuration file.'},'Wrong Mode')
end

if inspmsg_state == 1
    inspmsg;
end

guidata(hObject, handles);


% --- Executes on button press in pushbutton_savedata_sp2.
function pushbutton_savedata_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_savedata_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load configdata

if twospecies == 1
    savedata
elseif sepspecies == 1
    savedata_sp2
end



function edit_variable_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_variable_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_variable_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_variable_sp2 as a double

handles.variable = get(hObject,'String');

load maindata
load configdata
    
variableValue = str2num(handles.variable);
    
if isempty(variableValue)
    
    errordlg({'Value must be numeric! Please re-enter.'},'Bad thing')
    
else
    
    load dataplotterstore
    
    if sepspecies == 1
        
        variable_store_sp2(end) = variableValue;
        save('dataplotterstore','variable_store_sp2','-append');
        
    else
        
        save('maindata','variableValue','-append');
        
        variable_store_sp2(end) = variableValue;    % update data plotter storage file if variable is edited
        save('dataplotterstore','variable_store_sp2','-append');
        
        if twospecies == 1
            variable_store_sp1(end) = variableValue;
            save('dataplotterstore','variable_store_sp1','-append');
        end
        
        updateplottab;
        
    end
    
end

if varsync == 0
    
    if sepspecies == 1
        
        variable_store_sp2(end) = variableValue;
        save('dataplotterstore','variable_store_sp2','-append');
        
    else
        
        variableValue = str2num(handles.variable);
        
        if isempty(variableValue)
            
            errordlg({'Value must be numeric! Please re-enter.'},'Bad thing')
            
        else
            
            save('maindata','variableValue','-append');
            
            load dataplotterstore
            load configdata
            
            variable_store_sp1(end) = variableValue;    % update data plotter storage file if variable is edited
            save('dataplotterstore','variable_store_sp1','-append');
            
            if twospecies == 1
                variable_store_sp2(end) = variableValue;
                save('dataplotterstore','variable_store_sp2','-append');
            end
            
            updateplottab;
            
        end
        
    end
    
end

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit_variable_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_variable_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_plotsp1data.
function checkbox_plotsp1data_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_plotsp1data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_plotsp1data

% plotdata_sp1 = get(hObject,'Value');
% 
% save('maindata','plotdata_sp1','-append');
% 
% updateplottab




% --- Executes on button press in checkbox_plotsp2data.
function checkbox_plotsp2data_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_plotsp2data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_plotsp2data

% plotdata_sp2 = get(hObject,'Value');
% 
% save('maindata','plotdata_sp2','-append');
% 
% updateplottab


% --- Executes on button press in radiobutton_select_sp1.
function radiobutton_select_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_select_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_select_sp1


% --- Executes when selected object is changed in uibuttongroup_species.
function uibuttongroup_species_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup_species 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

load maindata

switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
    
    case 'radiobutton_select_sp1'
        
        plotdata_sp1 = 1;
        plotdata_sp2 = 0;
        plotspecies2 = 0;
        save('maindata','plotdata_sp1','plotdata_sp2','plotspecies2','-append')
        
        if plotstate == 0
            updateplottab
        else
            plotsaveddata
        end
        
    case 'radiobutton_select_sp2'
        
        plotdata_sp1 = 0;
        plotdata_sp2 = 1;
        plotspecies2 = 1;
        save('maindata','plotdata_sp1','plotdata_sp2','plotspecies2','-append')
        
        if plotstate == 0
            updateplottab
        else
            plotsaveddata
        end
        
    case 'radiobutton_selectboth'
        
        plotdata_sp1 = 1;
        plotdata_sp2 = 1;
        plotspecies2 = 1;
        save('maindata','plotdata_sp1','plotdata_sp2','plotspecies2','-append')
        
        if plotstate == 0
            updateplottab
        else
            plotsaveddata
        end
                
end



function edit_label_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_label_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_label_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_label_sp2 as a double


% --- Executes during object creation, after setting all properties.
function edit_label_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_label_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function menu_ploteverything_Callback(hObject, eventdata, handles)
% hObject    handle to menu_ploteverything (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ploteverything;
