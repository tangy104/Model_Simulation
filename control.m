function varargout = control(varargin)
% CONTROL MATLAB code for control.fig
%      CONTROL, by itself, creates a new CONTROL or raises the existing
%      singleton*.
%
%      H = CONTROL returns the handle to a new CONTROL or the handle to
%      the existing singleton*.
%
%      CONTROL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROL.M with the given input arguments.
%
%      CONTROL('Property','Value',...) creates a new CONTROL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before control_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to control_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help control

% Last Modified by GUIDE v2.5 27-Jun-2023 15:33:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @control_OpeningFcn, ...
                   'gui_OutputFcn',  @control_OutputFcn, ...
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


% --- Executes just before control is made visible.
function control_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to control (see VARARGIN)

% Choose default command line output for control
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes control wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = control_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

ModelName = 'final_assembly';
    global var;

    t1=get(handles.slider1,'value');
    set(handles.edit1,'string',num2str(t1));

    t2=get(handles.slider2,'value');
    set(handles.edit2,'string',num2str(t2));

    t3=get(handles.slider3,'value');
    set(handles.edit3,'string',num2str(t3));

    t4=get(handles.slider4,'value');
    set(handles.edit4,'string',num2str(t4));

    t5=get(handles.slider5,'value');
    set(handles.edit5,'string',num2str(t5));

    t6=get(handles.slider6,'value');
    set(handles.edit6,'string',num2str(t6));

    q=[t1,t2,t3,t4,t5,t6];
    T = compForwardKinematics(q);
    
    
    Px=T(1,4,end);
    Py=T(2,4,end);
    Pz=T(3,4,end);

    set(handles.edit7,'string',num2str(Px));
    set(handles.slider7,'value',Px);
    set(handles.edit8,'string',num2str(Py));
    set(handles.slider8,'value',Py);
    set(handles.edit9,'string',num2str(Pz));
    set(handles.slider9,'value',Pz);

    set_param([ModelName '/Slider Gain'], 'Gain',num2str(t1))
    set_param([ModelName '/Slider Gain1'], 'Gain',num2str(t2))
    set_param([ModelName '/Slider Gain2'], 'Gain',num2str(t3))
    set_param([ModelName '/Slider Gain3'], 'Gain',num2str(t4))
    set_param([ModelName '/Slider Gain4'], 'Gain',num2str(t5))
    set_param([ModelName '/Slider Gain5'], 'Gain',num2str(t6))


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

ModelName = 'final_assembly';
    global var;

    t1=get(handles.slider1,'value');
    set(handles.edit1,'string',num2str(t1));

    t2=get(handles.slider2,'value');
    set(handles.edit2,'string',num2str(t2));

    t3=get(handles.slider3,'value');
    set(handles.edit3,'string',num2str(t3));

    t4=get(handles.slider4,'value');
    set(handles.edit4,'string',num2str(t4));

    t5=get(handles.slider5,'value');
    set(handles.edit5,'string',num2str(t5));

    t6=get(handles.slider6,'value');
    set(handles.edit6,'string',num2str(t6));

    q=[t1,t2,t3,t4,t5,t6];
    T = compForwardKinematics(q);
    
    
    Px=T(1,4,end);
    Py=T(2,4,end);
    Pz=T(3,4,end);

    set(handles.edit7,'string',num2str(Px));
    set(handles.slider7,'value',Px);
    set(handles.edit8,'string',num2str(Py));
    set(handles.slider8,'value',Py);
    set(handles.edit9,'string',num2str(Pz));
    set(handles.slider9,'value',Pz);

   
    set_param([ModelName '/Slider Gain'], 'Gain',num2str(t1))
    set_param([ModelName '/Slider Gain1'], 'Gain',num2str(t2))
    set_param([ModelName '/Slider Gain2'], 'Gain',num2str(t3))
    set_param([ModelName '/Slider Gain3'], 'Gain',num2str(t4))
    set_param([ModelName '/Slider Gain4'], 'Gain',num2str(t5))
    set_param([ModelName '/Slider Gain5'], 'Gain',num2str(t6))

    
% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

ModelName = 'final_assembly';
    global var;

    t1=get(handles.slider1,'value');
    set(handles.edit1,'string',num2str(t1));

    t2=get(handles.slider2,'value');
    set(handles.edit2,'string',num2str(t2));

    t3=get(handles.slider3,'value');
    set(handles.edit3,'string',num2str(t3));

    t4=get(handles.slider4,'value');
    set(handles.edit4,'string',num2str(t4));

    t5=get(handles.slider5,'value');
    set(handles.edit5,'string',num2str(t5));

    t6=get(handles.slider6,'value');
    set(handles.edit6,'string',num2str(t6));

    q=[t1,t2,t3,t4,t5,t6];
    T = compForwardKinematics(q);
    
    
    Px=T(1,4,end);
    Py=T(2,4,end);
    Pz=T(3,4,end);

    set(handles.edit7,'string',num2str(Px));
    set(handles.slider7,'value',Px);
    set(handles.edit8,'string',num2str(Py));
    set(handles.slider8,'value',Py);
    set(handles.edit9,'string',num2str(Pz));
    set(handles.slider9,'value',Pz);

    set_param([ModelName '/Slider Gain'], 'Gain',num2str(t1))
    set_param([ModelName '/Slider Gain1'], 'Gain',num2str(t2))
    set_param([ModelName '/Slider Gain2'], 'Gain',num2str(t3))
    set_param([ModelName '/Slider Gain3'], 'Gain',num2str(t4))
    set_param([ModelName '/Slider Gain4'], 'Gain',num2str(t5))
    set_param([ModelName '/Slider Gain5'], 'Gain',num2str(t6))

    

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

ModelName = 'final_assembly';
    global var;

    t1=get(handles.slider1,'value');
    set(handles.edit1,'string',num2str(t1));

    t2=get(handles.slider2,'value');
    set(handles.edit2,'string',num2str(t2));

    t3=get(handles.slider3,'value');
    set(handles.edit3,'string',num2str(t3));

    t4=get(handles.slider4,'value');
    set(handles.edit4,'string',num2str(t4));

    t5=get(handles.slider5,'value');
    set(handles.edit5,'string',num2str(t5));

    t6=get(handles.slider6,'value');
    set(handles.edit6,'string',num2str(t6));

    q=[t1,t2,t3,t4,t5,t6];
    T = compForwardKinematics(q);
    
    
    Px=T(1,4,end);
    Py=T(2,4,end);
    Pz=T(3,4,end);

    set(handles.edit7,'string',num2str(Px));
    set(handles.slider7,'value',Px);
    set(handles.edit8,'string',num2str(Py));
    set(handles.slider8,'value',Py);
    set(handles.edit9,'string',num2str(Pz));
    set(handles.slider9,'value',Pz);

    set_param([ModelName '/Slider Gain'], 'Gain',num2str(t1))
    set_param([ModelName '/Slider Gain1'], 'Gain',num2str(t2))
    set_param([ModelName '/Slider Gain2'], 'Gain',num2str(t3))
    set_param([ModelName '/Slider Gain3'], 'Gain',num2str(t4))
    set_param([ModelName '/Slider Gain4'], 'Gain',num2str(t5))
    set_param([ModelName '/Slider Gain5'], 'Gain',num2str(t6))

    

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

