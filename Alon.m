function varargout = Alon(varargin)
% ALON MATLAB code for Alon.fig
%      ALON, by itself, creates a new ALON or raises the existing
%      singleton*.
%
%      H = ALON returns the handle to a new ALON or the handle to
%      the existing singleton*.
%
%      ALON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ALON.M with the given input arguments.
%
%      ALON('Property','Value',...) creates a new ALON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Alon_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Alon_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Alon

% Last Modified by GUIDE v2.5 24-May-2017 08:40:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Alon_OpeningFcn, ...
                   'gui_OutputFcn',  @Alon_OutputFcn, ...
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


% --- Executes just before Alon is made visible.
function Alon_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Alon (see VARARGIN)

% Choose default command line output for Alon
handles.output = hObject;
logo= imread('./assets/alon-logo.png');
axes(handles.logo)
imshow(logo);

axes(handles.depthgraph)
title('Deph vs time');
grid on;    
xlabel('Time [ms]');
ylabel('Depth [m]');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Alon wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Alon_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%varargout{1} = handles.output;


% --- Executes on button press in stopbutton.
function stopbutton_Callback(hObject, eventdata, handles)
% hObject    handle to stopbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;
startop(arduino,0)


% --- Executes on button press in measurementsButton.
function measurementsButton_Callback(hObject, eventdata, handles)
% hObject    handle to measurementsButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;
[d,t]=read1000(arduino);
axes(handles.depthgraph)
title(handles.depthgraph,'Deph vs time')
grid on;    
xlabel('Time [ms]');
ylabel('Depth [m]');

plot(handles.depthgraph,d,t)



% --- Executes on button press in pictureButton.
function pictureButton_Callback(hObject, eventdata, handles)
% hObject    handle to pictureButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;
write(arduino, 'P');
img= imread(read(arduino));
axes(handles.picture)
imshow(img);



% --- Executes on button press in leftButton.
function leftButton_Callback(hObject, eventdata, handles)
% hObject    handle to leftButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;
write(arduino, 'L');


% --- Executes on button press in rightButton.
function rightButton_Callback(hObject, eventdata, handles)
% hObject    handle to rightButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;
write(arduino, 'R');


% --- Executes on button press in nonstopButton.
function nonstopButton_Callback(hObject, eventdata, handles)
% hObject    handle to nonstopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;
write(arduino, 'NS');
img = imread(read(arduino));
axes(handles.picture)
imshow(img);



function serialPort_Callback(hObject, eventdata, handles)
% hObject    handle to serialPort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of serialPort as text
%        str2double(get(hObject,'String')) returns contents of serialPort as a double


% --- Executes during object creation, after setting all properties.
function serialPort_CreateFcn(hObject, eventdata, handles)
% hObject    handle to serialPort (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global arduino;
COMPort=get(handles.serialPort,'String');
arduino = oSPort(strcat('COM',COMPort));
