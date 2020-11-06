function varargout = Statistics(varargin)
% STATISTICS MATLAB code for Statistics.fig
%      STATISTICS, by itself, creates a new STATISTICS or raises the existing
%      singleton*.
%
%      H = STATISTICS returns the handle to a new STATISTICS or the handle to
%      the existing singleton*.
%
%      STATISTICS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STATISTICS.M with the given input arguments.
%
%      STATISTICS('Property','Value',...) creates a new STATISTICS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Statistics_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Statistics_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Statistics

% Last Modified by GUIDE v2.5 19-May-2020 22:08:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Statistics_OpeningFcn, ...
                   'gui_OutputFcn',  @Statistics_OutputFcn, ...
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


% --- Executes just before Statistics is made visible.
function Statistics_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Statistics (see VARARGIN)

% Choose default command line output for Statistics
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Initialize
global Parameters
global Flag_Group
global Grouplen
global Flag_Covarites
global Covlen
global Results
% GUI
Flag_Group=[1 0 0 0];
Flag_Covarites=[0 0 0 0 0];
Grouplen=length(Flag_Group);
Covlen=length(Flag_Covarites);
% results
Results=[];
% VALUE
% initialize parameters
initialvalue(handles);
% background
% title
% title = imread('title_gray.png');
% axes(handles.axes_title);   
% image(title); 
% colormap gray
% set( handles.axes_title, 'visible', 'off' );
% group1
% [group,~,alpha] = imread('group.jpg');
% axes(handles.axes_group1);   
% h=image(group); 
% set(h,'AlphaData',alpha);
% colormap gray
% set( handles.axes_group1, 'visible', 'off' );
% addgroup
% [add,~] = imread('plus.png','BackgroundColor',[1 1 1]);
% set(handles.pushbutton_groupadd,'CData',add);  
% addcov
% [add,~] = imread('plus.png','BackgroundColor',[1 1 1]);
% set(handles.pushbutton_covadd,'CData',add);  
% % disposeall cov
% [clear,~] = imread('clear.png','BackgroundColor',[1 1 1]);
% set(handles.pushbutton_disposeall,'CData',clear); 
% correction
[correction,~,alpha] = imread('correction.png');
axes(handles.axes_correction);   
h=image(correction); 
set(h,'AlphaData',alpha);
colormap gray
set( handles.axes_correction, 'visible', 'off' );
% alpha
[correction,~,alpha] = imread('correction.png');
axes(handles.axes_alpha);   
h=image(correction); 
set(h,'AlphaData',alpha);
colormap gray
set( handles.axes_alpha, 'visible', 'off' );
% correction
[correction,~,alpha] = imread('correction.png');
axes(handles.axes_net);   
h=image(correction); 
set(h,'AlphaData',alpha);
colormap gray
set( handles.axes_net, 'visible', 'off' );
% % reset
% [reset,~] = imread('reset.png','BackgroundColor',[240/255 240/255  240/255]);   
% set(handles.pushbutton_reset,'CData',reset);  
% % run
% [run,~] = imread('run_trans.png','BackgroundColor',[240/255 240/255  240/255]);
% set(handles.pushbutton_run,'CData',run);  


% other group
for num_group=2:length(Flag_Group)
    % axes
%     eval(['cla(handles.axes_group',num2str(num_group),');']);
%     eval(['set(handles.axes_group',num2str(num_group),',''Visible''',',','''off''',');']);
    % text
    eval(['set(handles.text_group',num2str(num_group),',''Visible''',',','''off''',');']);
    % edit
    eval(['set(handles.edit_group',num2str(num_group),',''Visible''',',','''off''',');']);
    % browse
    eval(['set(handles.pushbutton_group',num2str(num_group),',''Visible''',',','''off''',');']);
    % dispose
    eval(['set(handles.pushbutton_groupdispose',num2str(num_group),',''Visible''',',','''off''',');']);
end
% covariates
for num_cov=1:length(Flag_Covarites)
    % axes
