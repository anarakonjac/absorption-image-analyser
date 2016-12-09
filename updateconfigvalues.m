% updateconfigvalues.m
% updates configuration file GUI values when a saved config file is loaded

load configdata

% File locations
set(handles.viewstoragepath,'string',storagePath);
set(handles.viewlogpath,'string',logPath);
set(handles.text_viewvarpath,'string',varPath);

% Misc
set(handles.popupmenu_speciesoptions,'value',speciesoption);

% Species 1
set(handles.setpixelsize1,'string',pixelsize1*1e6);
set(handles.setnumrotations_sp1,'string',numrotations_sp1);
set(handles.edit_odsat_sp1,'string',OD_sat_sp1);
set(handles.edit_ioverisat_sp1,'string',IoverIs_sp1);
set(handles.edit_isat_eff_sp1,'string',Isat_eff_sp1);
set(handles.edit_viewAngle_sp1,'string',viewAngle_sp1);
set(handles.viewimagepath_sp1,'string',imagePath_sp1);

if exist('FF_filename_sp1')
    set(handles.view_FFfilename_sp1,'string',FF_filename_sp1);
end

if exist('frPath_sp1')
    set(handles.text_FRpath_sp1,'string',frPath_sp1);
end

if exist('refindex_sp1')
    set(handles.edit_FRfiles_sp1,'string',refindex_sp1);
end

% if exist('FRmask_filename_sp1')
%     set(handles.text_FRmaskname_sp1,'string',FRmask_filename_sp1);
% end

% Species 2
set(handles.setpixelsize2,'string',pixelsize2*1e6);
set(handles.setnumrotations_sp2,'string',numrotations_sp2);
set(handles.edit_odsat_sp2,'string',OD_sat_sp2);
set(handles.edit_ioverisat_sp2,'string',IoverIs_sp2);
set(handles.edit_isat_eff_sp2,'string',Isat_eff_sp2);
set(handles.edit_viewAngle_sp2,'string',viewAngle_sp2);
set(handles.viewimagepath_sp2,'string',imagePath_sp2);

if exist('FF_filename_sp1')
    set(handles.view_FFfilename_sp2,'string',FF_filename_sp2);
end

if exist('frPath_sp1')
    set(handles.text_FRpath_sp2,'string',frPath_sp2);
end

if exist('refindex_sp1')
    set(handles.edit_FRfiles_sp2,'string',refindex_sp2);
end

% if exist('FRmask_filename_sp1')
%     set(handles.text_FRmaskname_sp2,'string',FRmask_filename_sp2);
% end
