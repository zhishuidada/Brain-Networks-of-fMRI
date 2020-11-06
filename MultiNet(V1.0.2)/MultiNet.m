function varargout = MultiNet(varargin)
% MULTINET MATLAB code for MultiNet.fig
%      MULTINET, by itself, creates a new MULTINET or raises the existing
%      singleton*.
%
%      H = MULTINET returns the handle to a new MULTINET or the handle to
%      the existing singleton*.
%
%      MULTINET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MULTINET.M with the given input arguments.
%
%      MULTINET('Property','Value',...) creates a new MULTINET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MultiNet_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MultiNet_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MultiNet

% Last Modified by GUIDE v2.5 23-Jun-2020 21:23:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MultiNet_OpeningFcn, ...
                   'gui_OutputFcn',  @MultiNet_OutputFcn, ...
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


% --- Executes just before MultiNet is made visible.
function MultiNet_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MultiNet (see VARARGIN)

% Choose default command line output for MultiNet
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MultiNet wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clc
cprintf([1,0.5,0],'-- Multilayer Brain Network Analysis --\n');
cprintf([1,0.5,0],'Software version: 1.0.2\n');
cprintf([1,0.5,0],'Copyright (C) 2020-2021 chijun Deng All Rights Reserved\n');
% title
% axes(handles.axes_logo); 
% imgplayer
imgplayer(0.72)





% --- Outputs from this function are returned to the command line.
function varargout = MultiNet_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
% varargout{1} = handles.output;


% --- Executes on button press in pushbutton_start.
function pushbutton_start_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Main();


% --- Executes on button press in pushbutton_sta.
function pushbutton_sta_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_sta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Statistics();


% --- Executes on button press in pushbutton_mask.
function pushbutton_mask_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Createmask();


% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% clc
fprintf('Bye Bye!\n');