ModelName = 'final_assembly';
    global var;

    t1=get(handles.slider1,'value');
    set(handles.edit1,'string',num2str(t1));

    t2=get(handles.slider2,'value');
    set(handles.edit2,'string',num2str(t2));

    t3=get(handles.slider3,'value');
    set(handles.edit3,'string',num2str(t3));

    t4=get(handles.slider4,'value');
    set(handles.edit4,'string',num2str(t4));

    t5=get(handles.slider5,'value');
    set(handles.edit5,'string',num2str(t5));

    t6=get(handles.slider6,'value');
    set(handles.edit6,'string',num2str(t6));

    q=[t1,t2,t3,t4,t5,t6];
    T = compForwardKinematics(q);
    
    
    Px=T(1,4,end);
    Py=T(2,4,end);
    Pz=T(3,4,end);

    set(handles.edit7,'string',num2str(Px));
    set(handles.slider7,'value',Px);
    set(handles.edit8,'string',num2str(Py));
    set(handles.slider8,'value',Py);
    set(handles.edit9,'string',num2str(Pz));
    set(handles.slider9,'value',Pz);
   
    set_param([ModelName '/Slider Gain'], 'Gain',num2str(t1))
    set_param([ModelName '/Slider Gain1'], 'Gain',num2str(t2))
    set_param([ModelName '/Slider Gain2'], 'Gain',num2str(t3))
    set_param([ModelName '/Slider Gain3'], 'Gain',num2str(t4))
    set_param([ModelName '/Slider Gain4'], 'Gain',num2str(t5))
    set_param([ModelName '/Slider Gain5'], 'Gain',num2str(t6))

    

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

ModelName = 'final_assembly';
    global var;

    t1=get(handles.slider1,'value');
    set(handles.edit1,'string',num2str(t1));

    t2=get(handles.slider2,'value');
    set(handles.edit2,'string',num2str(t2));

    t3=get(handles.slider3,'value');
    set(handles.edit3,'string',num2str(t3));

    t4=get(handles.slider4,'value');
    set(handles.edit4,'string',num2str(t4));

    t5=get(handles.slider5,'value');
    set(handles.edit5,'string',num2str(t5));

    t6=get(handles.slider6,'value');
    set(handles.edit6,'string',num2str(t6));

    q=[t1,t2,t3,t4,t5,t6];
    T = compForwardKinematics(q);
    
    
    Px=T(1,4,end);
    Py=T(2,4,end);
    Pz=T(3,4,end);

    set(handles.edit7,'string',num2str(Px));
    set(handles.slider7,'value',Px);
    set(handles.edit8,'string',num2str(Py));
    set(handles.slider8,'value',Py);
    set(handles.edit9,'string',num2str(Pz));
    set(handles.slider9,'value',Pz);
   
    set_param([ModelName '/Slider Gain'], 'Gain',num2str(t1))
    set_param([ModelName '/Slider Gain1'], 'Gain',num2str(t2))
    set_param([ModelName '/Slider Gain2'], 'Gain',num2str(t3))
    set_param([ModelName '/Slider Gain3'], 'Gain',num2str(t4))
    set_param([ModelName '/Slider Gain4'], 'Gain',num2str(t5))
    set_param([ModelName '/Slider Gain5'], 'Gain',num2str(t6))

    

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
t1=str2double(get(handles.edit1,'string'));
set(handles.slider1,'value',t1);


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
t2=str2double(get(handles.edit2,'string'));
set(handles.slider2,'value',t2);


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
t3=str2double(get(handles.edit3,'string'));
set(handles.slider3,'value',t3);


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
t4=str2double(get(handles.edit4,'string'));
set(handles.slider4,'value',t4);


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
t5=str2double(get(handles.edit5,'string'));
set(handles.slider5,'value',t5);


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double

t6=str2double(get(handles.edit6,'string'));
set(handles.slider6,'value',t6);

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double

Px=str2double(get(handles.edit7,'string'));
set(handles.slider7,'value',Px);

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
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

Py=str2double(get(handles.edit8,'string'));
set(handles.slider8,'value',Py);

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



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
Pz=str2double(get(handles.edit9,'string'));
set(handles.slider9,'value',Pz);

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ModelName = 'final_assembly';

open_system(ModelName);