%     eval(['cla(handles.axes_cov',num2str(num_cov),');']);
%     eval(['set(handles.axes_cov',num2str(num_cov),',''Visible''',',','''off''',');']);
    % text
    eval(['set(handles.text_cov',num2str(num_cov),',''Visible''',',','''off''',')']);
    % edit
    eval(['set(handles.edit_cov',num2str(num_cov),',''Visible''',',','''off''',')']);
    % name
    eval(['set(handles.text_covname',num2str(num_cov),',''Visible''',',','''off''',')']);
    % name_edit
    eval(['set(handles.edit_covname',num2str(num_cov),',''Visible''',',','''off''',')']);
    % dispose
    eval(['set(handles.pushbutton_covdispose',num2str(num_cov),',''Visible''',',','''off''',')']);
end


% UIWAIT makes Statistics wait for user response (see UIRESUME)
% uiwait(handles.figure_statistics);


% --- Outputs from this function are returned to the command line.
function varargout = Statistics_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function pop_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pop_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in pop_type.
function pop_type_Callback(hObject, eventdata, handles)
% hObject    handle to pop_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pop_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pop_type
alltype=cellstr(get(handles.pop_type,'String'));
type = get(handles.pop_type,'Value');
if strcmpi(alltype{type},'One Sample T_test')
    % One Sample T_test
    set(handles.edit_contrast,'String','');
    fprintf('Current Statitic Model: %s\n',alltype{type});
elseif strcmpi(alltype{type},'Two Sample T_test')
    % Two Sample T_test
    addgroup(2,handles);
    hiddegroup(3,handles);
    hiddegroup(4,handles);
    set(handles.edit_contrast,'String','1 -1');
    fprintf('Current Statitic Model: %s\n',alltype{type});
elseif strcmpi(alltype{type},'One Way ANOVA')
    % One Way ANOVA
    set(handles.edit_contrast,'String','');
    fprintf('Current Statitic Model: %s\n',alltype{type});    
elseif strcmpi(alltype{type},'Two Way ANOVA')
    % Two Way ANOVA
    set(handles.edit_contrast,'String','');
    fprintf('Current Statitic Model: %s\n',alltype{type});   
elseif strcmpi(alltype{type},'N Way ANOVA')
    % N Way ANOVA
    set(handles.edit_contrast,'String','');
    fprintf('Current Statitic Model: %s\n',alltype{type});      
elseif strcmpi(alltype{type},'RM Way ANOVA')
    % RM ANOVA
    set(handles.edit_contrast,'String','');
    fprintf('Current Statitic Model: %s\n',alltype{type});      
elseif strcmpi(alltype{type},'Paired T_test')
    % Paired
    set(handles.edit_contrast,'String','');
    fprintf('Current Statitic Model: %s\n',alltype{type});   
end







% --- Executes on button press in pushbutton_reset.
function pushbutton_reset_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% reset
global Grouplen
global Covlen
% type & contrast
set(handles.pop_type,'Value',1);
set(handles.edit_contrast,'String','');
fprintf('Current Statitic Model: One Sample T_test\n');
% group
set(handles.edit_group1,'String','');
for loop=2:Grouplen
    hiddegroup(loop,handles);
end
% covariates
for loop=1:Covlen
    hiddecov(loop,handles);
end
% correction
set(handles.edit_correction,'Value',1);
set(handles.edit_alpha,'String','0.05');
set(handles.edit_net,'Value',0);
% Results
set(handles.edit_flex,'String','');
set(handles.edit_div,'String','');
set(handles.edit_vol,'String','');
set(handles.edit_rec,'String','');
set(handles.edit_alle,'String','');
set(handles.edit_inte,'String','');
set(handles.pushbutton_details,'Visible','off');
% run
set(handles.pushbutton_run,'Enable','on');
% initialize parameters
initialvalue(handles);

function initialvalue(handles)
global Parameters
global Grouplen
global Covlen
% statistic model
alltype=cellstr(get(handles.pop_type,'String'));
type = get(handles.pop_type,'Value');
Parameters.model=alltype{type};
% group
Parameters.group=cell(Grouplen,1);
% covariates
Parameters.cov=cell(Covlen,2);
% correction
allcorrec=cellstr(get(handles.edit_correction,'String'));
correc = get(handles.edit_correction,'Value');
Parameters.correction.type=allcorrec{correc};%FDR
Parameters.correction.alpha=0.05;
% contrast
Parameters.contrast=[];% design matrix
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
% VALUE
global Parameters
global Grouplen
global Covlen
global Results
% statistic model
alltype=cellstr(get(handles.pop_type,'String'));
type = get(handles.pop_type,'Value');
Parameters.model=alltype{type};
% group
path_group=cell(Grouplen,1);
value_cov=cell(Covlen,1);
name_cov=cell(Covlen,1);
for loop=1:Grouplen
    eval(['path_group{',num2str(loop),'}=get(handles.edit_group',num2str(loop),',','''string''',');']);
