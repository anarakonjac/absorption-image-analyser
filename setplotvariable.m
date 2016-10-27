function [plotvariable_sp1 plotvariable_sp2] = setplotvariable(menuvalue,sepspecies,plotspecies2)
% function [plotvariable_sp1 plotvariable_sp2] = setplotvariable(menuvalue,twospecies,plotspecies2)
% Axis options for the data plotter tab

load dataplotterstore.mat
load maindata

plotvariable_sp1 = [];
plotvariable_sp2 = [];

if menuvalue == 1
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = counter_store_sp1;
    end
    
%     if (twospecies == 1) && (plotspecies2 == 1)
    if plotspecies2 == 1
        plotvariable_sp2 = counter_store_sp2;
    end
    
elseif menuvalue == 2
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = variable_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = variable_store_sp2;
    end
    
elseif menuvalue == 3
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = NOD_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = NOD_store_sp2;
    end
    
elseif menuvalue == 4
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = Nh_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = Nh_store_sp2;
    end
    
elseif menuvalue == 5
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = Nv_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = Nv_store_sp2;
    end
    
elseif menuvalue == 6
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = N_pxsum_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = N_pxsum_store_sp2;
    end
    
elseif menuvalue == 7
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = Th_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = Th_store_sp2;
    end
    
elseif menuvalue == 8
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = Tv_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = Tv_store_sp2;
    end
    
elseif menuvalue == 9
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = PSD_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = PSD_store_sp2;
    end
    
elseif menuvalue == 10
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = OD_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = OD_store_sp2;
    end
    
elseif menuvalue == 11
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = npk_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = npk_store_sp2;
    end
    
elseif menuvalue == 12
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = sigma_h_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = sigma_h_store_sp2;
    end
    
elseif menuvalue == 13
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = sigma_v_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = sigma_v_store_sp2;
    end
    
elseif menuvalue == 14
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = center_h_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = center_h_store_sp2;
    end
    
elseif menuvalue == 15
    
    if plotdata_sp1 == 1
        plotvariable_sp1 = center_v_store_sp1;
    end
    
    if plotspecies2 == 1
        plotvariable_sp2 = center_v_store_sp2;
    end
    
end
    
    
    
    