set_param(ModelName,'BlockReduction','off');
set_param(ModelName,'StopTime','inf');
set_param(ModelName,'simulationMode','normal');

set_param(ModelName,'StartFcn','1');

set_param(ModelName,'SimulationCommand','start');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ModelName = 'final_assembly';
    global var;
    
    t1=0;
    set(handles.edit1,'string',num2str(t1));
    set(handles.slider1,'value',t1);

    t2=135;
    set(handles.edit2,'string',num2str(t2));
    set(handles.slider2,'value',t2);

    t3=90;
    set(handles.edit3,'string',num2str(t3));
    set(handles.slider3,'value',t3);
    
    t4=180;
    set(handles.edit4,'string',num2str(t4));
    set(handles.slider4,'value',t4);
    
    t5=180;
    set(handles.edit5,'string',num2str(t5));
    set(handles.slider5,'value',t5);

    t6=0;
    set(handles.edit6,'string',num2str(t6));
    set(handles.slider6,'value',t6);
   
    q=[t1,t2,t3,t4,t5,t6];
    T = compForwardKinematics(q);
    
    
    Px=T(1,4,end);
    Py=T(2,4,end);
    Pz=T(3,4,end);


    set(handles.edit7,'string',num2str(Px));
    set(handles.edit8,'string',num2str(Py));
    set(handles.edit9,'string',num2str(Pz));

    set_param([ModelName '/Slider Gain'], 'Gain',num2str(t1))
    set_param([ModelName '/Slider Gain1'], 'Gain',num2str(t2))
    set_param([ModelName '/Slider Gain2'], 'Gain',num2str(t3))
    set_param([ModelName '/Slider Gain3'], 'Gain',num2str(t4))
    set_param([ModelName '/Slider Gain4'], 'Gain',num2str(t5))
    set_param([ModelName '/Slider Gain5'], 'Gain',num2str(t6))

function T = compForwardKinematics(q)

a = [0, 0.2, 0.4, 0.3, 0.1, 0.1]; % Link lengths
alpha = [0, 90, 0, 0, 90, -90]; % Link twists
d = [0.1, 0, 0, 0, 0, 0.1]; % Link offsets
       
% Initialize the transformation matrix
T = zeros(4, 4, 6);
    
% Compute the transformation matrices using Denavit-Hartenberg convention
for i = 1:6
T_i = [cosd(q(i)), -sind(q(i))*cosd(alpha(i)), sind(q(i))*sind(alpha(i)), a(i)*cosd(q(i));
       sind(q(i)), cosd(q(i))*cosd(alpha(i)), -cosd(q(i))*sind(alpha(i)), a(i)*sind(q(i));
        0, sind(alpha(i)), cosd(alpha(i)), d(i);
        0, 0, 0, 1];
        
    if i == 1
        T(:, :, i) = T_i;
        else
        T(:, :, i) = T(:, :, i-1) * T_i;
    end
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ModelName = 'final_assembly';
    global var;
set_param(ModelName,'SimulationCommand','stop');


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

