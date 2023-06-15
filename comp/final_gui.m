function varargout = final_gui(varargin)
% FINAL_GUI MATLAB code for final_gui.fig
%      FINAL_GUI, by itself, creates a new FINAL_GUI or raises the existing
%      singleton*.
%
%      H = FINAL_GUI returns the handle to a new FINAL_GUI or the handle to
%      the existing singleton*.
%
%      FINAL_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_GUI.M with the given input arguments.
%
%      FINAL_GUI('Property','Value',...) creates a new FINAL_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final_gui

% Last Modified by GUIDE v2.5 30-Apr-2014 21:15:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @final_gui_OutputFcn, ...
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


% --- Executes just before final_gui is made visible.
function final_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final_gui (see VARARGIN)

% Choose default command line output for final_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.axes1,'Visible','off');
set(handles.axes2,'Visible','off');
set(handles.axes3,'Visible','off');
set(handles.axes4,'Visible','off');
set(handles.axes5,'Visible','off');
set(handles.axes6,'Visible','off');
set(handles.axes7,'Visible','off');
set(handles.axes8,'Visible','off');
set(handles.axes9,'Visible','off');
set(handles.axes10,'Visible','off');

% UIWAIT makes final_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s1 = handles.s1;
s2 = handles.s2;
c11 = handles.i1;
c12 = handles.i2;
cnt = 0;
s1_array = s1(:);
idct_val_1 = c11;
h = waitbar(0,'Please wait....Embedding the First Share');
for m1=8:8:768
   waitbar(m1/768)
    for n1=8:8:1024
        k1=s1_array(cnt+1);
        if ((cnt+1)>=length(s1_array))
            break
        end
        k2=s1_array(cnt+2);
        if ((cnt+2)>=length(s1_array))
            break
        end
        k3=s1_array(cnt+3);
        if ((cnt+3)>=length(s1_array))
            break
        end
        cnt = cnt + 3;
        b=c11(m1-7:m1,n1-7:n1,1);
        dct_out=dct2(b);
        q1 = dct_out(1:4,1:4);
        q2 = dct_out(5:8,1:4);
        q3 = dct_out(1:4,5:8);
        q4 = dct_out(5:8,5:8);
        
        if(k1==true)
            if(q2(4,3) == q2(4,4))
                q2(4,3) = q2(4,4)+0.1;
            elseif(q2(4,3) > q2(4,4))
            else
                tmp=q2(4,3);
                q2(4,3) = q2(4,4);
                q2(4,4) = tmp;
            end
        else
            if(q2(4,3) == q2(4,4))
                q2(4,4) = q2(4,3)+0.1;
            elseif(q2(4,3) < q2(4,4))
            else
                tmp=q2(4,3);
                q2(4,3) = q2(4,4);
                q2(4,4) = tmp;
            end
        end
        if(k2==true)
            if(q3(4,3) == q3(4,4))
                q3(4,3) = q3(4,4)+0.1;
            elseif(q3(4,3) > q3(4,4))
            else
                tmp=q3(4,3);
                q3(4,3) = q3(4,4);
                q3(4,4) = tmp;
            end
        else
            if(q3(4,3) == q3(4,4))
                q3(4,4) = q3(4,3)+0.1;
            elseif(q3(4,3) < q3(4,4))
            else
                tmp=q3(4,3);
                q3(4,3) = q3(4,4);
                q3(4,4) = tmp;
            end
        end
        if(k3==true)
            if(q4(4,3) == q4(4,4))
                q4(4,3) = q4(4,4)+0.1;
            elseif(q4(4,3) > q4(4,4))
            else
                tmp=q4(4,3);
                q4(4,3) = q4(4,4);
                q4(4,4) = tmp;
            end
        else
            if(q4(4,3) == q4(4,4))
                q4(4,4) = q4(4,3)+0.1;
            elseif(q4(4,3) < q4(4,4))
            else
                tmp=q4(4,3);
                q4(4,3) = q4(4,4);
                q4(4,4) = tmp;
            end
        end
        q=[q1,q3;q2,q4];
        idct_val_1(m1-7:m1,n1-7:n1,1)=idct2(q);
    end
