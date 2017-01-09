function varargout = sumorcut(species,handles)
% Swaps between summing along the rows and columns to taking cuts through
% the clouds

load configdata.mat
load maindata

switch species
    
    case 'sp1'
        
        switch fittype_sp1
            
            case 'gaussian'
                
                fitnewload_sp1
                
                if (get(handles.popupmenu_1dsum_sp1,'Value') == 1)     % box for loading sums is checked
                    
                    axes(handles.axes_1dh_sp1);
                    x = handles.xh_sp1;
                    %plot(x,I1_sp1,x,R1_sp1,'r');
                    plot(x,I1,x,R1,'r');
                    title('Intensity along x-axis after z-integration (horizontal)');
                    
                    axes(handles.axes_1dv_sp1);
                    x = handles.xv_sp1;
                    %plot(x,I2_sp1,x,R2_sp1,'r');
                    plot(x,I2,x,R2,'r');
                    title('Intensity along z-axis after x-integration (vertical)');
                    
                elseif (get(handles.popupmenu_1dsum_sp1,'Value') == 2)        % box for crosscuts is checked
                    
                    axes(handles.axes_1dh_sp1);
                    x = handles.xh_sp1;
                    %plot(x,crossx_sp1,x,Rx_sp1,'r');
                    plot(x,crossx,x,Rx,'r');
                    title('Crosscut along x');
                    
                    axes(handles.axes_1dv_sp1);
                    
                    x = handles.xv_sp1;
                    %plot(x,crossz_sp1,x,Rz_sp1,'r');
                    plot(x,crossz,x,Rz,'r');
                    title('Crosscut along z');
                    
                end
                
                set(handles.axes_1dh_sp1,'xlim',[min(handles.xh_sp1) max(handles.xh_sp1)]);
                set(handles.axes_1dv_sp1,'xlim',[min(handles.xv_sp1) max(handles.xv_sp1)]);
                
                keepROI_option_sp1 = 1;
                datadisp_sp1;
                keepROI_option_sp1 = 0;
                
            case 'thomas-fermi'
                
                fitloadTF_sp1;
                
                % 1D x crosscut
                axes(handles.axes_1dh_sp1);
                plot(x,xdataccut,'b-',xhires,xthermccut,'r-',xhires,fitFun_x,'g-');
                set(handles.axes_1dh_sp1,'XLim',[min(handles.xh_sp1) max(handles.xh_sp1)],'YLim',[min(crosscut_x) 1.1*max(crosscut_x)])
                title('1D cross cut along x-axis through centre of condensate');
                
                % 1D y crosscut
                axes(handles.axes_1dv_sp1);
                plot(z,zdataccut,'b-',zhires,zthermccut,'r-',zhires,fitFun_z,'g-');
                set(handles.axes_1dv_sp1,'XLim',[min(handles.xv_sp1) max(handles.xv_sp1)],'YLim',[min(crosscut_z) 1.1*max(crosscut_z)])
                title('1D cross cut along z-axis through centre of condensate');
                
        end
        
    case 'sp2'
        
        if (isfield(handles,'A_sp2') == 1)                 % no file loaded before
            
            switch fittype_sp2
                
                case 'gaussian'
                    
                    fitnewload_sp2
                    
                    if (get(handles.popupmenu_1dsum_sp2,'Value') == 1)     % box for loading sums is checked
                        
                        axes(handles.axes_1dh_sp2);
                        x = handles.xh_sp2;
                        %plot(x,I1_sp2,x,R1_sp2,'r');
                        plot(x,I1,x,R1,'r');
                        title('Intensity along x-axis after z-integration (horizontal)');
                        
                        axes(handles.axes_1dv_sp2);
                        x = handles.xv_sp2;
                        %plot(x,I2_sp2,x,R2_sp2,'r');
                        plot(x,I2,x,R2,'r');
                        title('Intensity along z-axis after x-integration (vertical)');
                        
                    elseif (get(handles.popupmenu_1dsum_sp2,'Value') == 2)        % box for crosscuts is checked
                        
                        axes(handles.axes_1dh_sp2);
                        x = handles.xh_sp2;
                        %plot(x,crossx_sp2,x,Rx_sp2,'r');
                        plot(x,crossx,x,Rx,'r');
                        title('Crosscut along x');
                        
                        axes(handles.axes_1dv_sp2);
                        
                        x = handles.xv_sp2;
                        %plot(x,crossz_sp2,x,Rz_sp2,'r');
                        plot(x,crossz,x,Rz,'r');
                        title('Crosscut along z');
                        
                    end
                    
                    set(handles.axes_1dh_sp2,'xlim',[min(handles.xh_sp2) max(handles.xh_sp2)]);
                    set(handles.axes_1dv_sp2,'xlim',[min(handles.xv_sp2) max(handles.xv_sp2)]);
                    
                    keepROI_option_sp2 = 1;
                    datadisp_sp2;
                    keepROI_option_sp2 = 0;
                    
                    
                case 'thomas-fermi'
                    
                    fitloadTF_sp2;
                    
                    % 1D x crosscut
                    axes(handles.axes_1dh_sp2);
                    plot(x,xdataccut,'b-',xhires,xthermccut,'r-',xhires,fitFun_x,'g-');
                    set(handles.axes_1dh_sp2,'XLim',[min(handles.xh_sp2) max(handles.xh_sp2)],'YLim',[min(crosscut_x) 1.1*max(crosscut_x)])
                    title('1D cross cut along x-axis through centre of condensate');
                    
                    % 1D y crosscut
                    axes(handles.axes_1dv_sp2);
                    plot(z,zdataccut,'b-',zhires,zthermccut,'r-',zhires,fitFun_z,'g-');
                    set(handles.axes_1dv_sp2,'XLim',[min(handles.xv_sp2) max(handles.xv_sp2)],'YLim',[min(crosscut_z) 1.1*max(crosscut_z)])
                    title('1D cross cut along z-axis through centre of condensate');
                    
            end
            
        end
        
end