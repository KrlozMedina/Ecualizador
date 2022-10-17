
function varargout = ecugui(varargin)
% ECUGUI MATLAB code for ecugui.fig
%      ECUGUI, by itself, creates a new ECUGUI or raises the existing
%      singleton*.
%
%      H = ECUGUI returns the handle to a new ECUGUI or the handle to
%      the existing singleton*.
%
%      ECUGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ECUGUI.M with the given input arguments.
%
%      ECUGUI('Property','Value',...) creates a new ECUGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ecugui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ecugui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ecugui

% Last Modified by GUIDE v2.5 07-Aug-2018 12:39:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ecugui_OpeningFcn, ...
                   'gui_OutputFcn',  @ecugui_OutputFcn, ...
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


% --- Executes just before ecugui is made visible.
function ecugui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ecugui (see VARARGIN)

% Choose default command line output for ecugui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ecugui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global bp
find_system('Name','ecusimu');
open_system('ecusimu');
set_param(gcs,'SimulationCommand','Stop');

[a,map]=imread('play.jpg');
[r,c,d]=size(a);
x=ceil(r/80);
y=ceil(c/80);
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.play,'CData',g);

bp= 0;

[a,map]=imread('Stop.jpg');
    [r,c,d]=size(a);
    x=ceil(r/80);
    y=ceil(c/80);
    g=a(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(handles.stop,'CData',g);
    
set_param('ecusimu/Constant','Value','1');
set_param('ecusimu/Constant1','Value','1');

set_param('ecusimu/Gain','Gain','1');
set_param('ecusimu/Gain1','Gain','1');
set_param('ecusimu/Gain2','Gain','1');
set_param('ecusimu/Gain3','Gain','1');
set_param('ecusimu/Gain4','Gain','1');
set_param('ecusimu/Gain5','Gain','1');
set_param('ecusimu/Gain6','Gain','1');

set(handles.ft1,'String','16 - 60Hz');
set(handles.ft2,'String','60 - 250Hz');
set(handles.ft3,'String','250 - 2kHz');
set(handles.ft4,'String','2k - 4kHz');
set(handles.ft5,'String','4k - 6kHz');
set(handles.ft6,'String','6k - 16kHz');

set(handles.t1,'String','Subbass');
set(handles.t2,'String','Bass');
set(handles.t3,'String','Midbass');
set(handles.t4,'String','Middle high');
set(handles.t5,'String','Presence');
set(handles.t6,'String','Brilliant'); 
set(handles.avisos,'String','Song');

ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
bg = imread('fondo.png'); imagesc(bg);
set(ah,'handlevisibility','off','visible','off')
uistack(ah, 'bottom');

[a,map]=imread('pop.jpg');
    [r,c,d]=size(a);
    x=ceil(r/80);
    y=ceil(c/80);
    g=a(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(handles.pop,'CData',g);
    
    [a,map]=imread('reggae.jpg');
    [r,c,d]=size(a);
    x=ceil(r/80);
    y=ceil(c/80);
    g=a(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(handles.reggae,'CData',g);
    
    [a,map]=imread('rock.jpg');
    [r,c,d]=size(a);
    x=ceil(r/80);
    y=ceil(c/80);
    g=a(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(handles.rock,'CData',g);
    
    [a,map]=imread('bass.jpg');
    [r,c,d]=size(a);
    x=ceil(r/80);
    y=ceil(c/80);
    g=a(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(handles.fullbass,'CData',g);
    
    [a,map]=imread('person.jpg');
    [r,c,d]=size(a);
    x=ceil(r/80);
    y=ceil(c/80);
    g=a(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(handles.personalized,'CData',g);

% --- Outputs from this function are returned to the command line.
function varargout = ecugui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

  


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ruta nombre
if (hObject==handles.uno)
    set_param('ecusimu/Constant','Value','1');
    set(handles.avisos,'String','Song');
    set_param('ecusimu/From Multimedia File','FileName',fullfile(ruta,nombre));
elseif(hObject==handles.dos)
    set_param('ecusimu/Constant','Value','0');
    set(handles.avisos,'String','Voice');
end


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bp
if (bp == 0 )
    [a,map]=imread('pause.jpg');
    [r,c,d]=size(a);
    x=ceil(r/80);
    y=ceil(c/80);
    g=a(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(handles.play,'CData',g);
    set_param(gcs,'SimulationCommand','Start');
     set(handles.avisos,'String','Play');
    bp = 1;
elseif (bp == 1)
    [a,map]=imread('play.jpg');
    [r,c,d]=size(a);
    x=ceil(r/80);
    y=ceil(c/80);
    g=a(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(handles.play,'CData',g);
    set_param(gcs,'SimulationCommand','Pause');
     set(handles.avisos,'String','Pause');
    bp = 2;
elseif (bp == 2)
    [a,map]=imread('Pause.jpg');
    [r,c,d]=size(a);
    x=ceil(r/80);
    y=ceil(c/80);
    g=a(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(handles.play,'CData',g);
    set_param(gcs,'SimulationCommand','Continue');
     set(handles.avisos,'String','play');
    bp = 1;
end


% --------------------------------------------------------------------
function Fsong_Callback(hObject, eventdata, handles)
% hObject    handle to Fsong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global nombre ruta
[nombre,ruta] = uigetfile('*.wav','Seleccion la cancion a procesar');
set_param('ecusimu/From Multimedia File','FileName',fullfile(ruta,nombre));  


% --------------------------------------------------------------------



% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global bp
[a,map]=imread('Stop.jpg');
    [r,c,d]=size(a);
    x=ceil(r/80);
    y=ceil(c/80);
    g=a(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(handles.stop,'CData',g);
    set_param(gcs,'SimulationCommand','Stop');
     set(handles.avisos,'String','Stop');
    
    [a,map]=imread('play.jpg');
    [r,c,d]=size(a);
    x=ceil(r/80);
    y=ceil(c/80);
    g=a(1:x:end,1:y:end,:);
    g(g==255)=5.5*255;
    set(handles.play,'CData',g);
    bp = 0;


% --- Executes on slider movement.
function ssb_Callback(hObject, eventdata, handles)
% hObject    handle to ssb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ssubb
ssubb=get(hObject,'Value');
ssubb=2*ssubb;
set(handles.st1,'String',ssubb);
set_param('ecusimu/Gain','Gain',num2str(ssubb));

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider



% --- Executes during object creation, after setting all properties.
function ssb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ssb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sb_Callback(hObject, eventdata, handles)
% hObject    handle to sb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbajo
sbajo=get(hObject,'Value');
sbajo=2*sbajo;
set(handles.st2,'String',sbajo);
set_param('ecusimu/Gain1','Gain',num2str(sbajo));

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function bm_Callback(hObject, eventdata, handles)
% hObject    handle to bm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sbmedio
sbmedio=get(hObject,'Value');
sbmedio=2*sbmedio;
set(handles.st3,'String',sbmedio);
set_param('ecusimu/Gain2','Gain',num2str(sbmedio));

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function bm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ma_Callback(hObject, eventdata, handles)
% hObject    handle to ma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global smalto
smalto=get(hObject,'Value');
smalto=2*smalto;
set(handles.st4,'String',smalto);
set_param('ecusimu/Gain3','Gain',num2str(smalto));
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function ma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function pre_Callback(hObject, eventdata, handles)
% hObject    handle to pre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global spre
spre=get(hObject,'Value');
spre=2*spre;
set(handles.st5,'String',spre);
set_param('ecusimu/Gain4','Gain',num2str(spre));


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function pre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pre (see GCBO)
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


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function bri_Callback(hObject, eventdata, handles)
% hObject    handle to bri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global sbri
sbri=get(hObject,'Value');
sbri=2*sbri;
set(handles.st6,'String',sbri);
set_param('ecusimu/Gain5','Gain',num2str(sbri));


% --- Executes during object creation, after setting all properties.
function bri_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function vol_Callback(hObject, eventdata, handles)
% hObject    handle to vol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
svol=get(hObject,'Value');
svol=2*svol;
set(handles.st7,'String',svol);
set_param('ecusimu/Gain6','Gain',num2str(svol));



% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function vol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
global ruta nombre
if (hObject==handles.unoa)
    set_param('ecusimu/Constant1','Value','1');
     set(handles.avisos,'String','Equalizer');
    
elseif(hObject==handles.dosa)
    set_param('ecusimu/Constant1','Value','0');
     set(handles.avisos,'String','Original');
    set_param('ecusimu/From Multimedia File','FileName',fullfile(ruta,nombre));  
   
end


% --- Executes on button press in rock.
function rock_Callback(hObject, eventdata, handles)
% hObject    handle to rock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ssubb sbajo sbmedio smalto spre sbri
 set(handles.avisos,'String','Rock');

set_param('ecusimu/Gain','Gain','1.44');
set_param('ecusimu/Gain1','Gain','1.33');
set_param('ecusimu/Gain2','Gain','0.66');
set_param('ecusimu/Gain3','Gain','1.22');
set_param('ecusimu/Gain4','Gain','1.55');
set_param('ecusimu/Gain5','Gain','1.66');

ssubb = 1.44;
sbajo = 1.33;
sbmedio = 0.66;
smalto = 1.22;
spre = 1.55;
sbri = 1.66;

set(handles.ssb,'Value',0.72);
set(handles.sb,'Value',0.66);
set(handles.bm,'Value',0.33);
set(handles.ma,'Value',0.61);
set(handles.pre,'Value',0.775);
set(handles.bri,'Value',0.83);

set(handles.st1,'String','1.44');
set(handles.st2,'String','1.33');
set(handles.st3,'String','0.66');
set(handles.st4,'String','1.22');
set(handles.st5,'String','1.55');
set(handles.st6,'String','1.66');

% --- Executes on button press in reggae.
function reggae_Callback(hObject, eventdata, handles)
% hObject    handle to reggae (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ssubb sbajo sbmedio smalto spre sbri
 set(handles.avisos,'String','Reggae');

set_param('ecusimu/Gain','Gain','1.10');
set_param('ecusimu/Gain1','Gain','1.10');
set_param('ecusimu/Gain2','Gain','0.99');
set_param('ecusimu/Gain3','Gain','1.33');
set_param('ecusimu/Gain4','Gain','1.33');
set_param('ecusimu/Gain5','Gain','1.10');

set(handles.st1,'String','1.10');
set(handles.st2,'String','1.10');
set(handles.st3,'String','0.99');
set(handles.st4,'String','1.33');
set(handles.st5,'String','1.33');
set(handles.st6,'String','1.10');

ssubb = 1.10;
sbajo = 1.10;
sbmedio = 0.99;
smalto = 1.33;
spre = 1.33;
sbri = 1.10;

set(handles.ssb,'Value',0.55);
set(handles.sb,'Value',0.55);
set(handles.bm,'Value',0.495);
set(handles.ma,'Value',0.66);
set(handles.pre,'Value',0.66);
set(handles.bri,'Value',0.55);


% --- Executes on button press in pop.
function pop_Callback(hObject, eventdata, handles)
% hObject    handle to pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ssubb sbajo sbmedio smalto spre sbri
 set(handles.avisos,'String','Pop');

set_param('ecusimu/Gain','Gain','0.88');
set_param('ecusimu/Gain1','Gain','1.33');
set_param('ecusimu/Gain2','Gain','1.39');
set_param('ecusimu/Gain3','Gain','0.99');
set_param('ecusimu/Gain4','Gain','0.99');
set_param('ecusimu/Gain5','Gain','0.99');

set(handles.st1,'String','0.88');
set(handles.st2,'String','1.33');
set(handles.st3,'String','1.39');
set(handles.st4,'String','0.99');
set(handles.st5,'String','0.99');
set(handles.st6,'String','0.99');

ssubb = 0.88;
sbajo = 1.33;
sbmedio = 1.39;
smalto = 0.99;
spre = 0.99;
sbri = 0.99;

set(handles.ssb,'Value',0.44);
set(handles.sb,'Value',0.665);
set(handles.bm,'Value',0.695);
set(handles.ma,'Value',0.495);
set(handles.pre,'Value',0.495);
set(handles.bri,'Value',0.495);

% --- Executes on button press in fullbass.
function fullbass_Callback(hObject, eventdata, handles)
% hObject    handle to fullbass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ssubb sbajo sbmedio smalto spre sbri 
set(handles.avisos,'String','Fullbass');

set_param('ecusimu/Gain','Gain','1.55');
set_param('ecusimu/Gain1','Gain','1.55');
set_param('ecusimu/Gain2','Gain','1.44');
set_param('ecusimu/Gain3','Gain','0.77');
set_param('ecusimu/Gain4','Gain','0.55');
set_param('ecusimu/Gain5','Gain','0.22');

ssubb = 1.55;
sbajo = 1.55;
sbmedio = 1.44;
smalto = 0.77;
spre = 0.55;
sbri = 0.22;

set(handles.st1,'String','1.55');
set(handles.st2,'String','1.55');
set(handles.st3,'String','1.44');
set(handles.st4,'String','0.77');
set(handles.st5,'String','0.55');
set(handles.st6,'String','0.22');

set(handles.ssb,'Value',0.775);
set(handles.sb,'Value',0.775);
set(handles.bm,'Value',0.72);
set(handles.ma,'Value',0.385);
set(handles.pre,'Value',0.275);
set(handles.bri,'Value',0.11);

% --- Executes on button press in personalized.
function personalized_Callback(hObject, eventdata, handles)
% hObject    handle to personalized (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f1 f2 f3 f4 f5 f6 va
if (va == 1)
    set(handles.avisos,'String','Personalized');
    set_param('ecusimu/Gain','Gain',num2str(f1));
    set_param('ecusimu/Gain1','Gain',num2str(f2));
    set_param('ecusimu/Gain2','Gain',num2str(f3));
    set_param('ecusimu/Gain3','Gain',num2str(f4));
    set_param('ecusimu/Gain4','Gain',num2str(f5));
    set_param('ecusimu/Gain5','Gain',num2str(f6));

    set(handles.st1,'String',f1);
    set(handles.st2,'String',f2);
    set(handles.st3,'String',f3);
    set(handles.st4,'String',f4);
    set(handles.st5,'String',f5);
    set(handles.st6,'String',f6);

    set(handles.ssb,'Value',(f1/2));
    set(handles.sb,'Value',(f2/2));
    set(handles.bm,'Value',(f3/2));
    set(handles.ma,'Value',(f4/2));
    set(handles.pre,'Value',(f5/2));
    set(handles.bri,'Value',(f6/2));
else
    set(handles.avisos,'String','First, save your equalization preferences (Save Preset)');
end

% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ssubb sbajo sbmedio smalto spre sbri f1 f2 f3 f4 f5 f6 va
va = 1;
f1 = ssubb;
f2 = sbajo;
f3 = sbmedio;
f4 = smalto;
f5 = spre;
f6 = sbri;

set(handles.avisos,'String','Saved Preset');


% --- Executes during object creation, after setting all properties.
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over uno.
function uno_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
