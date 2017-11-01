function varargout = configfileeditor(varargin)
% CONFIGFILEEDITOR MATLAB code for configfileeditor.fig
%      CONFIGFILEEDITOR, by itself, creates a new CONFIGFILEEDITOR or raises the existing
%      singleton*.
%
%      H = CONFIGFILEEDITOR returns the handle to a new CONFIGFILEEDITOR or the handle to
%      the existing singleton*.
%
%      CONFIGFILEEDITOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONFIGFILEEDITOR.M with the given input arguments.
%
%      CONFIGFILEEDITOR('Property','Value',...) creates a new CONFIGFILEEDITOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before configfileeditor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to configfileeditor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help configfileeditor

% Last Modified by GUIDE v2.5 29-Jul-2016 17:56:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @configfileeditor_OpeningFcn, ...
                   'gui_OutputFcn',  @configfileeditor_OutputFcn, ...
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


% --- Executes just before configfileeditor is made visible.
function configfileeditor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to configfileeditor (see VARARGIN)

% Choose default command line output for configfileeditor
handles.output = hObject;

guidata(hObject, handles);

%defaultconfig
guidata(hObject, handles);

% Initialise .mat storage file if it doesn't exist already
if ~exist('configdata.mat') 
    
    dummy = 0;
    save('configdata','dummy');
    
else
    
    load configdata.mat
    
end

% Detect OS type
windows = ispc; % Needed for filepath construction: \ for Windows, / for Mac and Linux
handles.OStype = windows;
save('configdata','windows','-append');

loadConfigState(handles);   % Loads previous state of config file

% imagePath = handles.imagePath;
% storagePath = handles.storagePath;
% logPath = handles.logPath;

%save('configdata','imagePath','storagePath','logPath','windows','-append');

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes configfileeditor wait for user response (see UIRESUME)
% uiwait(handles.figure_config);


