function varargout = setmapmenu(species,handles)
% Sets the colourmap based on menu choice.

switch species
    
    case 'sp1'
        
        axes(handles.axes_2d_sp1)
        
        val = get(handles.popupmenu_colourmap_sp1,'Value');
        if val == 1
            colormap(parula)
        elseif val == 2
            colormap(jet)
        elseif val == 3
            rmap = [linspace(255,145) linspace(145,126) linspace(126,25)]'/255;
            gmap = [linspace(255,184) linspace(184,49) linspace(49,31)]'/255;
            bmap = [linspace(255,189) linspace(189,123) linspace(123,32)]'/255;
            durham = [rmap gmap bmap];
            durham = flipud(durham);
            colormap(durham)
        elseif val == 4
            colormap(hsv)
        elseif val == 5
            colormap(gray)
        elseif val == 6
            colormap(hot)
        elseif val == 7
            colormap(cool)
        elseif val == 8
            colormap(bone)
        elseif val == 9
            colormap(copper)
        elseif val == 10
            colormap(spring)
        elseif val == 11
            colormap(summer)
        elseif val == 12
            colormap(autumn)
        elseif val == 13
            colormap(winter)
        end
        
        clear val;
        
    case 'sp2'
        
        axes(handles.axes_2d_sp2)
        
        val = get(handles.popupmenu_colourmap_sp2,'Value');
        if val == 1
            colormap(parula)
        elseif val == 2
            colormap(jet)
        elseif val == 3
            rmap = [linspace(255,145) linspace(145,126) linspace(126,25)]'/255;
            gmap = [linspace(255,184) linspace(184,49) linspace(49,31)]'/255;
            bmap = [linspace(255,189) linspace(189,123) linspace(123,32)]'/255;
            durham = [rmap gmap bmap];
            durham = flipud(durham);
            colormap(durham)
        elseif val == 4
            colormap(hsv)
        elseif val == 5
            colormap(gray)
        elseif val == 6
            colormap(hot)
        elseif val == 7
            colormap(cool)
        elseif val == 8
            colormap(bone)
        elseif val == 9
            colormap(copper)
        elseif val == 10
            colormap(spring)
        elseif val == 11
            colormap(summer)
        elseif val == 12
            colormap(autumn)
        elseif val == 13
            colormap(winter)
        end
        
        clear val;
        
end
