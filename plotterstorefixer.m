% plotterstorefixer.m
% for when the variables get out of sync for some reason

load dataplotterstore

endpt = 61;

NOD_store_sp1 = NOD_store_sp1(1:endpt);
N_pxsum_store_sp1 = N_pxsum_store_sp1(1:endpt);
Nh_store_sp1 = Nh_store_sp1(1:endpt);
Nv_store_sp1 = Nv_store_sp1(1:endpt);
OD_store_sp1 = OD_store_sp1(1:endpt);
PSD_store_sp1 = PSD_store_sp1(1:endpt);
Th_store_sp1 = Th_store_sp1(1:endpt);
Tv_store_sp1 = Tv_store_sp1(1:endpt);
center_h_store_sp1 = center_h_store_sp1(1:endpt);
center_v_store_sp1 = center_v_store_sp1(1:endpt);
counter_store_sp1 = counter_store_sp1(1:endpt);
npk_store_sp1 = npk_store_sp1(1:endpt);
sigma_h_store_sp1 = sigma_h_store_sp1(1:endpt);
sigma_v_store_sp1 = sigma_v_store_sp1(1:endpt);
variable_store_sp1 = variable_store_sp1(1:endpt);

save('dataplotterstore','counter_store_sp1','variable_store_sp1','NOD_store_sp1','Nh_store_sp1','Nv_store_sp1','N_pxsum_store_sp1','Th_store_sp1','Tv_store_sp1','PSD_store_sp1','OD_store_sp1','npk_store_sp1','sigma_h_store_sp1','sigma_v_store_sp1','center_h_store_sp1','center_v_store_sp1','-append');