% --- Outputs from this function are returned to the command line.
function varargout = configfileeditor_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in setstoragepath.
function setstoragepath_Callback(hObject, eventdata, handles)
% hObject    handle to setstoragepath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.OStype
    handles.storagePath = uigetdir('\Windows Path\');
else
    handles.storagePath = uigetdir('/home/ana/Work/Matlab stuff/');
end

set(handles.viewstoragepath,'String',handles.storagePath);
storagePath = handles.storagePath;
save('configdata','storagePath','-append');

guidata(hObject, handles);


% --- Executes on button press in setimagepath_sp1.
function setimagepath_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to setimagepath_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.OStype
    handles.imagePath_sp1 = uigetdir('\Windows Path\');
else
    handles.imagePath_sp1 = uigetdir('/home/ana/Work/Matlab stuff/');
end

set(handles.viewimagepath_sp1,'String',handles.imagePath_sp1);
imagePath_sp1 = handles.imagePath_sp1;
save('configdata','imagePath_sp1','-append');

% guidata(hObject,handles);
% setappdata(handles.figure_config,'imagePath',handles.imagePath);    % for passing to main gui

guidata(hObject, handles);


% --- Executes on button press in setlogpath.
function setlogpath_Callback(hObject, eventdata, handles)
% hObject    handle to setlogpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.OStype
    handles.logPath = uigetdir('\Windows Path\');
else
    handles.logPath = uigetdir('/home/ana/Work/Matlab stuff/');
end

set(handles.viewlogpath,'String',handles.logPath);
logPath = handles.logPath;
save('configdata','logPath','-append');

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function viewimagepath_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to viewimagepath_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function viewstoragepath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to viewstoragepath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function viewlogpath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to viewlogpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in twospeciescheck.
function twospeciescheck_Callback(hObject, eventdata, handles)
% hObject    handle to twospeciescheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of twospeciescheck

% if (get(hObject,'Value') == get(hObject,'Max'))
%     
%     handles.twospecies = 1;     % Two species
%     set(handles.panel_sp2,'Visible','On')
%     
% else
%     
%     handles.twospecies = 0;     % One species
%     set(handles.panel_sp2,'Visible','Off')
%     
% end

handles.twospecies = get(hObject,'Value');handles.twospeciescheck;
twospecies = handles.twospecies;

if (handles.sepspecies == 1) && (twospecies == 1)
    
    sepspecies = 0;
    state.checkbox_sepspecies = 0;
    set(handles.checkbox_sepspecies,'value',state.checkbox_sepspecies);
    save('configdata','sepspecies','-append');
    
end

save('configdata','twospecies','-append');

guidata(hObject,handles);
% setappdata(handles.figure_config,'twospecies',handles.twospecies);


% --- Executes when user attempts to close figure_config.
function figure_config_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure_config (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
saveConfigState(handles);
delete(hObject);


function setnumrotations_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to setnumrotations_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of setnumrotations_sp1 as text
%        str2double(get(hObject,'String')) returns contents of setnumrotations_sp1 as a double

numrotations_sp1 = str2double(get(hObject,'String'));
handles.numrotations = numrotations_sp1;
save('configdata','numrotations_sp1','-append');

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function setnumrotations_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to setnumrotations_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function setpixelsize1_Callback(hObject, eventdata, handles)
% hObject    handle to setpixelsize1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of setpixelsize1 as text
%        str2double(get(hObject,'String')) returns contents of setpixelsize1 as a double

pixelsize1 = str2double(get(hObject,'String'))*1e-6;
handles.pixelsize1 = pixelsize1;
save('configdata','pixelsize1','-append');

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function setpixelsize1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to setpixelsize1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function setpixelsize2_Callback(hObject, eventdata, handles)
% hObject    handle to setpixelsize2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of setpixelsize2 as text
%        str2double(get(hObject,'String')) returns contents of setpixelsize2 as a double

pixelsize2 = str2double(get(hObject,'String'))*1e-6;
handles.pixelsize2 = pixelsize2;
save('configdata','pixelsize2','-append');

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function setpixelsize2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to setpixelsize2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_odsat_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_odsat_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_odsat_sp1 as text
%        str2double(get(hObject,'String')) returns contents of edit_odsat_sp1 as a double

OD_sat_sp1 = str2double(get(hObject,'String'));
handles.od_sat_sp1 = OD_sat_sp1;
save('configdata','OD_sat_sp1','-append');

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_odsat_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_odsat_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ioverisat_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ioverisat_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ioverisat_sp1 as text
%        str2double(get(hObject,'String')) returns contents of edit_ioverisat_sp1 as a double

IoverIs_sp1 = str2double(get(hObject,'String'));
handles.IoverIs_sp1 = IoverIs_sp1;
save('configdata','IoverIs_sp1','-append');

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_ioverisat_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ioverisat_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_isat_eff_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_isat_eff_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_isat_eff_sp1 as text
%        str2double(get(hObject,'String')) returns contents of edit_isat_eff_sp1 as a double

Isat_eff_sp1 = str2double(get(hObject,'String'));
handles.Isat_eff_sp1 = Isat_eff_sp1;
save('configdata','Isat_eff_sp1','-append');

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_isat_eff_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_isat_eff_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_viewAngle_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_viewAngle_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_viewAngle_sp1 as text
%        str2double(get(hObject,'String')) returns contents of edit_viewAngle_sp1 as a double

viewAngle_sp1 = pi/180*str2double(get(hObject,'String'));

if (viewAngle_sp1 == 90)  % This is not allowed
    msgbox('ViewAngle cannot be 90 �!',...
        'Please enter a sensible value.','Warning','error')
    waitforbuttonpress
end

save('configdata','viewAngle_sp1','-append');

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_viewAngle_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_viewAngle_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function setnumrotations_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to setnumrotations_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of setnumrotations_sp2 as text
%        str2double(get(hObject,'String')) returns contents of setnumrotations_sp2 as a double

numrotations_sp2 = str2double(get(hObject,'String'));
handles.numrotations_sp2 = numrotations_sp2;
save('configdata','numrotations_sp2','-append');

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function setnumrotations_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to setnumrotations_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_odsat_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_odsat_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_odsat_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_odsat_sp2 as a double

OD_sat_sp2 = str2double(get(hObject,'String'));
handles.od_sat_sp2 = OD_sat_sp2;
save('configdata','OD_sat_sp2','-append');

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_odsat_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_odsat_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ioverisat_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ioverisat_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ioverisat_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_ioverisat_sp2 as a double

IoverIs_sp2 = str2double(get(hObject,'String'));
handles.IoverIs_sp2 = IoverIs_sp2;
save('configdata','IoverIs_sp2','-append');

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_ioverisat_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ioverisat_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_isat_eff_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_isat_eff_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_isat_eff_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_isat_eff_sp2 as a double

Isat_eff_sp2 = str2double(get(hObject,'String'));
handles.Isat_eff_sp2 = Isat_eff_sp2;
save('configdata','Isat_eff_sp2','-append');

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_isat_eff_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_isat_eff_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_viewAngle_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_viewAngle_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_viewAngle_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_viewAngle_sp2 as a double

viewAngle_sp2 = pi/180*str2double(get(hObject,'String'));

if (viewAngle_sp2 == 90)  % This is not allowed
    msgbox('ViewAngle cannot be 90 �!',...
        'Please enter a sensible value.','Warning','error')
    waitforbuttonpress
end

save('configdata','viewAngle_sp2','-append');

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_viewAngle_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_viewAngle_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_loadFF_sp2.
function pushbutton_loadFF_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_loadFF_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FFfilename_sp2, FFpathname_sp2] = uigetfile('*.mat','Select Fourier filter');
handles.FF_filename_sp2 = FFfilename_sp2;
handles.FF_pathname_sp2 = FFpathname_sp2;

set(handles.view_FFfilename_sp2,'String',handles.FF_filename_sp2);
save('configdata','FFfilename_sp2','FFpathname_sp2','-append');

guidata(hObject, handles);


% --- Executes on button press in pushbutton_loadFF_sp1.
function pushbutton_loadFF_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_loadFF_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FFfilename_sp1, FFpathname_sp1] = uigetfile('*.mat','Select Fourier filter');

handles.FF_filename_sp1 = FFfilename_sp1;
handles.FF_pathname_sp1 = FFpathname_sp1;

set(handles.view_FFfilename_sp1,'String',handles.FF_filename_sp1);
save('configdata','FFfilename_sp1','FFpathname_sp1','-append');

guidata(hObject, handles);


% --- Executes on button press in pushbutton_loadvarfile.
function pushbutton_loadvarfile_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_loadvarfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% if handles.OStype
%     handles.varPath = uigetdir('\Windows Path\');
% else
%     handles.varPath = uigetdir('/home/ana/Work/Matlab stuff/');
% end

[varfilename,varpathname] = uigetfile('*.txt','Select the configuration file.');

handles.varPath = varpathname;
handles.varFilename = varfilename;

set(handles.text_viewvarpath,'String',handles.varFilename);
varPath = handles.varPath;
varFilename = handles.varFilename;
save('configdata','varPath','varFilename','-append');

guidata(hObject, handles);


% --- Executes on button press in pushbutton_FRpath_sp2.
function pushbutton_FRpath_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_FRpath_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FRname_sp2 FRpath_sp2] = uigetfile('*.asc','Select file');
handles.FRpath_sp2 = FRpath_sp2;
handles.FRname_sp2 = FRname_sp2;

set(handles.text_FRpath_sp2,'String',handles.FRpath_sp2);
frPath_sp2 = handles.FRpath_sp2;
frName_sp2 = handles.FRname_sp2;
save('configdata','frPath_sp2','frName_sp2','-append');

guidata(hObject, handles);


% --- Executes on button press in pushbutton_FRpath_sp1.
function pushbutton_FRpath_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_FRpath_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FRname_sp1 FRpath_sp1] = uigetfile('*.asc','Select file');
handles.FRpath_sp1 = FRpath_sp1;
handles.FRname_sp1 = FRname_sp1;

set(handles.text_FRpath_sp1,'String',handles.FRpath_sp1);
frPath_sp1 = handles.FRpath_sp1;
frName_sp1 = handles.FRname_sp1;
save('configdata','frPath_sp1','frName_sp1','-append');

guidata(hObject, handles);


% --- Executes on button press in pushbutton_loadFRmask_sp2.
function pushbutton_loadFRmask_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_loadFRmask_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FRmask_filename_sp2, FRmask_pathname_sp2] = uigetfile('*.mat','Select mask');
handles.FRmask_filename_sp2 = FRmask_filename_sp2;
handles.FRmask_pathname_sp2 = FRmask_pathname_sp2;

