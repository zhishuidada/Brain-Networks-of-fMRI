function varargout = Main(varargin)
% MAIN MATLAB code for Main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 21-Oct-2020 17:43:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_OutputFcn, ...
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


% --- Executes just before Main is made visible.
function Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main (see VARARGIN)

% Choose default command line output for Main
handles.output = hObject;

% visible off
set(handles.uipanel_nifti,'Visible','on');
set(handles.uipanel_mat,'Visible','off');
set(handles.uipanel_npy,'Visible','off');
% title
% title = imread('title_gray.png');
% axes(handles.axes_title);   
% image(title); 
% colormap gray
% set( handles.axes_title, 'visible', 'off' );
% network
set(handles.checkbox_net,'Value',0);
set(handles.edit_net,'Enable','inactive');
set(handles.pushbutton_net,'Enable','inactive');
% omega
set( handles.edit_omega, 'String', 1 );
set(handles.edit_omega,'foregroundcolor',[0.5,0.5,0.5]);
% gamma
set( handles.edit_gamma, 'String', 1 );
set(handles.edit_gamma,'foregroundcolor',[0.5,0.5,0.5]);
% iter
set( handles.edit_iter, 'String', 100 );
set(handles.edit_iter,'foregroundcolor',[0.5,0.5,0.5]);
% threshlod
set( handles.edit_threshold, 'String', 0 );
set(handles.edit_threshold,'foregroundcolor',[0.5,0.5,0.5]);
% fdr
set( handles.edit_fdr, 'Value', 0 );
% fisherz
set( handles.checkbox_fisherz, 'Value', 1 );
% algorithm
set( handles.edit_algorithm, 'Value', 1 );

% % reset
% [reset,~] = imread('reset.png','BackgroundColor',[240/255 240/255  240/255]);   
% set(handles.pushbutton_reset,'CData',reset);  
% % run
% [run,~] = imread('run_trans.png','BackgroundColor',[240/255 240/255  240/255]);
% set(handles.pushbutton_run,'CData',run);  

% visible on
% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_datapath_Callback(hObject, eventdata, handles)
% hObject    handle to edit_datapath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_datapath as text
%        str2double(get(hObject,'String')) returns contents of edit_datapath as a double


% --- Executes during object creation, after setting all properties.
function edit_datapath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_datapath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_datapath.
function pushbutton_datapath_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_datapath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Datapath = uigetdir('*.*','Select your data file'); 
if isequal(Datapath,0)
    return;
else
    set(handles.edit_datapath,'foregroundcolor',[0,0,0]);
    set(handles.edit_datapath,'string',Datapath);
end



function edit_mask_Callback(hObject, eventdata, handles)
% hObject    handle to edit_mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_mask as text
%        str2double(get(hObject,'String')) returns contents of edit_mask as a double


% --- Executes during object creation, after setting all properties.
function edit_mask_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_mask.
function pushbutton_mask_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Maskname,Maskpath] = uigetfile({'*.nii;*.img;*.nii.gz'},'Select your mask file','.\Resources\Mask');
if isequal(Maskname,0)||isequal(Maskpath,0)
    return;
else
    Mask=fullfile(Maskpath,Maskname);
    set(handles.edit_mask,'foregroundcolor',[0,0,0]);
    set(handles.edit_mask,'string',Mask);
end



function edit_window_Callback(hObject, eventdata, handles)
% hObject    handle to edit_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_window as text
%        str2double(get(hObject,'String')) returns contents of edit_window as a double
Winlennum = get(handles.edit_window,'String');
if  isnan(str2double(Winlennum))||str2double(Winlennum)<1||str2double(Winlennum)~=round(str2double(Winlennum))
    set(handles.edit_window,'foregroundcolor',[1,0,0]);
    set(handles.edit_window,'String','Winlen must be a positive integer')
else
    set(handles.edit_window,'foregroundcolor',[0,0,0]);
end



function edit_step_Callback(hObject, eventdata, handles)
% hObject    handle to edit_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_step as text
%        str2double(get(hObject,'String')) returns contents of edit_step as a double
Stepnum = get(handles.edit_step,'String');
if  isnan(str2double(Stepnum))||str2double(Stepnum)<1||str2double(Stepnum)~=round(str2double(Stepnum))
    set(handles.edit_step,'foregroundcolor',[1,0,0]);
    set(handles.edit_step,'String','Step must be a positive integer')
else
    set(handles.edit_step,'foregroundcolor',[0,0,0]);
end