ModelName = 'final_assembly';
    global var;
    
    % Get the values of the desired position
    targetPx=get(handles.slider7,'value');
    set(handles.edit7,'string',num2str(targetPx));
    targetPy=get(handles.slider8,'value');
    set(handles.edit8,'string',num2str(targetPy));
    targetPz=get(handles.slider9,'value');
    set(handles.edit9,'string',num2str(targetPz));
    
    targetPos=[targetPx; targetPy; targetPz;];
    
    % Get the values of the initial joint angles
    t1=get(handles.slider1,'value');
    set(handles.edit1,'string',num2str(t1));

    t2=get(handles.slider2,'value');
    set(handles.edit2,'string',num2str(t2));

    t3=get(handles.slider3,'value');
    set(handles.edit3,'string',num2str(t3));

    t4=get(handles.slider4,'value');
    set(handles.edit4,'string',num2str(t4));

    t5=get(handles.slider5,'value');
    set(handles.edit5,'string',num2str(t5));

    t6=get(handles.slider6,'value');
    set(handles.edit6,'string',num2str(t6));

    q0=[t1,t2,t3,t4,t5,t6];
    
    % Set the maximum number of iterations and the tolerance
    maxIterations = 5000;
    tolerance = 1e-3;

    % Perform the inverse kinematics using iteration
    q=q0;
    iteration=0;
    error=inf;

    while iteration < maxIterations && error > tolerance
        % compute the forward kinematics for the current joint angles 
        T = compForwardKinematics(q);
        pos = T(1:3, 4, end);
    
        error_pos=targetPos-pos;
        % Compute the error norm
        error = norm(error_pos);

        % Check if the error is within the tolerance
        if error <= tolerance
        %if norm(error_pos) < tolerance && norm(error_orient) < tolerance
            disp('Inverse kinematics converged.');
            break;
        end

        % Compute the Jacobian matrix for the current joint angles
        J = compJacobian(q);
        J_pos = J(1:3, :);

        % Compute the joint angle updates using the weighted pseudo-inverse
        delta_q = pinv(J_pos) * (error_pos);

        % Update the joint angles
        q = q + delta_q';
        iteration = iteration + 1;
    end

    % Check if the maximum number of iterations was reached without convergence
    if iteration >= maxIterations
        disp('Inverse kinematics did not converge.');
    else
        disp('Final joint angles:');
        disp(q);
        t1=q(1,1);
        t2=q(1,2);
        t3=q(1,3);
        t4=q(1,4);
        t5=q(1,5);
        t6=q(1,6);
        
        % Update the resulting angles in the interface
        set(handles.edit1,'string',num2str(t1));
        set(handles.slider1,'value',t1);
        set(handles.edit2,'string',num2str(t2));
        set(handles.slider2,'value',t2);
        set(handles.edit3,'string',num2str(t3));
        set(handles.slider3,'value',t3);
        set(handles.edit4,'string',num2str(t4));
        set(handles.slider4,'value',t4);
        set(handles.edit5,'string',num2str(t5));
        set(handles.slider5,'value',t5);
        set(handles.edit6,'string',num2str(t6));
        set(handles.slider6,'value',t6);

        % Actuate the joint angles
        set_param([ModelName '/Slider Gain'], 'Gain',num2str(t1))
        set_param([ModelName '/Slider Gain1'], 'Gain',num2str(t2))
        set_param([ModelName '/Slider Gain2'], 'Gain',num2str(t3))
        set_param([ModelName '/Slider Gain3'], 'Gain',num2str(t4))
        set_param([ModelName '/Slider Gain4'], 'Gain',num2str(t5))
        set_param([ModelName '/Slider Gain5'], 'Gain',num2str(t6))
    end


    
   
    

% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
ModelName = 'final_assembly';
    global var;
    
    % Get the values of the desired position
    targetPx=get(handles.slider7,'value');
    set(handles.edit7,'string',num2str(targetPx));
    targetPy=get(handles.slider8,'value');
    set(handles.edit8,'string',num2str(targetPy));
    targetPz=get(handles.slider9,'value');
    set(handles.edit9,'string',num2str(targetPz));
    
    targetPos=[targetPx; targetPy; targetPz;];
    
    % Get the values of the initial joint angles
    t1=get(handles.slider1,'value');
    set(handles.edit1,'string',num2str(t1));

    t2=get(handles.slider2,'value');
    set(handles.edit2,'string',num2str(t2));

    t3=get(handles.slider3,'value');
    set(handles.edit3,'string',num2str(t3));

    t4=get(handles.slider4,'value');
    set(handles.edit4,'string',num2str(t4));

    t5=get(handles.slider5,'value');
    set(handles.edit5,'string',num2str(t5));

    t6=get(handles.slider6,'value');
    set(handles.edit6,'string',num2str(t6));

    q0=[t1,t2,t3,t4,t5,t6];
    
    % Set the maximum number of iterations and the tolerance
    maxIterations = 5000;
    tolerance = 1e-3;

    % Perform the inverse kinematics using iteration
    q=q0;
    iteration=0;
    error=inf;

    while iteration < maxIterations && error > tolerance
        % compute the forward kinematics for the current joint angles 
        T = compForwardKinematics(q);
        pos = T(1:3, 4, end);
    
        error_pos=targetPos-pos;
        % Compute the error norm
        error = norm(error_pos);

        % Check if the error is within the tolerance
        if error <= tolerance
        %if norm(error_pos) < tolerance && norm(error_orient) < tolerance
            disp('Inverse kinematics converged.');
            break;
        end

        % Compute the Jacobian matrix for the current joint angles
        J = compJacobian(q);
        J_pos = J(1:3, :);

        % Compute the joint angle updates using the weighted pseudo-inverse
        delta_q = pinv(J_pos) * (error_pos);

        % Update the joint angles
        q = q + delta_q';
        iteration = iteration + 1;
    end

    % Check if the maximum number of iterations was reached without convergence
    if iteration >= maxIterations
        disp('Inverse kinematics did not converge.');
    else
        disp('Final joint angles:');
        disp(q);
        t1=q(1,1);
        t2=q(1,2);
        t3=q(1,3);
        t4=q(1,4);
        t5=q(1,5);
        t6=q(1,6);
        
        % Update the resulting angles in the interface
        set(handles.edit1,'string',num2str(t1));
        set(handles.edit2,'string',num2str(t2));
        set(handles.edit3,'string',num2str(t3));
        set(handles.edit4,'string',num2str(t4));
        set(handles.edit5,'string',num2str(t5));
        set(handles.edit6,'string',num2str(t6));

        % Actuate the joint angles
        set_param([ModelName '/Slider Gain'], 'Gain',num2str(t1))
        set_param([ModelName '/Slider Gain1'], 'Gain',num2str(t2))
        set_param([ModelName '/Slider Gain2'], 'Gain',num2str(t3))
        set_param([ModelName '/Slider Gain3'], 'Gain',num2str(t4))
        set_param([ModelName '/Slider Gain4'], 'Gain',num2str(t5))
        set_param([ModelName '/Slider Gain5'], 'Gain',num2str(t6))
    end


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

