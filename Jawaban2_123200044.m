function varargout = Jawaban2_123200044(varargin)
% JAWABAN2_123200044 MATLAB code for Jawaban2_123200044.fig
%      JAWABAN2_123200044, by itself, creates a new JAWABAN2_123200044 or raises the existing
%      singleton*.
%
%      H = JAWABAN2_123200044 returns the handle to a new JAWABAN2_123200044 or the handle to
%      the existing singleton*.
%
%      JAWABAN2_123200044('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JAWABAN2_123200044.M with the given input arguments.
%
%      JAWABAN2_123200044('Property','Value',...) creates a new JAWABAN2_123200044 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Jawaban2_123200044_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Jawaban2_123200044_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Jawaban2_123200044

% Last Modified by GUIDE v2.5 18-May-2022 14:20:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Jawaban2_123200044_OpeningFcn, ...
                   'gui_OutputFcn',  @Jawaban2_123200044_OutputFcn, ...
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


% --- Executes just before Jawaban2_123200044 is made visible.
function Jawaban2_123200044_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Jawaban2_123200044 (see VARARGIN)

% Choose default command line output for Jawaban2_123200044
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Jawaban2_123200044 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Jawaban2_123200044_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tampil_044.
function tampil_044_Callback(hObject, eventdata, handles)
% hObject    handle to tampil_044 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = xlsread('Dataset Hostel Jepang.xlsx','B2:P50');
set(handles.uitable1_044,'Data',data);



% --- Executes on button press in proses_044.
function proses_044_Callback(hObject, eventdata, handles)
% hObject    handle to proses_044 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = xlsread('Dataset Hostel Jepang.xlsx','B2:P50');
k = [1 1 1 1];
w = [1 4 2 3];

[m, n] = size(x);

R = zeros(m,n);

for j=1:n
    if k(j)==1
        R(:,j)=x(:,j)./max(x(:,j));
    else
        R(:,j)=min(x(:,j))./x(:,j);
    end
end

for i=1:m
    V(i) = sum(w.*R(i,:));
end

[~,rowRank] = sort(V,'descend');

opts = detectImportOptions('Dataset Hostel Jepang.xlsx');
opts.SelectedVariableNames = (1);
nama = readmatrix('Dataset Hostel Jepang.xlsx',opts);
hostel = nama(1:20);

set(handles.uitable2_044,'Data',hostel(rowRank));