function edit_omega_Callback(hObject, eventdata, handles)
% hObject    handle to edit_omega (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_omega as text
%        str2double(get(hObject,'String')) returns contents of edit_omega as a double
set(handles.edit_omega,'foregroundcolor',[0,0,0]);

% --- Executes during object creation, after setting all properties.
function edit_omega_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_omega (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_gamma_Callback(hObject, eventdata, handles)
% hObject    handle to edit_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_gamma as text
%        str2double(get(hObject,'String')) returns contents of edit_gamma as a double
set(handles.edit_gamma,'foregroundcolor',[0,0,0]);

% --- Executes during object creation, after setting all properties.
function edit_gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_iter_Callback(hObject, eventdata, handles)
% hObject    handle to edit_iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_iter as text
%        str2double(get(hObject,'String')) returns contents of edit_iter as a double
set(handles.edit_iter,'foregroundcolor',[0,0,0]);

% --- Executes during object creation, after setting all properties.
function edit_iter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in edit_fdr.
function edit_fdr_Callback(hObject, eventdata, handles)
% hObject    handle to edit_fdr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of edit_fdr


% --- Executes during object creation, after setting all properties.
function edit_fdr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_fdr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit_threshold_Callback(hObject, eventdata, handles)
% hObject    handle to edit_threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_threshold as text
%        str2double(get(hObject,'String')) returns contents of edit_threshold as a double
set(handles.edit_threshold,'foregroundcolor',[0,0,0]);

% --- Executes during object creation, after setting all properties.
function edit_threshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_threshold (see GCBO)
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

% datatype
set( handles.edit_datatype, 'Value',1);
set( handles.edit_netinfo, 'String','');
% visible
set( handles.uipanel_mat, 'Visible','off');
set( handles.uipanel_npy, 'Visible','off');
pause(0.001);
set( handles.uipanel_nifti, 'Visible','on');
% empty value
% mat
set( handles.edit_mat, 'String','');
set( handles.edit_matwin, 'String','');
set( handles.edit_matstep, 'String','');
% npy
set( handles.edit_npy, 'String','');
set( handles.edit_npywin, 'String','');
set( handles.edit_npywin, 'String','');
% data
set(handles.edit_datapath,'foregroundcolor',[0.5,0.5,0.5]);
set( handles.edit_datapath, 'String', 'select your data path' );
% mask
set(handles.edit_mask,'foregroundcolor',[0.5,0.5,0.5]);
set( handles.edit_mask, 'String', 'select your mask' );
% winlen
set( handles.edit_window, 'String', '' );
% step
set( handles.edit_step, 'String', '' );
% network
set(handles.edit_net,'foregroundcolor',[0.5,0.5,0.5]);
set( handles.edit_net, 'String', 'select your network file' );
set(handles.checkbox_net,'Value',0);
set(handles.edit_net,'Enable','inactive');
set(handles.pushbutton_net,'Enable','inactive');
% save
set( handles.edit_save, 'String', 'select your save path' );
% omega
set( handles.edit_omega, 'String', 1 );
set(handles.edit_omega,'foregroundcolor',[0.5,0.5,0.5]);
% gamma
set( handles.edit_gamma, 'String', 1 );
set(handles.edit_gamma,'foregroundcolor',[0.5,0.5,0.5]);
% iter
set( handles.edit_iter, 'String', 100 );
set(handles.edit_iter,'foregroundcolor',[0.5,0.5,0.5]);
% threshlod
set( handles.edit_threshold, 'String', 0 );
set(handles.edit_threshold,'foregroundcolor',[0.5,0.5,0.5]);
% fdr
set(handles.edit_fdr,'Value',0)
% fisherz
set( handles.checkbox_fisherz, 'Value', 1 );
% timepoints
set(handles.edit_times,'String','');
% algorithm
set( handles.edit_algorithm, 'Value', 1 );
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
% get varargins
% datatype
var_datatype = get( handles.edit_datatype, 'Value');
% data
switch var_datatype
    case 1
        var_data = get( handles.edit_datapath, 'String');
        % mask
        var_mask = get( handles.edit_mask, 'String');
        % winlen
        var_winlen = str2double(get( handles.edit_window, 'String'));
        % step
        var_step = str2double(get( handles.edit_step, 'String'));  
    case 2
        var_data = get( handles.edit_mat, 'String');
        % mask
        var_mask = [];
        % winlen
        var_winlen = str2double(get( handles.edit_matwin, 'String'));
        % step
        var_step = str2double(get( handles.edit_matstep, 'String'));  
    case 3
        var_data = get( handles.edit_npy, 'String');
        % mask
        var_mask = [];
        % winlen
        var_winlen = str2double(get( handles.edit_npywin, 'String'));
        % step
        var_step = str2double(get( handles.edit_npystep, 'String'));  
end
% Networkpath
var_ifnet = get( handles.checkbox_net, 'Value');
var_net = get( handles.edit_net, 'String');
% save
var_save = get( handles.edit_save, 'String');
% omega
var_omega = str2double(get( handles.edit_omega, 'String'));
% gamma
var_gamma = str2double(get( handles.edit_gamma, 'String'));
% iter
var_iter = str2double(get( handles.edit_iter, 'String'));
% threshlod
var_threshold = str2double(get( handles.edit_threshold, 'String'));
% fdr
var_fdr = get( handles.edit_fdr, 'Value');
% fisherz
var_fisherz = get( handles.checkbox_fisherz, 'Value');
% algorithm
var_algorithm =  get( handles.edit_algorithm, 'Value')-1;
% timepoints
var_timepoints = str2double(get( handles.edit_times, 'String'));
% function
% time
Starttime = datestr(now);
% Option struct
Option.Timepoints=var_timepoints;
Option.Omega=var_omega;
Option.Gamma=var_gamma;
Option.itertimes=var_iter;
Option.Threshold=var_threshold;
Option.FDR=var_fdr;
Option.Fisherz=var_fisherz;
Option.ifnet=var_ifnet;
Option.netpath=var_net;
Option.Datatype=var_datatype;
Option.Algorithm=var_algorithm;
% Flexibility_Run
fprintf('Performing Multilayer Flexibility Algorithm\n');
Flexibility_Run( var_data,var_mask,var_winlen,var_step,Option,var_save);
% finished
% [run,~] = imread('run_trans.png','BackgroundColor',[240/255 240/255  240/255]);
% set(handles.pushbutton_run,'CData',run);  
set(handles.pushbutton_run, 'Enable','on');
Stoptime = datestr(now);
fprintf('***Finished***\n')
fprintf('stoptime£º%s\n',Stoptime);
fprintf('time consuming£º%.1f minutes\n',etime(datevec(Stoptime),datevec(Starttime))/60);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton_reset.
function pushbutton_reset_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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



function edit_net_Callback(hObject, eventdata, handles)
% hObject    handle to edit_net (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_net as text
%        str2double(get(hObject,'String')) returns contents of edit_net as a double


% --- Executes during object creation, after setting all properties.
function edit_net_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_net (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_net.
function pushbutton_net_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_net (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[Netname,Netpath] = uigetfile({'*xls;*.xlsx'},'Select your network file','.\Resources\Mask');
if isequal(Netname,0)||isequal(Netpath,0)
    return;
else
    Net=fullfile(Netpath,Netname);
    set(handles.edit_net,'foregroundcolor',[0,0,0]);
    set(handles.edit_net,'string',Net);
end


% --- Executes on button press in checkbox_net.
function checkbox_net_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_net (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_net
if get(handles.checkbox_net,'Value')
    set(handles.edit_net,'Enable','on');
    set(handles.pushbutton_net,'Enable','on');
else
    set(handles.edit_net,'String','select your network file');
    set(handles.edit_net,'foregroundcolor',[0.5,0.5,0.5]);
    set(handles.edit_net,'Enable','inactive');
    set(handles.pushbutton_net,'Enable','inactive');
end


% --- Executes on button press in checkbox_fisherz.
function checkbox_fisherz_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_fisherz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_fisherz



function edit_datatype_Callback(hObject, eventdata, handles)
% hObject    handle to edit_datatype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_datatype as text
%        str2double(get(hObject,'String')) returns contents of edit_datatype as a double
var_datatype=get(handles.edit_datatype,'Value');
switch var_datatype
    case 1
        % visible
        set( handles.uipanel_mat, 'Visible','off');
        set( handles.uipanel_npy, 'Visible','off');
        pause(0.001);
        set( handles.uipanel_nifti, 'Visible','on');
        % empty value
        % mat
        set( handles.edit_mat, 'String','');
        set( handles.edit_matwin, 'String','');
        set( handles.edit_matstep, 'String','');
        % npy
        set( handles.edit_npy, 'String','');
        set( handles.edit_npywin, 'String','');
        set( handles.edit_npywin, 'String','');
    case 2
        % visible
        set( handles.uipanel_nifti, 'Visible','off');
        set( handles.uipanel_npy, 'Visible','off');
        pause(0.001);
        set( handles.uipanel_mat, 'Visible','on');
        % empty value
        % nifti
        set( handles.edit_datapath, 'String','');
        set( handles.edit_mask, 'String','');
        set( handles.edit_window, 'String','');
        set( handles.edit_step, 'String','');
        % npy
        set( handles.edit_npy, 'String','');
        set( handles.edit_npywin, 'String','');
        set( handles.edit_npystep, 'String','');
    case 3
        % visible
        set( handles.uipanel_nifti, 'Visible','off');
        set( handles.uipanel_mat, 'Visible','off');
        pause(0.001);
        set( handles.uipanel_npy, 'Visible','on');
        % empty value
        % nifti
        set( handles.edit_datapath, 'String','');
        set( handles.edit_mask, 'String','');
        set( handles.edit_window, 'String','');
        set( handles.edit_step, 'String','');
        % mat
        set( handles.edit_mat, 'String','');
        set( handles.edit_matwin, 'String','');
        set( handles.edit_matstep, 'String','');
end

    


% --- Executes during object creation, after setting all properties.
function edit_datatype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_datatype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_npy_Callback(hObject, eventdata, handles)
% hObject    handle to edit_npy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_npy as text
%        str2double(get(hObject,'String')) returns contents of edit_npy as a double


% --- Executes during object creation, after setting all properties.
function edit_npy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_npy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_npydata.
function pushbutton_npydata_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_npydata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Datapath = uigetdir('*.*','Select your data file'); 
if isequal(Datapath,0)
    return;
else
    set(handles.edit_npy,'foregroundcolor',[0,0,0]);
    set(handles.edit_npy,'string',Datapath);
end


function edit_npywin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_npywin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_npywin as text
%        str2double(get(hObject,'String')) returns contents of edit_npywin as a double


% --- Executes during object creation, after setting all properties.
function edit_npywin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_npywin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_npystep_Callback(hObject, eventdata, handles)
% hObject    handle to edit_npystep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_npystep as text
%        str2double(get(hObject,'String')) returns contents of edit_npystep as a double


% --- Executes during object creation, after setting all properties.
function edit_npystep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_npystep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_matstep_Callback(hObject, eventdata, handles)
% hObject    handle to edit_matstep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_matstep as text
%        str2double(get(hObject,'String')) returns contents of edit_matstep as a double


function [Windownum] = calcwindows(Timepoints,Winlen,Step)
% Calculate the total number of Windows, at least 1 window
Windownum=1;
if Step>0 && round(Step)==Step
    while 1
        if (Winlen+(Windownum-1)*Step)>Timepoints
            Windownum=Windownum-1;
            break;
        end
        Windownum=Windownum+1;
    end
end
if isnan(Winlen)||isnan(Step)||isnan(Timepoints)
    Windownum=[];
end



% --- Executes during object creation, after setting all properties.
function edit_matstep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_matstep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_matwin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_matwin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_matwin as text
%        str2double(get(hObject,'String')) returns contents of edit_matwin as a double


% --- Executes during object creation, after setting all properties.
function edit_matwin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_matwin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_matdata.
function pushbutton_matdata_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_matdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Datapath = uigetdir('*.*','Select your data file'); 
if isequal(Datapath,0)
    return;
else
    set(handles.edit_mat,'foregroundcolor',[0,0,0]);
    set(handles.edit_mat,'string',Datapath);
end


function edit_mat_Callback(hObject, eventdata, handles)
% hObject    handle to edit_mat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_mat as text
%        str2double(get(hObject,'String')) returns contents of edit_mat as a double


% --- Executes during object creation, after setting all properties.
function edit_mat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_mat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_netinfo_Callback(hObject, eventdata, handles)
% hObject    handle to edit_netinfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_netinfo as text
%        str2double(get(hObject,'String')) returns contents of edit_netinfo as a double


% --- Executes during object creation, after setting all properties.
function edit_netinfo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_netinfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pamanual_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pamanual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pamanual as text
%        str2double(get(hObject,'String')) returns contents of edit_pamanual as a double


% --- Executes during object creation, after setting all properties.
function edit_pamanual_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pamanual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit_times_Callback(hObject, eventdata, handles)
% hObject    handle to edit_times (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_times as text
%        str2double(get(hObject,'String')) returns contents of edit_times as a double
Timepoints=str2double(get(handles.edit_times,'String'));
var_datatype=get(handles.edit_datatype,'Value');
switch var_datatype
    case 1
    Winlen=str2double(get(handles.edit_window,'String'));
    Step=str2double(get(handles.edit_step,'String'));
    case 2
    Winlen=str2double(get(handles.edit_matwin,'String'));
    Step=str2double(get(handles.edit_matstep,'String'));
    case 3
    Winlen=str2double(get(handles.edit_npywin,'String'));
    Step=str2double(get(handles.edit_npystep,'String'));   
end

Windownum = calcwindows(Timepoints,Winlen,Step);
netinfo=['Number of Windows: ',num2str(Windownum)];
set(handles.edit_netinfo,'String',netinfo);

% --- Executes during object creation, after setting all properties.
function edit_times_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_times (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit_algorithm.
function edit_algorithm_Callback(hObject, eventdata, handles)
% hObject    handle to edit_algorithm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns edit_algorithm contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edit_algorithm


% --- Executes during object creation, after setting all properties.
function edit_algorithm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_algorithm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
