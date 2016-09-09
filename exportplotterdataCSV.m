% exportplotterdataCSV.m
% Exports data plotted in the plotter as a CSV file.


[plotdata_filename, plotdata_pathname] = uiputfile('.csv');

load dataplotterstore.mat
load maindata.mat
load configdata.mat

getplotrange;

if plotstate == 0
    
    if plotdata_sp1 == 1
        
        storageMatrix_sp1 = [counter_store_sp1(stored_index_sp1); variable_store_sp1(stored_index_sp1); NOD_store_sp1(stored_index_sp1); Nh_store_sp1(stored_index_sp1); Nv_store_sp1(stored_index_sp1); N_pxsum_store_sp1(stored_index_sp1); Th_store_sp1(stored_index_sp1); Tv_store_sp1(stored_index_sp1); PSD_store_sp1(stored_index_sp1); OD_store_sp1(stored_index_sp1); npk_store_sp1(stored_index_sp1); sigma_h_store_sp1(stored_index_sp1); sigma_v_store_sp1(stored_index_sp1); center_h_store_sp1(stored_index_sp1); center_v_store_sp1(stored_index_sp1)]';
        csvwrite([plotdata_pathname element_sp1 '_' plotdata_filename],storageMatrix_sp1);
        
    end
    
    if plotdata_sp2 == 1
        
        storageMatrix_sp2 = [counter_store_sp2(stored_index_sp2); variable_store_sp2(stored_index_sp2); NOD_store_sp2(stored_index_sp2); Nh_store_sp2(stored_index_sp2); Nv_store_sp2(stored_index_sp2); N_pxsum_store_sp2(stored_index_sp2); Th_store_sp2(stored_index_sp2); Tv_store_sp2(stored_index_sp2); PSD_store_sp2(stored_index_sp2); OD_store_sp2(stored_index_sp2); npk_store_sp2(stored_index_sp2); sigma_h_store_sp2(stored_index_sp2); sigma_v_store_sp2(stored_index_sp2); center_h_store_sp2(stored_index_sp2); center_v_store_sp2(stored_index_sp2)]';
        csvwrite([plotdata_pathname element_sp2 '_' plotdata_filename],storageMatrix_sp2);
        
    end
    
else
    
    if plotdata_sp1 == 1
        
        for ii = 1:1:length(stored_index_sp1)
            
            filenum_sp1(ii) = str2num(cell2mat((lfc_sp1{3}(stored_index_sp1(ii)))));
            variable(ii) = str2num(cell2mat((lfc_sp1{4}(stored_index_sp1(ii)))));
            NOD_sp1(ii) = str2num(cell2mat((lfc_sp1{22}(stored_index_sp1(ii)))));
            Nh_sp1(ii) = str2num(cell2mat((lfc_sp1{10}(stored_index_sp1(ii)))));
            Nv_sp1(ii) = str2num(cell2mat((lfc_sp1{11}(stored_index_sp1(ii)))));
            N_pxsum_sp1(ii) = str2num(cell2mat((lfc_sp1{23}(stored_index_sp1(ii)))));
            Th_sp1(ii) = str2num(cell2mat((lfc_sp1{24}(stored_index_sp1(ii)))));
            Tv_sp1(ii) = str2num(cell2mat((lfc_sp1{25}(stored_index_sp1(ii)))));
            PSD_sp1(ii) = str2num(cell2mat((lfc_sp1{26}(stored_index_sp1(ii)))));
            OD_sp1(ii) = str2num(cell2mat((lfc_sp1{5}(stored_index_sp1(ii)))));
            npk_sp1(ii) = str2num(cell2mat((lfc_sp1{27}(stored_index_sp1(ii)))));
            sigma_h_sp1(ii) = str2num(cell2mat((lfc_sp1{6}(stored_index_sp1(ii)))));
            sigma_v_sp1(ii) = str2num(cell2mat((lfc_sp1{7}(stored_index_sp1(ii)))));
            center_h_sp1(ii) = str2num(cell2mat((lfc_sp1{8}(stored_index_sp1(ii)))));
            center_v_sp1(ii) = str2num(cell2mat((lfc_sp1{9}(stored_index_sp1(ii)))));
            
        end
        
        storageMatrix_sp1 = [filenum_sp1; variable; NOD_sp1; Nh_sp1; Nv_sp1; N_pxsum_sp1; Th_sp1; Tv_sp1; PSD_sp1; OD_sp1; npk_sp1; sigma_h_sp1; sigma_v_sp1; center_h_sp1; center_v_sp1]';
        csvwrite([plotdata_pathname element_sp1 '_' plotdata_filename],storageMatrix_sp1);
        
    end
    
    if plotdata_sp2 == 1
        
        for ii = 1:1:length(stored_index_sp2)
            
            filenum_sp2(ii) = str2num(cell2mat((lfc_sp1{3}(stored_index_sp2(ii)))));
            variable(ii) = str2num(cell2mat((lfc_sp1{4}(stored_index_sp2(ii)))));
            NOD_sp2(ii) = str2num(cell2mat((lfc_sp1{22}(stored_index_sp2(ii)))));
            Nh_sp2(ii) = str2num(cell2mat((lfc_sp1{10}(stored_index_sp2(ii)))));
            Nv_sp2(ii) = str2num(cell2mat((lfc_sp1{11}(stored_index_sp2(ii)))));
            N_pxsum_sp2(ii) = str2num(cell2mat((lfc_sp1{23}(stored_index_sp2(ii)))));
            Th_sp2(ii) = str2num(cell2mat((lfc_sp1{24}(stored_index_sp2(ii)))));
            Tv_sp2(ii) = str2num(cell2mat((lfc_sp1{25}(stored_index_sp2(ii)))));
            PSD_sp2(ii) = str2num(cell2mat((lfc_sp1{26}(stored_index_sp2(ii)))));
            OD_sp2(ii) = str2num(cell2mat((lfc_sp1{5}(stored_index_sp2(ii)))));
            npk_sp2(ii) = str2num(cell2mat((lfc_sp1{27}(stored_index_sp2(ii)))));
            sigma_h_sp2(ii) = str2num(cell2mat((lfc_sp1{6}(stored_index_sp2(ii)))));
            sigma_v_sp2(ii) = str2num(cell2mat((lfc_sp1{7}(stored_index_sp2(ii)))));
            center_h_sp2(ii) = str2num(cell2mat((lfc_sp1{8}(stored_index_sp2(ii)))));
            center_v_sp2(ii) = str2num(cell2mat((lfc_sp1{9}(stored_index_sp2(ii)))));
            
        end
        
        storageMatrix_sp2 = [filenum_sp2; variable; NOD_sp2; Nh_sp2; Nv_sp2; N_pxsum_sp2; Th_sp2; Tv_sp2; PSD_sp2; OD_sp2; npk_sp2; sigma_h_sp2; sigma_v_sp2; center_h_sp2; center_v_sp2]';
        csvwrite([plotdata_pathname element_sp2 '_' plotdata_filename],storageMatrix_sp2);
        
    end
    
end


