function loadMainState(handles)
% Loads the main GUI state so all checkboxes, drop down menus, etc are the
% same as when the GUI was last closed.


fileName = 'mainstate.mat';

if exist(fileName)
    
    load(fileName);
    
    
    %% General

    set(handles.dextersync,'value',state.dextersync);
    set(handles.checkbox_varsync,'value',state.checkbox_varsync);
    set(handles.edit_variable,'string',state.edit_variable);
    set(handles.edit_label,'string',state.edit_label);
%     set(handles.uibuttongroup_species,'SelectionChangedFcn',state.uibuttongroup_species);
    
    
    %% Species 1

    % Analysis options    
    set(handles.edit_counter_sp1,'string',state.edit_counter_sp1);
    set(handles.setspecies1,'value',state.setspecies1);
    set(handles.popupmenu_1dsum_sp1,'value',state.popupmenu_1dsum_sp1);
    set(handles.choose_ana_type_sp1,'value',state.choose_ana_type_sp1);
    set(handles.popupmenu_fittype_sp1,'value',state.popupmenu_fittype_sp1);
    
    % Plot options
    set(handles.checkbox_useROI_sp1,'value',state.checkbox_useROI_sp1);
    set(handles.checkbox_square_sp1,'value',state.checkbox_square_sp1);
    set(handles.checkbox_useFF_sp1,'value',state.checkbox_useFF_sp1);
%     set(handles.checkbox_useFR_sp1,'value',state.checkbox_useFR_sp1);
    set(handles.popupmenu_colourmap_sp1,'value',state.popupmenu_colourmap_sp1);
    set(handles.edit_ODrange_sp1,'string',state.edit_ODrange_sp1);
    
    % Parameters
    set(handles.edit_tof_sp1,'string',state.edit_tof_sp1);
    set(handles.edit_detuning_sp1,'string',state.edit_detuning_sp1);
    set(handles.edit_xfreq_sp1,'string',state.edit_xfreq_sp1);
    set(handles.edit_yfreq_sp1,'string',state.edit_yfreq_sp1);
    set(handles.edit_zfreq_sp1,'string',state.edit_zfreq_sp1);
    
    
    %% Species 2

    % Analysis options    
    set(handles.setspecies2,'value',state.setspecies2);
    set(handles.popupmenu_1dsum_sp2,'value',state.popupmenu_1dsum_sp2);
    set(handles.choose_ana_type_sp2,'value',state.choose_ana_type_sp2);
    set(handles.popupmenu_fittype_sp2,'value',state.popupmenu_fittype_sp2);
    
    % Plot options
    set(handles.checkbox_useROI_sp2,'value',state.checkbox_useROI_sp2);
    set(handles.checkbox_square_sp2,'value',state.checkbox_square_sp2);
    set(handles.checkbox_useFF_sp2,'value',state.checkbox_useFF_sp2);
%     set(handles.checkbox_useFR_sp2,'value',state.checkbox_useFR_sp2);
    set(handles.popupmenu_colourmap_sp2,'value',state.popupmenu_colourmap_sp2);
    set(handles.edit_ODrange_sp2,'string',state.edit_ODrange_sp2);
    
    % Parameters
    set(handles.edit_tof_sp2,'string',state.edit_tof_sp2);
    set(handles.edit_detuning_sp2,'string',state.edit_detuning_sp2);
    set(handles.edit_xfreq_sp2,'string',state.edit_xfreq_sp2);
    set(handles.edit_yfreq_sp2,'string',state.edit_yfreq_sp2);
    set(handles.edit_zfreq_sp2,'string',state.edit_zfreq_sp2);
      
    
    delete(fileName);
    
end
    