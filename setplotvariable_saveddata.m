function plotvariable = setplotvariable_saveddata(menuvalue,filenum,variable,NOD_sp1,Nh_sp1,Nv_sp1,N_pxsum_sp1,Th_sp1,Tv_sp1,PSD_sp1,OD_sp1,npk_sp1,sigma_h_sp1,sigma_v_sp1,center_h_sp1,center_v_sp1)
% Axis options for the data plotter tab
% Be sure to edit this file if new variables are added!

if menuvalue == 1
    plotvariable = filenum;
elseif menuvalue == 2
    plotvariable = variable;
elseif menuvalue == 3
    plotvariable = NOD_sp1;
elseif menuvalue == 4
    plotvariable = Nh_sp1;
elseif menuvalue == 5
    plotvariable = Nv_sp1;
elseif menuvalue == 6
    plotvariable = N_pxsum_sp1;
elseif menuvalue == 7
    plotvariable = Th_sp1;
elseif menuvalue == 8
    plotvariable = Tv_sp1;
elseif menuvalue == 9
    plotvariable = PSD_sp1;
elseif menuvalue == 10
    plotvariable = OD_sp1;
elseif menuvalue == 11
    plotvariable = npk_sp1;
elseif menuvalue == 12
    plotvariable = sigma_h_sp1;
elseif menuvalue == 13
    plotvariable = sigma_v_sp1;
elseif menuvalue == 14
    plotvariable = center_h_sp1;
elseif menuvalue == 15
    plotvariable = center_v_sp1;
end
    
    
    
    