end
Parameters.group=path_group;
% covariates
for loop=1:Covlen
    eval(['name_cov{',num2str(loop),'}=get(handles.edit_covname',num2str(loop),',','''string''',');']);
    eval(['value_cov{',num2str(loop),'}=str2num(get(handles.edit_cov',num2str(loop),',','''string''','));']);
end
Parameters.cov(:,1)=name_cov;
Parameters.cov(:,2)=value_cov;
% correction
alltype=cellstr(get(handles.edit_correction,'String'));
index=get(handles.edit_correction,'Value');
Parameters.correction.type=alltype{index};
Parameters.correction.alpha=str2double(get(handles.edit_alpha,'String'));
% network
Parameters.network=get(handles.edit_net,'Value');
% contrast
Parameters.contrast=str2num(get(handles.edit_contrast,'String'));
% corection_run
Results = Correction_Run(Parameters);
% reassignment
set(handles.edit_flex,'String',num2str(length(Results.flex.t)));
set(handles.edit_vol,'String',num2str(length(Results.vol.t)));
set(handles.edit_alle,'String',num2str(length(find(Results.alle.t))/2));
% network
if Parameters.network
    set(handles.edit_div,'String',num2str(length(Results.div.t)));
    set(handles.edit_rec,'String',num2str(length(Results.rec.t)));
    set(handles.edit_inte,'String',num2str(length(find(Results.inte.t))/2));
end
% Details
if strcmp(Parameters.model,'Two Sample T_test')
    set(handles.pushbutton_details,'Visible','on');
end
% finished
% [run,~] = imread('run_trans.png','BackgroundColor',[240/255 240/255  240/255]);
% set(handles.pushbutton_run,'CData',run);  
set(handles.pushbutton_run, 'Enable','on');

function edit_alpha_Callback(hObject, eventdata, handles)
% hObject    handle to edit_alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_alpha as text
%        str2double(get(hObject,'String')) returns contents of edit_alpha as a double
set(hObject,'ForegroundColor',[0,0,0]);

% --- Executes during object creation, after setting all properties.
function edit_alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit_correction.
function edit_correction_Callback(hObject, eventdata, handles)
% hObject    handle to edit_correction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns edit_correction contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edit_correction
set(hObject,'ForegroundColor',[0,0,0]);

% --- Executes during object creation, after setting all properties.
function edit_correction_CreateFcn(hObject, ~, handles)
% hObject    handle to edit_correction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_group1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_group1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_group1 as text
%        str2double(get(hObject,'String')) returns contents of edit_group1 as a double


% --- Executes during object creation, after setting all properties.
function edit_group1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_group1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_group1.
function pushbutton_group1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_group1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
groupfile = uigetdir('*.*','Select your Multilayer Flexibility path of group1'); 
if isequal(groupfile,0)
    return;
else
    set(handles.edit_group1,'foregroundcolor',[0,0,0]);
    set(handles.edit_group1,'string',groupfile);
end

% --- Executes on button press in pushbutton_groupadd.
function pushbutton_groupadd_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_groupadd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_Group
Alter=find(Flag_Group==0,1,'first');
if isempty(Alter)
    set(handles.pushbutton_groupadd,'Enable','inactive');
    msgbox('The maximum allowed groups is four now!','Multilayer Fexibility');
else
    addgroup(Alter,handles);
end 






function edit_group2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_group2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_group2 as text
%        str2double(get(hObject,'String')) returns contents of edit_group2 as a double


% --- Executes during object creation, after setting all properties.
function edit_group2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_group2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_group2.
function pushbutton_group2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_group2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
groupfile = uigetdir('*.*','Select your Multilayer Flexibility path of group1'); 
if isequal(groupfile,0)
    return;
else
    set(handles.edit_group2,'foregroundcolor',[0,0,0]);
    set(handles.edit_group2,'string',groupfile);
end

% --- Executes on button press in pushbutton_groupdispose2.
function pushbutton_groupdispose2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_groupdispose2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% axes
hiddegroup(2,handles);
Arrgroup(handles)



