function varargout = StaDetails(varargin)
% STADETAILS MATLAB code for StaDetails.fig
%      STADETAILS, by itself, creates a new STADETAILS or raises the existing
%      singleton*.
%
%      H = STADETAILS returns the handle to a new STADETAILS or the handle to
%      the existing singleton*.
%
%      STADETAILS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STADETAILS.M with the given input arguments.
%
%      STADETAILS('Property','Value',...) creates a new STADETAILS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before StaDetails_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to StaDetails_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help StaDetails

% Last Modified by GUIDE v2.5 19-May-2020 22:10:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @StaDetails_OpeningFcn, ...
    'gui_OutputFcn',  @StaDetails_OutputFcn, ...
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


% --- Executes just before StaDetails is made visible.
function StaDetails_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to StaDetails (see VARARGIN)

% Choose default command line output for StaDetails
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes StaDetails wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global Results;
global Parameters
% title
% title = imread('title_gray.png');
% axes(handles.axes_title);
% image(title);
% colormap gray
% set( handles.axes_title, 'visible', 'off' );
% flex
axes(handles.axes_flex);
temp=Results.plot.flex;
index=Results.flex.index;
% edit_flexindex
if ~isnan(temp)
    set(handles.edit_flexindex,'String',num2str(index));
    if length(temp)>10
        temp=temp(1:10,:);
    end
    b=bar(temp);
    ylim([0 max(temp(:))+0.2]);
    set(gca,'xticklabel',index);
    ch = get(b,'children');
    set(ch{1},'facecolor',[123/255, 223/255, 242/255])
    set(ch{2},'facecolor',[242/255, 181/255, 212/255])
    h=legend([ch{1} ch{2}],'Group1','Group2');
    set(h,'FontSize',6.5)
end
% vol
axes(handles.axes_vol);
temp=Results.plot.vol;
index=Results.vol.index;
% edit_volindex
if ~isnan(temp)
    set(handles.edit_volindex,'String',num2str(index));
    if length(temp)>10
        temp=temp(1:10,:);
    end
    b=bar(temp);
    ylim([0 max(temp(:))+0.05]);
    set(gca,'xticklabel',index);
    ch = get(b,'children');
    set(ch{1},'facecolor',[123/255, 223/255, 242/255])
    set(ch{2},'facecolor',[242/255, 181/255, 212/255])
    h=legend([ch{1} ch{2}],'Group1','Group2');
    set(h,'FontSize',6.5)
end
% alle
axes(handles.axes_alle);
x=Results.alle.T_ori;
imagesc(x); colormap default; % linspecer colormap
colorbar;
set( handles.axes_alle, 'visible', 'off' );
% partition
if Parameters.network
    % div
    axes(handles.axes_div);
    temp=Results.plot.div;
    index=Results.div.index;
    if ~isnan(temp)
        % edit_divindex
        set(handles.edit_divindex,'String',num2str(index));
        if length(temp)>10
            temp=temp(1:10,:);
        end
        b=bar(temp);
%         ylim([0 max(temp(:))+0.2]);
        set(gca,'xticklabel',index);
        ch = get(b,'children');
        set(ch{1},'facecolor',[123/255, 223/255, 242/255])
        set(ch{2},'facecolor',[242/255, 181/255, 212/255])
        h=legend([ch{1} ch{2}],'Group1','Group2','Location','southeast');
        set(h,'FontSize',6.5)
    end
    % rec
    axes(handles.axes_rec);
    temp=Results.plot.rec;
    index=Results.rec.index;
    if ~isnan(temp)
        % edit_recindex
        set(handles.edit_recindex,'String',num2str(index));
        if length(temp)>10
            temp=temp(1:10,:);
        end
        b=bar(temp);
        ylim([0 max(temp(:))+0.05]);
        set(gca,'xticklabel',index);
        ch = get(b,'children');
        set(ch{1},'facecolor',[123/255, 223/255, 242/255])
        set(ch{2},'facecolor',[242/255, 181/255, 212/255])
        h=legend([ch{1} ch{2}],'Group1','Group2');
        set(h,'FontSize',6.5)
    end
    % inte
    axes(handles.axes_inte);
    x=Results.inte.T_ori;
    imagesc(x); colormap default; % linspecer colormap
    colorbar;
    set( handles.axes_inte, 'visible', 'off' );
end


% --- Outputs from this function are returned to the command line.
function varargout = StaDetails_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_allebefore.
function pushbutton_allebefore_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_allebefore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% alle
global Results
cla(handles.axes_alle);
axes(handles.axes_alle);
x=Results.alle.T_ori;
heatmap(x,[],[],[],'ColorMap', [], 'NaNColor', [1 1 1], 'colorbar', true);
% imagesc(x); colormap default; % linspecer colormap
colorbar;


% --- Executes on button press in pushbutton_alleafter.
function pushbutton_alleafter_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_alleafter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Results
cla(handles.axes_alle);
axes(handles.axes_alle);
x=Results.alle.t;
x(x==0)=nan;
heatmap(x,[],[],[],'ColorMap', [], 'NaNColor', [1 1 1], 'colorbar', true);
% imagesc(x); colormap default; % linspecer colormap
colorbar;


% --- Executes on button press in pushbutton_intebefore.
function pushbutton_intebefore_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_intebefore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Results
cla(handles.axes_inte);
axes(handles.axes_inte);
x=Results.inte.T_ori;
heatmap(x,[],[],[],'ColorMap', [], 'NaNColor', [1 1 1], 'colorbar', true);
% imagesc(x); colormap default; % linspecer colormap
colorbar;

% --- Executes on button press in pushbutton_inteafter.
function pushbutton_inteafter_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_inteafter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Results
cla(handles.axes_inte);
axes(handles.axes_inte);
x=Results.inte.t;
x(x==0)=nan;
heatmap(x,[],[],[],'ColorMap', [], 'NaNColor', [1 1 1], 'colorbar', true);
% imagesc(x); colormap default; % linspecer colormap
colorbar;



function edit_divindex_Callback(hObject, eventdata, handles)
% hObject    handle to edit_divindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_divindex as text
%        str2double(get(hObject,'String')) returns contents of edit_divindex as a double


% --- Executes during object creation, after setting all properties.
function edit_divindex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_divindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_recindex_Callback(hObject, eventdata, handles)
% hObject    handle to edit_recindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_recindex as text
%        str2double(get(hObject,'String')) returns contents of edit_recindex as a double


% --- Executes during object creation, after setting all properties.
function edit_recindex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_recindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_flexindex_Callback(hObject, eventdata, handles)
% hObject    handle to edit_flexindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_flexindex as text
%        str2double(get(hObject,'String')) returns contents of edit_flexindex as a double


% --- Executes during object creation, after setting all properties.
function edit_flexindex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_flexindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_volindex_Callback(hObject, eventdata, handles)
% hObject    handle to edit_volindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_volindex as text
%        str2double(get(hObject,'String')) returns contents of edit_volindex as a double


% --- Executes during object creation, after setting all properties.
function edit_volindex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_volindex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_overview.
function pushbutton_overview_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_overview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Overview();
