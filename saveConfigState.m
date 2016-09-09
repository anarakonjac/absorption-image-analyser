function  saveConfigState(handles)
% Saves the state of the GUI when it is closed, so the same values appear 
% in the text boxes when the GUI is restarted.

% File locations
state.viewimagepath_sp1 = get(handles.viewimagepath_sp1,'string');
state.viewimagepath_sp2 = get(handles.viewimagepath_sp2,'string');
state.viewstoragepath = get(handles.viewstoragepath,'string');
state.viewlogpath = get(handles.viewlogpath,'string');
state.text_viewvarpath = get(handles.text_viewvarpath,'string');
state.viewdexterpath = get(handles.viewdexterpath,'string');

% Misc
% state.twospeciescheck = get(handles.twospeciescheck,'value');
% state.checkbox_sepspecies = get(handles.checkbox_sepspecies,'value');
state.popupmenu_speciesoptions = get(handles.popupmenu_speciesoptions,'value');

% Species 1
state.setpixelsize1 = get(handles.setpixelsize1,'string');
state.setnumrotations_sp1 = get(handles.setnumrotations_sp1,'string');
state.edit_odsat_sp1 = get(handles.edit_odsat_sp1,'string');
state.edit_ioverisat_sp1 = get(handles.edit_ioverisat_sp1,'string');
state.edit_isat_eff_sp1 = get(handles.edit_isat_eff_sp1,'string');
state.edit_viewAngle_sp1 = get(handles.edit_viewAngle_sp1,'string');
state.view_FFfilename_sp1 = get(handles.view_FFfilename_sp1,'string');
state.text_FRpath_sp1 = get(handles.text_FRpath_sp1,'string');
state.edit_FRfiles_sp1 = get(handles.edit_FRfiles_sp1,'string');
% state.text_FRmaskname_sp1 = get(handles.text_FRmaskname_sp1,'string');

% Species 2
state.setpixelsize2 = get(handles.setpixelsize2,'string');
state.setnumrotations_sp2 = get(handles.setnumrotations_sp2,'string');
state.edit_odsat_sp2 = get(handles.edit_odsat_sp2,'string');
state.edit_ioverisat_sp2 = get(handles.edit_ioverisat_sp2,'string');
state.edit_isat_eff_sp2 = get(handles.edit_isat_eff_sp2,'string');
state.edit_viewAngle_sp2 = get(handles.edit_viewAngle_sp2,'string');
state.view_FFfilename_sp2 = get(handles.view_FFfilename_sp2,'string');
state.text_FRpath_sp2 = get(handles.text_FRpath_sp2,'string');
state.edit_FRfiles_sp2 = get(handles.edit_FRfiles_sp2,'string');
% state.text_FRmaskname_sp2 = get(handles.text_FRmaskname_sp2,'string');


save('configstate.mat','state');