function addgroup(Alter,handles)
% add group
global Flag_Group
Flag_Group(Alter)=1;
% axes
% [group,~,alpha] = imread('group.jpg');
% eval(['axes(handles.axes_group',num2str(Alter),');']);
% h=image(group); 
% set(h,'AlphaData',alpha);
% colormap gray
% eval(['set(handles.axes_group',num2str(Alter),',''Visible''',',','''off''',')']);
% text
eval(['set(handles.text_group',num2str(Alter),',''Visible''',',','''on''',')']);
% edit
eval(['set(handles.edit_group',num2str(Alter),',''Visible''',',','''on''',')']);
% browse
eval(['set(handles.pushbutton_group',num2str(Alter),',''Visible''',',','''on''',')']);
% dispose
% [delete,~] = imread('delete.png','BackgroundColor',[1 1 1]);
% eval(['set(handles.pushbutton_groupdispose',num2str(Alter),',''CData''',',','delete',')']);
eval(['set(handles.pushbutton_groupdispose',num2str(Alter),',''Visible''',',','''on''',')']);

function    hiddegroup(Dispose,handles)
% hidde group
global Flag_Group
global Grouplen
% enable
Flag_Group(Dispose)=0;
% eval(['cla(handles.axes_group',num2str(Dispose),');']);
% eval(['set(handles.axes_group',num2str(Dispose),',''Visible''',',','''off''',');']);
% text
eval(['set(handles.text_group',num2str(Dispose),',''Visible''',',','''off''',')']);
% edit
eval(['set(handles.edit_group',num2str(Dispose),',''Visible''',',','''off''',')']);
eval(['set(handles.edit_group',num2str(Dispose),',''String''',',','''''',')']);
% browse
eval(['set(handles.pushbutton_group',num2str(Dispose),',''Visible''',',','''off''',')']);
% dispose
eval(['set(handles.pushbutton_groupdispose',num2str(Dispose),',''Visible''',',','''off''',')']);
if sum(Flag_Group)<=Grouplen
    set(handles.pushbutton_groupadd,'Enable','on');
end 
pause(0.00001);

function Arrgroup(handles)
% rearrange groups
global Flag_Group
Index_Now=find(Flag_Group);
Index_Order=1:sum(Flag_Group);
if ~isequal(Index_Order,Index_Now)
    %  group1 is fixed
    for loop=2:length(Index_Now)
        eval(['Edit=get(handles.edit_group',num2str(Index_Now(loop)),',''String''',');']);
        eval(['set(handles.edit_group',num2str(Index_Order(loop)),',''String''',',Edit',');']);
        eval(['set(handles.edit_group',num2str(Index_Now(loop)),',''String''',',''''',');']);
        hiddegroup(Index_Now(loop),handles);
        addgroup(Index_Order(loop),handles)
    end
end
    
    







function edit_group3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_group3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_group3 as text
%        str2double(get(hObject,'String')) returns contents of edit_group3 as a double


% --- Executes during object creation, after setting all properties.
function edit_group3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_group3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_group3.
function pushbutton_group3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_group3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
groupfile = uigetdir('*.*','Select your Multilayer Flexibility path of group1'); 
if isequal(groupfile,0)
    return;
else
    set(handles.edit_group3,'foregroundcolor',[0,0,0]);
    set(handles.edit_group3,'string',groupfile);
end

% --- Executes on button press in pushbutton_groupdispose3.
function pushbutton_groupdispose3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_groupdispose3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% axes
hiddegroup(3,handles);
Arrgroup(handles)


function edit_group4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_group4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_group4 as text
%        str2double(get(hObject,'String')) returns contents of edit_group4 as a double


% --- Executes during object creation, after setting all properties.
function edit_group4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_group4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_group4.
function pushbutton_group4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_group4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
groupfile = uigetdir('*.*','Select your Multilayer Flexibility path of group1'); 
if isequal(groupfile,0)
    return;
else
    set(handles.edit_group4,'foregroundcolor',[0,0,0]);
    set(handles.edit_group4,'string',groupfile);
end

% --- Executes on button press in pushbutton_groupdispose4.
function pushbutton_groupdispose4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_groupdispose4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% axes
hiddegroup(4,handles);
Arrgroup(handles)

% --- Executes on button press in pushbutton_covadd.
function pushbutton_covadd_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_covadd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Flag_Covarites
Alter=find(Flag_Covarites==0,1,'first');
if isempty(Alter)
    set(handles.pushbutton_covadd,'Enable','inactive');
    msgbox('The maximum allowed covariates is five now!','Multilayer Fexibility');
else
    addcov(Alter,handles);
end 


function addcov(Alter,handles)
% add group
global Flag_Covarites
Flag_Covarites(Alter)=1;
% axes
% [cov,~,alpha] = imread('cov.png');
% eval(['axes(handles.axes_cov',num2str(Alter),');']);
% h=image(cov); 
% set(h,'AlphaData',alpha);
% colormap gray
% eval(['set(handles.axes_cov',num2str(Alter),',''Visible''',',','''off''',')']);
% text
eval(['set(handles.text_cov',num2str(Alter),',''Visible''',',','''on''',')']);
eval(['set(handles.text_covname',num2str(Alter),',''Visible''',',','''on''',')']);
% edit
eval(['set(handles.edit_cov',num2str(Alter),',''Visible''',',','''on''',')']);
eval(['set(handles.edit_covname',num2str(Alter),',''Visible''',',','''on''',')']);
% dispose
% [delete,~] = imread('delete.png','BackgroundColor',[1 1 1]);
% eval(['set(handles.pushbutton_covdispose',num2str(Alter),',''CData''',',','delete',')']);
eval(['set(handles.pushbutton_covdispose',num2str(Alter),',''Visible''',',','''on''',')']);