ModelName = 'final_assembly';
    global var;
    
    % Get the values of the desired position
    targetPx=get(handles.slider7,'value');
    set(handles.edit7,'string',num2str(targetPx));
    targetPy=get(handles.slider8,'value');
    set(handles.edit8,'string',num2str(targetPy));
    targetPz=get(handles.slider9,'value');
    set(handles.edit9,'string',num2str(targetPz));
    
    targetPos=[targetPx; targetPy; targetPz;];
    
    % Get the values of the initial joint angles
    t1=get(handles.slider1,'value');
    set(handles.edit1,'string',num2str(t1));

    t2=get(handles.slider2,'value');
    set(handles.edit2,'string',num2str(t2));

    t3=get(handles.slider3,'value');
    set(handles.edit3,'string',num2str(t3));

    t4=get(handles.slider4,'value');
    set(handles.edit4,'string',num2str(t4));

    t5=get(handles.slider5,'value');
    set(handles.edit5,'string',num2str(t5));

    t6=get(handles.slider6,'value');
    set(handles.edit6,'string',num2str(t6));

    q0=[t1,t2,t3,t4,t5,t6];
    
    % Set the maximum number of iterations and the tolerance
    maxIterations = 5000;
    tolerance = 1e-3;

    % Perform the inverse kinematics using iteration
    q=q0;
    iteration=0;
    error=inf;

    while iteration < maxIterations && error > tolerance
        % compute the forward kinematics for the current joint angles 
        T = compForwardKinematics(q);
        pos = T(1:3, 4, end);
    
        error_pos=targetPos-pos;
        % Compute the error norm
        error = norm(error_pos);

        % Check if the error is within the tolerance
        if error <= tolerance
        %if norm(error_pos) < tolerance && norm(error_orient) < tolerance
            disp('Inverse kinematics converged.');
            break;
        end

        % Compute the Jacobian matrix for the current joint angles
        J = compJacobian(q);
        J_pos = J(1:3, :);

        % Compute the joint angle updates using the weighted pseudo-inverse
        delta_q = pinv(J_pos) * (error_pos);

        % Update the joint angles
        q = q + delta_q';
        iteration = iteration + 1;
    end

    % Check if the maximum number of iterations was reached without convergence
    if iteration >= maxIterations
        disp('Inverse kinematics did not converge.');
    else
        disp('Final joint angles:');
        disp(q);
        t1=q(1,1);
        t2=q(1,2);
        t3=q(1,3);
        t4=q(1,4);
        t5=q(1,5);
        t6=q(1,6);
        
        % Update the resulting angles in the interface
        set(handles.edit1,'string',num2str(t1));
        set(handles.edit2,'string',num2str(t2));
        set(handles.edit3,'string',num2str(t3));
        set(handles.edit4,'string',num2str(t4));
        set(handles.edit5,'string',num2str(t5));
        set(handles.edit6,'string',num2str(t6));

        % Actuate the joint angles
        set_param([ModelName '/Slider Gain'], 'Gain',num2str(t1))
        set_param([ModelName '/Slider Gain1'], 'Gain',num2str(t2))
        set_param([ModelName '/Slider Gain2'], 'Gain',num2str(t3))
        set_param([ModelName '/Slider Gain3'], 'Gain',num2str(t4))
        set_param([ModelName '/Slider Gain4'], 'Gain',num2str(t5))
        set_param([ModelName '/Slider Gain5'], 'Gain',num2str(t6))
    end


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function J = compJacobian(q)
    % q: Joint angles (1x6 vector)
    
    
    
    % Initialize the Jacobian matrix
    J = zeros(6, 6);
    
    % Compute the forward kinematics to obtain the transformation matrices
    T = compForwardKinematics(q);
    
    % Compute the position of the end-effector
    pos = T(1:3, 4, end);
    
    % Compute the z-axes and positions of the joint frames
    z = zeros(3, 6);
    p = zeros(3, 6);
    
    for i = 1:6
        z(:, i) = T(1:3, 3, i);
        p(:, i) = T(1:3, 4, i);
    end
    
    % Compute the Jacobian matrix
    for i = 1:6
        % Compute the cross product of z_i and (p_n - p_i)
        J(1:3, i) = cross(z(:, i), (pos - p(:, i)));
        
        % Assign the z-axis as the rotational component of the Jacobian
        J(4:6, i) = z(:, i);
    end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ModelName = 'final_assembly';
    global var;

    t1=str2double(get(handles.edit1,'string'));
    
    t2=str2double(get(handles.edit2,'string'));

    t3=str2double(get(handles.edit3,'string'));

    t4=str2double(get(handles.edit4,'string'));

    t5=str2double(get(handles.edit5,'string'));

    t6=str2double(get(handles.edit6,'string'));
    set(handles.slider6,'value',t6);
    

    q=[t1,t2,t3,t4,t5,t6];
    T = compForwardKinematics(q);
    
    
    Px=T(1,4,end);
    Py=T(2,4,end);
    Pz=T(3,4,end);

    set(handles.edit7,'string',num2str(Px));
    set(handles.slider7,'value',Px);
    set(handles.edit8,'string',num2str(Py));
    set(handles.slider8,'value',Py);
    set(handles.edit9,'string',num2str(Pz));
    set(handles.slider9,'value',Pz);

    set_param([ModelName '/Slider Gain'], 'Gain',num2str(t1))
    set_param([ModelName '/Slider Gain1'], 'Gain',num2str(t2))
    set_param([ModelName '/Slider Gain2'], 'Gain',num2str(t3))
    set_param([ModelName '/Slider Gain3'], 'Gain',num2str(t4))
    set_param([ModelName '/Slider Gain4'], 'Gain',num2str(t5))
    set_param([ModelName '/Slider Gain5'], 'Gain',num2str(t6))


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ModelName = 'final_assembly';
    global var;
    
    % Get the values of the desired position
    targetPx=str2double(get(handles.edit7,'string'));
    set(handles.slider7,'value',targetPx);
    targetPy=str2double(get(handles.edit8,'string'));
    set(handles.slider8,'value',targetPy);
    targetPz=str2double(get(handles.edit9,'string'));
    set(handles.slider9,'value',targetPz);
    
    
    targetPos=[targetPx; targetPy; targetPz;];
    
    % Get the values of the initial joint angles
    t1=get(handles.slider1,'value');
    set(handles.edit1,'string',num2str(t1));

    t2=get(handles.slider2,'value');
    set(handles.edit2,'string',num2str(t2));

    t3=get(handles.slider3,'value');
    set(handles.edit3,'string',num2str(t3));

    t4=get(handles.slider4,'value');
    set(handles.edit4,'string',num2str(t4));

    t5=get(handles.slider5,'value');
    set(handles.edit5,'string',num2str(t5));

    t6=get(handles.slider6,'value');
    set(handles.edit6,'string',num2str(t6));

    q0=[t1,t2,t3,t4,t5,t6];
    
    % Set the maximum number of iterations and the tolerance
    maxIterations = 5000;
    tolerance = 1e-3;

    % Perform the inverse kinematics using iteration
    q=q0;
    iteration=0;
    error=inf;

    while iteration < maxIterations && error > tolerance
        % compute the forward kinematics for the current joint angles 
        T = compForwardKinematics(q);
        pos = T(1:3, 4, end);
    
        error_pos=targetPos-pos;
        % Compute the error norm
        error = norm(error_pos);

        % Check if the error is within the tolerance
        if error <= tolerance
        %if norm(error_pos) < tolerance && norm(error_orient) < tolerance
            disp('Inverse kinematics converged.');
            break;
        end

        % Compute the Jacobian matrix for the current joint angles
        J = compJacobian(q);
        J_pos = J(1:3, :);

        % Compute the joint angle updates using the weighted pseudo-inverse
        delta_q = pinv(J_pos) * (error_pos);

        % Update the joint angles
        q = q + delta_q';
        iteration = iteration + 1;
    end

    % Check if the maximum number of iterations was reached without convergence
    if iteration >= maxIterations
        disp('Inverse kinematics did not converge.');
    else
        disp('Final joint angles:');
        disp(q);
        t1=q(1,1);
        t2=q(1,2);
        t3=q(1,3);
        t4=q(1,4);
        t5=q(1,5);
        t6=q(1,6);
        
        % Update the resulting angles in the interface
        set(handles.edit1,'string',num2str(t1));
        set(handles.edit2,'string',num2str(t2));
        set(handles.edit3,'string',num2str(t3));
        set(handles.edit4,'string',num2str(t4));
        set(handles.edit5,'string',num2str(t5));
        set(handles.edit6,'string',num2str(t6));

        % Actuate the joint angles
        set_param([ModelName '/Slider Gain'], 'Gain',num2str(t1))
        set_param([ModelName '/Slider Gain1'], 'Gain',num2str(t2))
        set_param([ModelName '/Slider Gain2'], 'Gain',num2str(t3))
        set_param([ModelName '/Slider Gain3'], 'Gain',num2str(t4))
        set_param([ModelName '/Slider Gain4'], 'Gain',num2str(t5))
        set_param([ModelName '/Slider Gain5'], 'Gain',num2str(t6))
    end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