end
close(h)
axes(handles.axes6);imshow(idct_val_1,[]);zoom on;

cnt = 0;
s2_array = s2(:);
idct_val_2 = c12;
h = waitbar(0,'Please wait....Embedding the second Share');
for m1=8:8:768
   waitbar(m1/768) 
    for n1=8:8:1024
        k1=s2_array(cnt+1);
        if ((cnt+1)>=length(s2_array))
            break
        end
        k2=s2_array(cnt+2);
        if ((cnt+2)>=length(s2_array))
            break
        end
        k3=s2_array(cnt+3);
        if ((cnt+3)>=length(s2_array))
            break
        end
        cnt = cnt + 3;
        b=c12(m1-7:m1,n1-7:n1,1);
        dct_out=dct2(b);
        q1 = dct_out(1:4,1:4);
        q2 = dct_out(5:8,1:4);
        q3 = dct_out(1:4,5:8);
        q4 = dct_out(5:8,5:8);
        
        if(k1==true)
            if(q2(4,3) == q2(4,4))
                q2(4,3) = q2(4,4)+0.1;
            elseif(q2(4,3) > q2(4,4))
            else
                tmp=q2(4,3);
                q2(4,3) = q2(4,4);
                q2(4,4) = tmp;
            end
        else
            if(q2(4,3) == q2(4,4))
                q2(4,4) = q2(4,3)+0.1;
            elseif(q2(4,3) < q2(4,4))
            else
                tmp=q2(4,3);
                q2(4,3) = q2(4,4);
                q2(4,4) = tmp;
            end
        end
        if(k2==true)
            if(q3(4,3) == q3(4,4))
                q3(4,3) = q3(4,4)+0.1;
            elseif(q3(4,3) > q3(4,4))
            else
                tmp=q3(4,3);
                q3(4,3) = q3(4,4);
                q3(4,4) = tmp;
            end
        else
            if(q3(4,3) == q3(4,4))
                q3(4,4) = q3(4,3)+0.1;
            elseif(q3(4,3) < q3(4,4))
            else
                tmp=q3(4,3);
                q3(4,3) = q3(4,4);
                q3(4,4) = tmp;
            end
        end
        if(k3==true)
            if(q4(4,3) == q4(4,4))
                q4(4,3) = q4(4,4)+0.1;
            elseif(q4(4,3) > q4(4,4))
            else
                tmp=q4(4,3);
                q4(4,3) = q4(4,4);
                q4(4,4) = tmp;
            end
        else
            if(q4(4,3) == q4(4,4))
                q4(4,4) = q4(4,3)+0.1;
            elseif(q4(4,3) < q4(4,4))
            else
                tmp=q4(4,3);
                q4(4,3) = q4(4,4);
                q4(4,4) = tmp;
            end
        end
        q=[q1,q3;q2,q4];
        idct_val_2(m1-7:m1,n1-7:n1,1)=idct2(q);
    end
end
close(h)
axes(handles.axes7);imshow(idct_val_2,[]);zoom on;
handles.idct_val_1 = idct_val_1;
handles.idct_val_2 = idct_val_2;
guidata(hObject,handles);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
array_out_1 = handles.array_out_1;
array_out_2 = handles.array_out_2;
s=[true,false;true,false];
for m=2:2:74
    for n=2:2:100
        b=array_out_2(m-1:m,n-1:n);
        b1=xor(b,s);
        s1(m-1:m,n-1:n)=b1;
    end
end
s2=~s1;
axes(handles.axes10);imshow(s2);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
idct_val_1 = handles.idct_val_1;
idct_val_2 = handles.idct_val_2;

