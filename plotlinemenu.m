function varargout = plotlinemenu(species,handles)
% Plots crosscuts based on mouse input.

switch species
    
    case 'sp1'
                
        A = handles.A_sp1;
        
        [x,y] = ginput(1);
        
        x = round(x);
        y = round(y); %get input from image window;
        
        set(handles.text_coordvalues_sp1,'String',[num2str(x) ',' num2str(y) ',' num2str(A(y,x)) ';  ']); %update coordinates in coordinate window
        
        ax = get(handles.axes_1dh_sp1,'xlim');
        ax(3:4) = get(handles.axes_1dv_sp1,'xlim');
        
        axes(handles.axes_1dh_sp1);
        plot(ax(1):ax(2),A(y,ax(1):ax(2)));
        set(handles.axes_1dh_sp1,'xlim',[ax(1) ax(2)]);
        title('Crosscut along x');% plot lines
        
        axes(handles.axes_1dv_sp1);
        plot(ax(3):ax(4),A(ax(3):ax(4),x));
        set(handles.axes_1dv_sp1,'xlim',[ax(3) ax(4)]);
        title('Crosscut along y');% "
        
        msgbox('(x-coord,y-coord,intensity) displayed in coordinate window',...
            'Displaying crosscuts');
        
    case 'sp2'
        
        A = handles.A_sp2;
        
        [x,y] = ginput(1);
        
        x = round(x);
        y = round(y); %get input from image window;
        
        set(handles.text_coordvalues_sp2,'String',[num2str(x) ',' num2str(y) ',' num2str(A(y,x)) ';  ']); %update coordinates in coordinate window
        
        ax = get(handles.axes_1dh_sp2,'xlim');
        ax(3:4) = get(handles.axes_1dv_sp2,'xlim');
        
        axes(handles.axes_1dh_sp2);
        plot(ax(1):ax(2),A(y,ax(1):ax(2)));
        set(handles.axes_1dh_sp2,'xlim',[ax(1) ax(2)]);
        title('Crosscut along x');% plot lines
        
        axes(handles.axes_1dv_sp2);
        plot(ax(3):ax(4),A(ax(3):ax(4),x));
        set(handles.axes_1dv_sp2,'xlim',[ax(3) ax(4)]);
        title('Crosscut along y');% "
        
        msgbox('(x-coord,y-coord,intensity) displayed in coordinate window',...
            'Displaying crosscuts');
        
end

   
   