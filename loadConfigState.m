function loadConfigState(handles)
% Loads the previous configuration state when the GUI is started up. 

fileName = 'configstate.mat';

if exist(fileName)
    
    load(fileName);
    
    % File locations    
    set(handles.viewimagepath_sp1,'string',state.viewimagepath_sp1);
    set(handles.viewimagepath_sp2,'string',state.viewimagepath_sp2);
    set(handles.viewstoragepath,'string',state.viewstoragepath);
    set(handles.viewlogpath,'string',state.viewlogpath);
    set(handles.text_viewvarpath,'string',state.text_viewvarpath);
    set(handles.viewdexterpath,'string',state.viewdexterpath);
    
    % Misc
%     set(handles.twospeciescheck,'value',state.twospeciescheck);
%     set(handles.checkbox_sepspecies,'value',state.checkbox_sepspecies);
    set(handles.popupmenu_speciesoptions,'value',state.popupmenu_speciesoptions);
    
    % Species 1
    set(handles.setpixelsize1,'string',state.setpixelsize1);    
    set(handles.setnumrotations_sp1,'string',state.setnumrotations_sp1);
    set(handles.edit_odsat_sp1,'string',state.edit_odsat_sp1);
    set(handles.edit_ioverisat_sp1,'string',state.edit_ioverisat_sp1);
    set(handles.edit_isat_eff_sp1,'string',state.edit_isat_eff_sp1);
    set(handles.edit_viewAngle_sp1,'string',state.edit_viewAngle_sp1);
    set(handles.view_FFfilename_sp1,'string',state.view_FFfilename_sp1);
    set(handles.text_FRpath_sp1,'string',state.text_FRpath_sp1);
    set(handles.edit_FRfiles_sp1,'string',state.edit_FRfiles_sp1);
%     set(handles.text_FRmaskname_sp1,'string',state.text_FRmaskname_sp1);
    
    % Species 2
    set(handles.setpixelsize2,'string',state.setpixelsize2);
    set(handles.setnumrotations_sp2,'string',state.setnumrotations_sp2);
    set(handles.edit_odsat_sp2,'string',state.edit_odsat_sp2);
    set(handles.edit_ioverisat_sp2,'string',state.edit_ioverisat_sp2);
    set(handles.edit_isat_eff_sp2,'string',state.edit_isat_eff_sp2);
    set(handles.edit_viewAngle_sp2,'string',state.edit_viewAngle_sp2);
    set(handles.view_FFfilename_sp2,'string',state.view_FFfilename_sp2);
    set(handles.text_FRpath_sp2,'string',state.text_FRpath_sp2);
    set(handles.edit_FRfiles_sp2,'string',state.edit_FRfiles_sp2);
%     set(handles.text_FRmaskname_sp2,'string',state.text_FRmaskname_sp2);
    
    delete(fileName);
    
end
    