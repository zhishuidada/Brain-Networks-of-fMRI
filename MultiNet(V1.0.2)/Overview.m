function varargout = Overview(varargin)
% OVERVIEW MATLAB code for Overview.fig
%      OVERVIEW, by itself, creates a new OVERVIEW or raises the existing
%      singleton*.
%
%      H = OVERVIEW returns the handle to a new OVERVIEW or the handle to
%      the existing singleton*.
%
%      OVERVIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OVERVIEW.M with the given input arguments.
%
%      OVERVIEW('Property','Value',...) creates a new OVERVIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Overview_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Overview_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Overview

% Last Modified by GUIDE v2.5 20-May-2020 10:37:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Overview_OpeningFcn, ...
                   'gui_OutputFcn',  @Overview_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Overview is made visible.
function Overview_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Overview (see VARARGIN)

% Choose default command line output for Overview
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Overview wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% GUI
% title
% title = imread('title_gray.png');
% axes(handles.axes_title);
% image(title);
% colormap gray
% set( handles.axes_title, 'visible', 'off' );
% Value
% Type
set(handles.popupmenu_type,'Value',1);
% ROIs
set(handles.popupmenu_roi,'Value',1);
% Input ROIs
set(handles.edit_roi,'Enable','inactive');
% Group
set(handles.edit_roi,'Value',1);



% --- Outputs from this function are returned to the command line.
function varargout = Overview_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu_type.
function popupmenu_type_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_type
global Parameters
if ~Parameters.network
    set(handles.popupmenu_type,'string',{'Flexibility','Voltality'})
else
    set(handles.popupmenu_type,'string',{'Flexibility','Voltality','Local','Global'})
end


% --- Executes during object creation, after setting all properties.
function popupmenu_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_roi_Callback(hObject, eventdata, handles)
% hObject    handle to edit_roi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_roi as text
%        str2double(get(hObject,'String')) returns contents of edit_roi as a double



% --- Executes during object creation, after setting all properties.
function edit_roi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_roi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_roi.
function popupmenu_roi_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_roi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_roi contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_roi
Type=get(handles.popupmenu_roi,'Value');
if Type==4
    set(handles.edit_roi,'Enable','on');
else
    set(handles.edit_roi,'Enable','off');
    set(handles.edit_roi,'string','');
end   
    
    

% --- Executes during object creation, after setting all properties.
function popupmenu_roi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_roi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_ok.
function pushbutton_ok_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Initialize
% Value
% Type
global Results
Type=get(handles.popupmenu_type,'Value');
switch Type
    case 1
        var_type='flex';
        title='Flexibility';
    case 2
        var_type='vol';
        title='Volatility';
    case 3
        var_type='div';
        title='Local';
    case 4    
        var_type='rec';
        title='Global';
end
% ROIs
ROI=get(handles.popupmenu_roi,'Value');
switch ROI
    case 1
        var_roi=':';
    case 2
        var_roi='1:50';
    case 3
        var_roi='end-49:end';
    case 4    
        var_roi=get(handles.edit_roi,'String');
    case 5
        eval(['var_roi=Results.',var_type,'.index;']);
        var_roi=num2str(var_roi);
end
% Group
Group=get(handles.popupmenu_group,'Value');
switch Group
    case 1
        var_group='[Group1;Group2]';
    case 2
        var_group='Group1';
    case 3
        var_group='Group2';
    case 4
        var_group='Contrast';
end

% plot
eval(['Group1=Results.plot.',var_type,'raw.group1;']);
eval(['Group2=Results.plot.',var_type,'raw.group2;']);
% Subtype
Subtype_Group1=ones(size(Group1));
Subtype_Group2=ones(size(Group2))+1;
if strcmp(var_group,'[Group1;Group2]')
    Data=[Group1;Group2];
elseif strcmp(var_group,'Group1')
    Data=Group1;
elseif strcmp(var_group,'Group2')
    Data=Group2;
elseif strcmp(var_group,'Contrast')
    Data=[Group1;Group2];
    Subtype=[Subtype_Group1;Subtype_Group2];
