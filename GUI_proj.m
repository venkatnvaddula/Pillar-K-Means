function varargout = GUI_proj(varargin)
% GUI_PROJ MATLAB code for GUI_proj.fig
%      GUI_PROJ, by itself, creates a new GUI_PROJ or raises the existing
%      singleton*.
%
%      H = GUI_PROJ returns the handle to a new GUI_PROJ or the handle to
%      the existing singleton*.
%
%      GUI_PROJ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_PROJ.M with the given input arguments.
%
%      GUI_PROJ('Property','Value',...) creates a new GUI_PROJ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_proj_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_proj_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_proj

% Last Modified by GUIDE v2.5 28-Apr-2016 16:55:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_proj_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_proj_OutputFcn, ...
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


% --- Executes just before GUI_proj is made visible.
function GUI_proj_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_proj (see VARARGIN)

% Choose default command line output for GUI_proj
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_proj wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_proj_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in p1.
function p1_Callback(hObject, eventdata, handles)
% hObject    handle to p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im a
a = 4;
[img path] = uigetfile('/Users/Anish/Desktop/ProjectWithGUI/*.jpg','select the image');
image = imread(img);
[img1] = resizeImg(image);
imwrite(img1,'OriginalAuto.jpg');
axes(handles.axes1);
im = img1;
imshow(im);

% --- Executes on button press in p2.
function p2_Callback(hObject, eventdata, handles)
% hObject    handle to p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im a 
img = im;
a = 1;
[img1] = k_means(img);
img1 = resizeImg(img1);
imwrite(img1,'K-meansAuto.jpg');
axes(handles.axes1);
imshow(img1);


% --- Executes on button press in p3.
function p3_Callback(hObject, eventdata, handles)
% hObject    handle to p3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im a
img = im;
a =2;
[img1] = c_means(img);
img1 = resizeImg(img1);
imwrite(img1,'C-meansAuto.jpg');
axes(handles.axes1);
imshow(img1);


% --- Executes on button press in p4.
function p4_Callback(hObject, eventdata, handles)
% hObject    handle to p4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im a
img = im;
a = 3;
[img1] = pillar_k_means(img);
img1 = resizeImg(img1);
imwrite(img1,'PillarAuto.jpg');
axes(handles.axes1);
imshow(img1);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
abs_diff;
close GUI_proj;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
g = getframe(handles.axes1);
image = frame2im(g);
imwrite(image, 'Image.jpg')
img = imread('Image.jpg');
k = size(img);
%fprintf('%f',k);
img = resizeImg(img);
k = size(img);
%fprintf('%f',k);
%fprintf('%f',a);
outputImg = imread('Image.jpg');
if(a == 4)
    imwrite(outputImg,'Original.jpg');
elseif (a == 1)
    imwrite(outputImg,'K-Means.jpg');
elseif (a == 2)
    imwrite(outputImg,'C-Means.jpg');
elseif (a == 3)
    imwrite(outputImg,'Pillar.jpg');
end