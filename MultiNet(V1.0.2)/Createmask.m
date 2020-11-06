function varargout = Createmask(varargin)
% CREATEMASK MATLAB code for Createmask.fig
%      CREATEMASK, by itself, creates a new CREATEMASK or raises the existing
%      singleton*.
%
%      H = CREATEMASK returns the handle to a new CREATEMASK or the handle to
%      the existing singleton*.
%
%      CREATEMASK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CREATEMASK.M with the given input arguments.
%
%      CREATEMASK('Property','Value',...) creates a new CREATEMASK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Createmask_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Createmask_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Createmask

% Last Modified by GUIDE v2.5 18-May-2020 12:41:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Createmask_OpeningFcn, ...
                   'gui_OutputFcn',  @Createmask_OutputFcn, ...
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


% --- Executes just before Createmask is made visible.
function Createmask_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Createmask (see VARARGIN)

% Choose default command line output for Createmask
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% initialise
% background
% title
% title = imread('title_gray.png');
% axes(handles.axes_title);   
% image(title); 
% colormap gray
% set( handles.axes_title, 'visible', 'off' );
% initialize
set(handles.uipanel_manual,'Visible','off');
set(handles.uipanel_excel,'Visible','on');
set(handles.listbox_index,'Value',1);
% % reset
% [reset,~] = imread('reset.png','BackgroundColor',[240/255 240/255  240/255]);   
% set(handles.pushbutton_reset,'CData',reset);  
% % run
% [run,~] = imread('run_trans.png','BackgroundColor',[240/255 240/255  240/255]);
% set(handles.pushbutton_run,'CData',run);  

% enable
set(handles.listbox_index,'Value',1);
set(handles.edit_indexhand,'Enable','inactive');
set(handles.edit_index,'Enable','on');
set(handles.pushbutton_index,'Enable','on');
set(handles.edit_sheet,'Enable','on');




% UIWAIT makes Createmask wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Createmask_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_index_Callback(hObject, eventdata, handles)
% hObject    handle to edit_index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_index as text
%        str2double(get(hObject,'String')) returns contents of edit_index as a double
set(handles.edit_index,'foregroundcolor',[0,0,0]);


% --- Executes during object creation, after setting all properties.
function edit_index_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_index.
function pushbutton_index_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[indexname,indexpath] = uigetfile({'*.xlsx;*.xls'},'Select your reference mask ','.\Mask');
if isequal(indexname,0)||isequal(indexpath,0)
    return;
else
    index=fullfile(indexpath,indexname);
    set(handles.edit_index,'foregroundcolor',[0,0,0]);
    set(handles.edit_index,'string',index);
end



function edit_indexhand_Callback(hObject, eventdata, handles)
% hObject    handle to edit_indexhand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_indexhand as text
%        str2double(get(hObject,'String')) returns contents of edit_indexhand as a double
set(handles.edit_indexhand,'foregroundcolor',[0,0,0]);


% --- Executes during object creation, after setting all properties.
function edit_indexhand_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_indexhand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_sheet_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sheet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sheet as text
%        str2double(get(hObject,'String')) returns contents of edit_sheet as a double
set(handles.edit_sheet,'foregroundcolor',[0,0,0]);


% --- Executes during object creation, after setting all properties.
function edit_sheet_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sheet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_radius_Callback(hObject, eventdata, handles)
% hObject    handle to edit_radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_radius as text
%        str2double(get(hObject,'String')) returns contents of edit_radius as a double
set(handles.edit_radius,'foregroundcolor',[0,0,0]);


% --- Executes during object creation, after setting all properties.
function edit_radius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_radius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_reset.
function pushbutton_reset_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% visible
set(handles.uipanel_manual,'Visible','off');
set(handles.uipanel_excel,'Visible','on');
set(handles.listbox_index,'Value',1);
% reset
set( handles.edit_index, 'String', '' );
set( handles.edit_indexhand, 'String', '' );
set( handles.edit_sheet, 'String', '' );
set( handles.edit_radius, 'String', '' );
set( handles.edit_ref, 'String', '' );
set( handles.edit_save, 'String', '' );
set( handles.edit_name, 'String', '' );
% enable
set(handles.edit_indexhand,'Enable','inactive');
set(handles.edit_index,'Enable','on');
set(handles.pushbutton_index,'Enable','on');
set(handles.edit_sheet,'Enable','on');
% run
% [run,~] = imread('run_trans.png','BackgroundColor',[240/255 240/255  240/255]);
% set(handles.pushbutton_run,'CData',run);  
set(handles.pushbutton_run, 'Enable','on');