cnt = 0;
array_out_1 = zeros(1,7400);
h = waitbar(0,'Please wait....Retriving the First Share');
for m1=8:8:768
    waitbar(m1/768)
    for n1=8:8:1024
        b=idct_val_1(m1-7:m1,n1-7:n1,1);
        dct_out=dct2(b);
        q1 = dct_out(1:4,1:4);
        q2 = dct_out(5:8,1:4);
        q3 = dct_out(1:4,5:8);
        q4 = dct_out(5:8,5:8);
        
        if (cnt < 7400)
        if(q2(4,3) > q2(4,4))
            cnt = cnt + 1;
            array_out_1(cnt) = 1;
        else
            cnt = cnt + 1;
            array_out_1(cnt) = 0;
        end
        if(q3(4,3) > q3(4,4))
            cnt = cnt + 1;
            array_out_1(cnt) = 1;
        else
            cnt = cnt + 1;
            array_out_1(cnt) = 0;
        end
        if(q4(4,3) > q4(4,4))
            cnt = cnt + 1;
            array_out_1(cnt) = 1;
        else
            cnt = cnt + 1;
            array_out_1(cnt) = 0;
        end
        end
    end
end
array_out_1 = reshape(array_out_1(1:end-1),74,100);
close(h)

cnt = 0;
array_out_2 = zeros(1,7400);
h = waitbar(0,'Please wait....Retriving the second Share');
for m1=8:8:768
    waitbar(m1/768)
    for n1=8:8:1024
        b=idct_val_2(m1-7:m1,n1-7:n1,1);
        dct_out=dct2(b);
        q1 = dct_out(1:4,1:4);
        q2 = dct_out(5:8,1:4);
        q3 = dct_out(1:4,5:8);
        q4 = dct_out(5:8,5:8);
       
        if (cnt < 7400)
        if(q2(4,3) > q2(4,4))
            cnt = cnt + 1;
            array_out_2(cnt) = 1;
        else
            cnt = cnt + 1;
            array_out_2(cnt) = 0;
        end
        if(q3(4,3) > q3(4,4))
            cnt = cnt + 1;
            array_out_2(cnt) = 1;
        else
            cnt = cnt + 1;
            array_out_2(cnt) = 0;
        end
        if(q4(4,3) > q4(4,4))
            cnt = cnt + 1;
            array_out_2(cnt) = 1;
        else
            cnt = cnt + 1;
            array_out_2(cnt) = 0;
        end
        end
    end
end
array_out_2 = reshape(array_out_2(1:end-1),74,100);
close(h)

axes(handles.axes8);imshow(array_out_1);
axes(handles.axes9);imshow(array_out_2);
handles.array_out_1 = array_out_1;
handles.array_out_2 = array_out_2;
guidata(hObject,handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y=handles.y;
s=[true,false;true,false];
for m=2:2:74
    for n=2:2:100
        b=y(m-1:m,n-1:n);
        b1=xor(b,s);
        s1(m-1:m,n-1:n)=b1;
    end
end
s2=~s1;
axes(handles.axes4);imshow(s1);zoom on;
axes(handles.axes5);imshow(s2);zoom on;
handles.s1 = s1;
handles.s2 = s2;
guidata(hObject,handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
[f,p]=uigetfile('*.*','select Secret Image');
fp = [p,f];
i=imresize(imread(fp),[74,100]);
u=rgb2gray(i);
y=im2bw(u,.7);
axes(handles.axes3);imshow(y);zoom on;
handles.y = y;
guidata(hObject,handles);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc

[f,p]=uigetfile('*.*','Select Image-1');
fp = [p,f];
i1 = rgb2gray(imresize(im2double(imread(fp)),[768,1024]));
axes(handles.axes1);imshow(i1);zoom on;
handles.i1 = i1;
guidata(hObject,handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc
[f,p]=uigetfile('*.*','select Image-2');
fp = [p,f];
i2 = rgb2gray(imresize(im2double(imread(fp)),[768,1024]));
axes(handles.axes2);imshow(i2);zoom on;
handles.i2 = i2;
guidata(hObject,handles);