function    hiddecov(Dispose,handles)
% hidde group
global Flag_Covarites
global Covlen
% enable
Flag_Covarites(Dispose)=0;
% eval(['cla(handles.axes_cov',num2str(Dispose),');']);
% eval(['set(handles.axes_cov',num2str(Dispose),',''Visible''',',','''off''',');']);
% text
eval(['set(handles.text_cov',num2str(Dispose),',''Visible''',',','''off''',')']);
eval(['set(handles.text_covname',num2str(Dispose),',''Visible''',',','''off''',')']);
% edit
eval(['set(handles.edit_cov',num2str(Dispose),',''Visible''',',','''off''',')']);
eval(['set(handles.edit_cov',num2str(Dispose),',''String''',',','''''',')']);
eval(['set(handles.edit_covname',num2str(Dispose),',''Visible''',',','''off''',')']);
eval(['set(handles.edit_covname',num2str(Dispose),',''String''',',','''''',')']);
% dispose
eval(['set(handles.pushbutton_covdispose',num2str(Dispose),',''Visible''',',','''off''',')']);
if sum(Flag_Covarites)<=Covlen
    set(handles.pushbutton_covadd,'Enable','on');
end 
pause(0.00001);

function Arrcov(handles)
% rearrange groups
global Flag_Covarites
Index_Now=find(Flag_Covarites);
Index_Order=1:sum(Flag_Covarites);
if ~isequal(Index_Order,Index_Now)
    %  group1 is fixed
    for loop=1:length(Index_Now)
        eval(['Edit=get(handles.edit_cov',num2str(Index_Now(loop)),',''String''',');']);
        eval(['Edit_Name=get(handles.edit_covname',num2str(Index_Now(loop)),',''String''',');']);
        eval(['set(handles.edit_cov',num2str(Index_Order(loop)),',''String''',',Edit',');']);
        eval(['set(handles.edit_covname',num2str(Index_Order(loop)),',''String''',',Edit_Name',');']);
        eval(['set(handles.edit_cov',num2str(Index_Now(loop)),',''String''',',''''',');']);
        eval(['set(handles.edit_covname',num2str(Index_Now(loop)),',''String''',',''''',');']);
        hiddecov(Index_Now(loop),handles);
        addcov(Index_Order(loop),handles)
    end
end


function edit_cov1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cov1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cov1 as text
%        str2double(get(hObject,'String')) returns contents of edit_cov1 as a double


% --- Executes during object creation, after setting all properties.
function edit_cov1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cov1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_covname1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_covname1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_covname1 as text
%        str2double(get(hObject,'String')) returns contents of edit_covname1 as a double


% --- Executes during object creation, after setting all properties.
function edit_covname1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_covname1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_flex_Callback(hObject, eventdata, handles)
% hObject    handle to edit_flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_flex as text
%        str2double(get(hObject,'String')) returns contents of edit_flex as a double


% --- Executes during object creation, after setting all properties.
function edit_flex_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_flex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_vol_Callback(hObject, eventdata, handles)
% hObject    handle to edit_vol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_vol as text
%        str2double(get(hObject,'String')) returns contents of edit_vol as a double


% --- Executes during object creation, after setting all properties.
function edit_vol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_vol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_alle_Callback(hObject, eventdata, handles)
% hObject    handle to edit_alle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_alle as text
%        str2double(get(hObject,'String')) returns contents of edit_alle as a double


% --- Executes during object creation, after setting all properties.
function edit_alle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_alle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_div_Callback(hObject, eventdata, handles)
% hObject    handle to edit_div (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_div as text
%        str2double(get(hObject,'String')) returns contents of edit_div as a double


% --- Executes during object creation, after setting all properties.
function edit_div_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_div (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_rec_Callback(hObject, eventdata, handles)
% hObject    handle to edit_rec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_rec as text
%        str2double(get(hObject,'String')) returns contents of edit_rec as a double


% --- Executes during object creation, after setting all properties.
function edit_rec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_rec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_inte_Callback(hObject, eventdata, handles)
% hObject    handle to edit_inte (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_inte as text
%        str2double(get(hObject,'String')) returns contents of edit_inte as a double


% --- Executes during object creation, after setting all properties.
function edit_inte_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_inte (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_details.
function pushbutton_details_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_details (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
StaDetails();

% --- Executes on button press in pushbutton_covdispose1.
function pushbutton_covdispose1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_covdispose1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hiddecov(1,handles);
Arrcov(handles)


function edit_cov2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cov2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cov2 as text
%        str2double(get(hObject,'String')) returns contents of edit_cov2 as a double


% --- Executes during object creation, after setting all properties.
function edit_cov2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cov2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_covname2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_covname2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_covname2 as text
%        str2double(get(hObject,'String')) returns contents of edit_covname2 as a double


% --- Executes during object creation, after setting all properties.
function edit_covname2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_covname2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_covdispose2.
function pushbutton_covdispose2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_covdispose2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hiddecov(2,handles);
Arrcov(handles)


function edit_cov3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cov3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cov3 as text
%        str2double(get(hObject,'String')) returns contents of edit_cov3 as a double


% --- Executes during object creation, after setting all properties.
function edit_cov3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cov3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_covname3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_covname3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_covname3 as text
%        str2double(get(hObject,'String')) returns contents of edit_covname3 as a double


% --- Executes during object creation, after setting all properties.
function edit_covname3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_covname3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_covdispose3.
function pushbutton_covdispose3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_covdispose3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hiddecov(3,handles);
Arrcov(handles)


function edit_cov4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cov4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cov4 as text
%        str2double(get(hObject,'String')) returns contents of edit_cov4 as a double


% --- Executes during object creation, after setting all properties.
function edit_cov4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cov4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_covname4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_covname4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_covname4 as text
%        str2double(get(hObject,'String')) returns contents of edit_covname4 as a double


% --- Executes during object creation, after setting all properties.
function edit_covname4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_covname4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_covdispose4.
function pushbutton_covdispose4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_covdispose4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hiddecov(4,handles);
Arrcov(handles)


function edit_cov5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cov5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cov5 as text
%        str2double(get(hObject,'String')) returns contents of edit_cov5 as a double


% --- Executes during object creation, after setting all properties.
function edit_cov5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cov5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_covname5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_covname5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_covname5 as text
%        str2double(get(hObject,'String')) returns contents of edit_covname5 as a double


% --- Executes during object creation, after setting all properties.
function edit_covname5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_covname5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_covdispose5.
function pushbutton_covdispose5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_covdispose5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hiddecov(5,handles);
Arrcov(handles)


function edit_contrast_Callback(hObject, eventdata, handles)
% hObject    handle to edit_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_contrast as text
%        str2double(get(hObject,'String')) returns contents of edit_contrast as a double
set(hObject,'ForegroundColor',[0,0,0]);

% --- Executes during object creation, after setting all properties.
function edit_contrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_disposeall.
function pushbutton_disposeall_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_disposeall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Covlen
for loop=1:Covlen
    hiddecov(loop,handles);
end


% --- Executes on button press in edit_net.
function edit_net_Callback(hObject, eventdata, handles)
% hObject    handle to edit_net (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of edit_net


% --- Executes during object creation, after setting all properties.
function edit_net_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_net (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function figure_statistics_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure_statistics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear global;
