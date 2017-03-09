function varargout = setmapmenu(species,handles)
% Sets the colourmap based on menu choice.

switch species
    
    case 'sp1'
        
        axes(handles.axes_2d_sp1)
        
        val = get(handles.popupmenu_colourmap_sp1,'Value');
        
        if val == 1
            
            colormap(parula)
            abs_colormap_sp1 = parula;
            
        elseif val == 2
            
            colormap(jet)
            abs_colormap_sp1 = jet;
            
        elseif val == 3
            
            rmap = [linspace(255,145) linspace(145,126) linspace(126,25)]'/255;
            gmap = [linspace(255,184) linspace(184,49) linspace(49,31)]'/255;
            bmap = [linspace(255,189) linspace(189,123) linspace(123,32)]'/255;
            durham = [rmap gmap bmap];
            durham = flipud(durham);
            colormap(durham)
            abs_colormap_sp1 = durham;
            
        elseif val == 4
            
            colormap(hsv)
            abs_colormap_sp1 = hsv;
            
        elseif val == 5
            
            colormap(gray)
            abs_colormap_sp1 = gray;
            
        elseif val == 6
            
            colormap(hot)
            abs_colormap_sp1 = hot;
            
        elseif val == 7
            
            colormap(cool)
            abs_colormap_sp1 = cool;
            
        elseif val == 8
            
            colormap(bone)
            abs_colormap_sp1 = bone;
            
        elseif val == 9
            
            colormap(copper)
            abs_colormap_sp1 = copper;
            
        elseif val == 10
            
            colormap(spring)
            abs_colormap_sp1 = spring;
            
        elseif val == 11
            
            colormap(summer)
            abs_colormap_sp1 = summer;
            
        elseif val == 12
            
            colormap(autumn)
            abs_colormap_sp1 = autumn;
            
        elseif val == 13
            
            colormap(winter)
            abs_colormap_sp1 = winter;
            
        end
        
        save('maindata','abs_colormap_sp1','-append');
        
        clear val;
        
    case 'sp2'
        
        axes(handles.axes_2d_sp2)
        
        val = get(handles.popupmenu_colourmap_sp2,'Value');
        
        if val == 1
            
            colormap(parula)
            abs_colormap_sp2 = parula;
            
        elseif val == 2
            
            colormap(jet)
            abs_colormap_sp2 = jet;
            
        elseif val == 3
            
            rmap = [linspace(255,145) linspace(145,126) linspace(126,25)]'/255;
            gmap = [linspace(255,184) linspace(184,49) linspace(49,31)]'/255;
            bmap = [linspace(255,189) linspace(189,123) linspace(123,32)]'/255;
            durham = [rmap gmap bmap];
            durham = flipud(durham);
            colormap(durham)
            abs_colormap_sp2 = durham;
            
        elseif val == 4
            
            colormap(hsv)
            abs_colormap_sp2 = hsv;
            
        elseif val == 5
            
            colormap(gray)
            abs_colormap_sp2 = gray;
            
        elseif val == 6
            
            colormap(hot)
            abs_colormap_sp2 = hot;
            
        elseif val == 7
            
            colormap(cool)
            abs_colormap_sp2 = cool;
            
        elseif val == 8
            
            colormap(bone)
            abs_colormap_sp2 = bone;
            
        elseif val == 9
            
            colormap(copper)
            abs_colormap_sp2 = copper;
            
        elseif val == 10
            
            colormap(spring)
            abs_colormap_sp2 = spring;
            
        elseif val == 11
            
            colormap(summer)
            abs_colormap_sp2 = summer;
            
        elseif val == 12
            
            colormap(autumn)
            abs_colormap_sp2 = autumn;
            
        elseif val == 13
            
            colormap(winter)
            abs_colormap_sp2 = winter;
            
        end
        
        save('maindata','abs_colormap_sp2','-append');
        
        clear val;
        
end
