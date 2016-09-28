function  saveMainState(handles)
% Saves state of GUI so when it is reloaded, all the menu selections,
% etc. are the same as when it was closed.


%% General

state.dextersync = get(handles.dextersync,'value');
state.checkbox_varsync = get(handles.checkbox_varsync,'value');
state.edit_variable = get(handles.edit_variable,'string');
state.edit_label = get(handles.edit_label,'string');
% state.uibuttongroup_species = get(handles.uibuttongroup_species,'SelectionChangedFcn'); % don't know how to make it save the state of the button group!


%% Species 1

% Analysis options
state.edit_counter_sp1 = get(handles.edit_counter_sp1,'string');
state.setspecies1 = get(handles.setspecies1,'value');
state.popupmenu_1dsum_sp1 = get(handles.popupmenu_1dsum_sp1,'value');
state.choose_ana_type_sp1 = get(handles.choose_ana_type_sp1,'value');
state.popupmenu_fittype_sp1 = get(handles.popupmenu_fittype_sp1,'value');

% Plot options
state.checkbox_useROI_sp1 = get(handles.checkbox_useROI_sp1,'value');
state.checkbox_square_sp1 = get(handles.checkbox_square_sp1,'value');
state.checkbox_useFF_sp1 = get(handles.checkbox_useFF_sp1,'value');
% state.checkbox_useFR_sp1 = get(handles.checkbox_useFR_sp1,'value');
state.popupmenu_colourmap_sp1 = get(handles.popupmenu_colourmap_sp1,'value');
state.edit_ODrange_sp1 = get(handles.edit_ODrange_sp1,'string');

% Parameters
state.edit_tof_sp1 = get(handles.edit_tof_sp1,'string');
state.edit_detuning_sp1 = get(handles.edit_detuning_sp1,'string');
state.edit_xfreq_sp1 = get(handles.edit_xfreq_sp1,'string');
state.edit_yfreq_sp1 = get(handles.edit_yfreq_sp1,'string');
state.edit_zfreq_sp1 = get(handles.edit_zfreq_sp1,'string');


%% Species 2

% Analysis options
state.setspecies2 = get(handles.setspecies2,'value');
state.popupmenu_1dsum_sp2 = get(handles.popupmenu_1dsum_sp2,'value');
state.choose_ana_type_sp2 = get(handles.choose_ana_type_sp2,'value');
state.popupmenu_fittype_sp2 = get(handles.popupmenu_fittype_sp2,'value');

% Plot options
state.checkbox_useROI_sp2 = get(handles.checkbox_useROI_sp2,'value');
state.checkbox_square_sp2 = get(handles.checkbox_square_sp2,'value');
state.checkbox_useFF_sp2 = get(handles.checkbox_useFF_sp2,'value');
% state.checkbox_useFR_sp2 = get(handles.checkbox_useFR_sp2,'value');
state.popupmenu_colourmap_sp2 = get(handles.popupmenu_colourmap_sp2,'value');
state.edit_ODrange_sp2 = get(handles.edit_ODrange_sp2,'string');

% Parameters
state.edit_tof_sp2 = get(handles.edit_tof_sp2,'string');
state.edit_detuning_sp2 = get(handles.edit_detuning_sp2,'string');
state.edit_xfreq_sp2 = get(handles.edit_xfreq_sp2,'string');
state.edit_yfreq_sp2 = get(handles.edit_yfreq_sp2,'string');
state.edit_zfreq_sp2 = get(handles.edit_zfreq_sp2,'string');

save('mainstate.mat','state');