end
% Index
Index=1:size(Data,2);
% Subtype
% Select Rois
if ROI==4||ROI==5
    eval(['Data=Data(:,[',var_roi,']);']);
    eval(['Index=Index([',var_roi,']);']);
    if strcmp(var_group,'Contrast')
         eval(['Subtype=Subtype(:,[',var_roi,']);']);
    end
else
    eval(['Data=Data(:,',var_roi,');']);
    eval(['Index=Index(',var_roi,');']);
    if strcmp(var_group,'Contrast')
        eval(['Subtype=Subtype(:,',var_roi,');']);
    end
end
% reshape
Region=cell(size(Data,1)*size(Data,2),1);
for loop=1:size(Data,2)
    Region(size(Data,1)*(loop-1)+1:size(Data,1)*loop,1)={num2str(Index(loop),'%03d')};
end
Data_Reshape=reshape(Data,size(Data,1)*size(Data,2),1);
if strcmp(var_group,'Contrast')
    Subtype_Reshape=reshape(Subtype,size(Subtype,1)*size(Subtype,2),1);
end

% Visual Type
Visual=get(handles.popupmenu_visual,'Value');
switch Visual
    case 1
        var_visual='g.stat_violin(''normalization'',''width'',''dodge'',0,''width'',1,''fill'',''transparent'');';
    case 2
        var_visual='g.stat_boxplot(''width'',0.5);';
    case 3
        var_visual='g.geom_jitter(''width'',0.4,''height'',0);';
    case 4
        var_visual='g.stat_summary(''geom'',{''bar'',''black_errorbar''});';
    case 5
        var_visual='g.stat_violin(''normalization'',''width'',''dodge'',0,''width'',1,''fill'',''transparent'');';
end

%  plot
clear g;
p=handles.uipanel_plot;
delete(allchild(p));
%Jittered scatter plot
if strcmp(var_group,'Contrast')
    Contrastname=cell(size(Subtype_Reshape));
    Contrastname(Subtype_Reshape==1)={'Group1'};
    Contrastname(Subtype_Reshape==2)={'Group2'};
    g=gramm('x',Region,'y',Data_Reshape,'color',Contrastname,'subset',Subtype_Reshape==1|Subtype_Reshape==2);
    g.set_parent(p);
    g.set_names('x','ROIs','y',title,'color','Groups');
    eval(var_visual);
    if Visual==5
        g.stat_boxplot('width',1);
    end
    g.set_title([title,' Distribution of Rois']);
    g.draw();
else
    g=gramm('x',Region,'y',Data_Reshape,'color',Region);
    g.set_parent(p);
    g.set_names('x','ROIs','y',title,'color','ROIs');
    eval(var_visual);
    if length(Index)<=20&&Visual==5
        g.stat_boxplot('width',1);
    end
    g.set_title([title,' Distribution of Rois']);
    g.draw();
end


 





% --- Executes on selection change in popupmenu_group.
function popupmenu_group_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_group (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_group contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_group


% --- Executes during object creation, after setting all properties.
function popupmenu_group_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_group (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu_visual.
function popupmenu_visual_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_visual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_visual contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_visual


% --- Executes during object creation, after setting all properties.
function popupmenu_visual_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_visual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_save_Callback(hObject, eventdata, handles)
% hObject    handle to edit_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_save as text
%        str2double(get(hObject,'String')) returns contents of edit_save as a double


% --- Executes during object creation, after setting all properties.
function edit_save_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_savebr.
function pushbutton_savebr_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_savebr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Datapath = uigetdir('*.*','Select your output directory'); 
if isequal(Datapath,0)
    return;
else
    set(handles.edit_save,'foregroundcolor',[0,0,0]);
    set(handles.edit_save,'string',Datapath);
end

% --- Executes on button press in pushbutton_save.
function pushbutton_save_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Results
Path=get(handles.edit_save,'String');
save([Path,'\Results.mat'],'Results');
