function plotvariable = setplotvariable_sp2(menuvalue)
% Axis options for the data plotter tab

load dataplotterstore.mat

if menuvalue == 1
    plotvariable = counter_store;
elseif menuvalue == 2
    plotvariable = variable_store;
elseif menuvalue == 3
    plotvariable = NOD_store_sp2;
elseif menuvalue == 4
    plotvariable = Nh_store_sp2;
elseif menuvalue == 5
    plotvariable = Nv_store_sp2;
elseif menuvalue == 6
    plotvariable = N_pxsum_store_sp2;
elseif menuvalue == 7
    plotvariable = Th_store_sp2;
elseif menuvalue == 8
    plotvariable = Tv_store_sp2;
elseif menuvalue == 9
    plotvariable = PSD_store_sp2;
elseif menuvalue == 10
    plotvariable = OD_store_sp2;
elseif menuvalue == 11
    plotvariable = npk_store_sp2;
elseif menuvalue == 12
    plotvariable = sigma_h_store_sp2;
elseif menuvalue == 13
    plotvariable = sigma_v_store_sp2;
elseif menuvalue == 14
    plotvariable = center_h_store_sp2;
elseif menuvalue == 15
    plotvariable = center_v_store_sp2;
end
    
    
    
    