set(handles.text_FRmaskname_sp2,'String',handles.FRmask_filename_sp2);
save('configdata','FRmask_filename_sp2','FRmask_pathname_sp2','-append');

guidata(hObject, handles);

% --- Executes on button press in pushbutton_loadFRmask_sp1.
function pushbutton_loadFRmask_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_loadFRmask_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[FRmask_filename_sp1, FRmask_pathname_sp1] = uigetfile('*.mat','Select mask');
handles.FRmask_filename_sp1 = FRmask_filename_sp1;
handles.FRmask_pathname_sp1 = FRmask_pathname_sp1;

set(handles.text_FRmaskname_sp1,'String',handles.FRmask_filename_sp1);
save('configdata','FRmask_filename_sp1','FRmask_pathname_sp1','-append');

guidata(hObject, handles);


% --- Executes on button press in pushbutton_saveconfigfile.
function pushbutton_saveconfigfile_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_saveconfigfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[configsavename,configsavepath] = uiputfile('*.mat','Save configuration file as');

copyfile('configdata.mat',[configsavepath configsavename]);


% --- Executes on button press in pushbutton_loadconfigfile.
function pushbutton_loadconfigfile_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_loadconfigfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[configfilename,configpathname] = uigetfile('*.mat','Select the configuration file.');
copyfile([configpathname configfilename],'configdata.mat');