% --- Executes on button press in pushbutton_run.
function pushbutton_run_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Enable off while runing
% set(handles.pushbutton_run, 'Enable','inactive');
% [runing,~] = imread('runing.png','BackgroundColor',[240/255 240/255  240/255]);
% set(handles.pushbutton_run,'CData',runing);  
% pause(0.001);
% get varagin
Radius = str2double(get(handles.edit_radius,'String'));
RefFile = get(handles.edit_ref,'String');
SavePath = get(handles.edit_save,'String');
Name = get(handles.edit_name,'String');
SavePath =[SavePath,'\',Name];
Type = get(handles.listbox_index,'Value');
if Type==1
    Indexpath = get(handles.edit_index,'String');
    Sheetname = get(handles.edit_sheet,'String');
    CreateRoimask([],Radius,RefFile,SavePath,Type,'Indexpath',Indexpath,'Sheetname',Sheetname);
elseif Type==2
     Manualindex =  str2num(get(handles.edit_indexhand,'String'));
     CreateRoimask(Manualindex,Radius,RefFile,SavePath,Type);
end
% finished
% [run,~] = imread('run_trans.png','BackgroundColor',[240/255 240/255  240/255]);
% set(handles.pushbutton_run,'CData',run);  
set(handles.pushbutton_run, 'Enable','on');



function edit_save_Callback(hObject, eventdata, handles)
% hObject    handle to edit_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_save as text
%        str2double(get(hObject,'String')) returns contents of edit_save as a double
set(handles.edit_save,'foregroundcolor',[0,0,0]);


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


% --- Executes on button press in pushbutton_save.
function pushbutton_save_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
savepath = uigetdir('*.*','Select your save path'); 
if isequal(savepath,0)
    return;
else
    set(handles.edit_save,'foregroundcolor',[0,0,0]);
    set(handles.edit_save,'string',savepath);
end



function edit_ref_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ref as text
%        str2double(get(hObject,'String')) returns contents of edit_ref as a double
set(handles.edit_ref,'foregroundcolor',[0,0,0]);





% --- Executes during object creation, after setting all properties.
function edit_ref_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_ref.
function pushbutton_ref_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Maskname,Maskpath] = uigetfile({'*.nii;*.img;*.nii.gz'},'Select your reference mask ','.\Mask');
if isequal(Maskname,0)||isequal(Maskpath,0)
    return;
else
    Mask=fullfile(Maskpath,Maskname);
    set(handles.edit_ref,'foregroundcolor',[0,0,0]);
    set(handles.edit_ref,'string',Mask);
end


% --- Executes on selection change in listbox_index.
function listbox_index_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_index contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_index
if get(handles.listbox_index,'Value')==1
    set(handles.edit_indexhand,'String','');
    set(handles.edit_indexhand,'Enable','inactive');
    set(handles.edit_index,'Enable','on');
    set(handles.pushbutton_index,'Enable','on');
    set(handles.edit_sheet,'Enable','on');
    set(handles.uipanel_manual,'Visible','off');
    set(handles.uipanel_excel,'Visible','on');
elseif get(handles.listbox_index,'Value')==2
    set(handles.edit_indexhand,'Enable','on');
    set(handles.edit_index,'String','');
    set(handles.edit_index,'Enable','inactive');
    set(handles.pushbutton_index,'Enable','inactive');
    set(handles.edit_sheet,'String','');
    set(handles.edit_sheet,'Enable','inactive');
    set(handles.uipanel_excel,'Visible','off');
    set(handles.uipanel_manual,'Visible','on');
end


% --- Executes during object creation, after setting all properties.
function listbox_index_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_index (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_name_Callback(hObject, eventdata, handles)
% hObject    handle to edit_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_name as text
%        str2double(get(hObject,'String')) returns contents of edit_name as a double
set(handles.edit_name,'foregroundcolor',[0,0,0]);


% --- Executes during object creation, after setting all properties.
function edit_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