updateconfigvalues; % Displays the saved config data on the GUI


% --- Executes on button press in pushbutton_dexterpath.
function pushbutton_dexterpath_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_dexterpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[dexterSyncFile dexterSyncPath] = uigetfile('*.txt','\Windows Path\');
handles.dexterSyncPath = dexterSyncPath;

set(handles.viewdexterpath,'String',handles.dexterSyncPath);
%dexterSyncFile = handles.dexterSyncFile;
save('configdata','dexterSyncFile','dexterSyncPath','-append');

guidata(hObject, handles);



function edit40_Callback(hObject, eventdata, handles)
% hObject    handle to edit40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit40 as text
%        str2double(get(hObject,'String')) returns contents of edit40 as a double


% --- Executes during object creation, after setting all properties.
function edit40_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_FRfiles_sp1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_FRfiles_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_FRfiles_sp1 as text
%        str2double(get(hObject,'String')) returns contents of edit_FRfiles_sp1 as a double

ref_files_sp1 = get(handles.edit_FRfiles_sp1,'String');
refnums_sp1 = textscan(ref_files_sp1, '%s','delimiter',',');

refnums_sp1 = refnums_sp1{1};

for count = 1:length(refnums_sp1)
    ranges_sp1{count} = textscan(refnums_sp1{count}, '%s','delimiter','-');
end

for count = 1:length(ranges_sp1)    
    lower(count) = round(str2num(ranges_sp1{count}{1}{1}));    
    if length(ranges_sp1{count}{1}) == 2        
        upper(count) = round(str2num(ranges_sp1{count}{1}{2}));        
    else        
        upper(count) = 0;        
    end    
end

refindex_sp1 = [];

for count = 1:length(ranges_sp1)
    if upper(count) ~= 0
        refindex_sp1(length(refindex_sp1)+1:length(refindex_sp1)+(upper(count)-lower(count))+1) = lower(count):1:upper(count);
    else
        refindex_sp1(length(refindex_sp1)+1) = lower(count);
    end
end

save('configdata','refindex_sp1','-append');


% --- Executes during object creation, after setting all properties.
function edit_FRfiles_sp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_FRfiles_sp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_FRfiles_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_FRfiles_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_FRfiles_sp2 as text
%        str2double(get(hObject,'String')) returns contents of edit_FRfiles_sp2 as a double

ref_files_sp2 = get(handles.edit_FRfiles_sp2,'String');
refnums_sp2 = textscan(ref_files_sp2, '%s','delimiter',',');

refnums_sp2 = refnums_sp2{1};

for count = 1:length(refnums_sp2)
    ranges_sp2{count} = textscan(refnums_sp2{count}, '%s','delimiter','-');
end

for count = 1:length(ranges_sp2)    
    lower(count) = round(str2num(ranges_sp2{count}{1}{1}));    
    if length(ranges_sp2{count}{1}) == 2        
        upper(count) = round(str2num(ranges_sp2{count}{1}{2}));        
    else        
        upper(count) = 0;        
    end    
end

refindex_sp2 = [];

for count = 1:length(ranges_sp2)
    if upper(count) ~= 0
        refindex_sp2(length(refindex_sp2)+1:length(refindex_sp2)+(upper(count)-lower(count))+1) = lower(count):1:upper(count);
    else
        refindex_sp2(length(refindex_sp2)+1) = lower(count);
    end
end

save('configdata','refindex_sp2','-append');


% --- Executes during object creation, after setting all properties.
function edit_FRfiles_sp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_FRfiles_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_sepspecies.
function checkbox_sepspecies_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_sepspecies (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_sepspecies

sepspecies = get(hObject,'Value');
handles.sepspecies = sepspecies;

if (sepspecies == 1) && (handles.twospecies == 1)
    
    twospecies = 0;
    state.twospeciescheck = 0;
    set(handles.twospeciescheck,'value',state.twospeciescheck);
    save('configdata','twospecies','-append');
    
end

save('configdata','sepspecies','-append');

guidata(hObject,handles);


% --- Executes on button press in setimagepath_sp2.
function setimagepath_sp2_Callback(hObject, eventdata, handles)
% hObject    handle to setimagepath_sp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.OStype
    handles.imagePath_sp2 = uigetdir('\Windows Path\');
else
    handles.imagePath_sp2 = uigetdir('/home/ana/Work/Matlab stuff/');
end

set(handles.viewimagepath_sp2,'String',handles.imagePath_sp2);
imagePath_sp2 = handles.imagePath_sp2;
save('configdata','imagePath_sp2','-append');

% guidata(hObject,handles);
% setappdata(handles.figure_config,'imagePath',handles.imagePath);    % for passing to main gui

guidata(hObject, handles);


% --- Executes on selection change in popupmenu_speciesoptions.
function popupmenu_speciesoptions_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_speciesoptions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_speciesoptions contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_speciesoptions

speciesoption = get(handles.popupmenu_speciesoptions,'Value');

if speciesoption == 1
    
    twospecies = 0;
    sepspecies = 0;
    
elseif speciesoption == 2
    
    twospecies = 1;
    sepspecies = 0;
    
elseif speciesoption == 3
    
    twospecies = 0;
    sepspecies = 1;
    
end

save('configdata','twospecies','sepspecies','speciesoption','-append');



% --- Executes during object creation, after setting all properties.
function popupmenu_speciesoptions_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_speciesoptions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
