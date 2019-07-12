%Código desenvolvido por João Guilherme 
%Atividade da disciplina ONDAS GUIADAS - PPGEEC/UFRN

function varargout = SmithGUI(varargin)
% SMITHGUI MATLAB code for SmithGUI.fig
%      SMITHGUI, by itself, creates a new SMITHGUI or raises the existing
%      singleton*.
%
%      H = SMITHGUI returns the handle to a new SMITHGUI or the handle to
%      the existing singleton*.
%
%      SMITHGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SMITHGUI.M with the given input arguments.
%
%      SMITHGUI('Property','Value',...) creates a new SMITHGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SmithGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SmithGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SmithGUI

% Last Modified by GUIDE v2.5 22-Apr-2019 09:45:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SmithGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SmithGUI_OutputFcn, ...
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


% --- Executes just before SmithGUI is made visible.
function SmithGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SmithGUI (see VARARGIN)

% Choose default command line output for SmithGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SmithGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SmithGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in COE.
function calcular_Callback(hObject, eventdata, handles)
% hObject    handle to COE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    nao = get(handles.ac_nao,'Value');
    sim = get(handles.ac_sim,'Value');
    
    if nao == 1                                 %Limpando o axes1
    cla(handles.axes1,'reset');
    end
    
    r = [0 .25 .5 1 2];
for i = 1:1:length(r)                           % Plot dos círculos reais
    
    x0 = r(i)/(1+r(i));
    raio = 1/(1+r(i));
    x = x0-raio:.01:x0+raio;
    gama_r = sqrt(raio^2 - (x-x0).^2);      %Cálculo do gama real 
    plot(x,real(gama_r),'k','linewidth',1);
    hold on
    plot(x,-real(gama_r),'k','linewidth',1);

end

x1 = [.001 .2 .5 1 2 5];
for i= 1:1:length(x1)                       % Plot dos círculos imaginários 
     
    
     y0= 1/(x1(i));                         %Setando um y0 pequeno para criar a reta central
     raio1= (1/x1(i));                      %Setando um raio1 pequeno para criar a reta central
     y=1-raio1 :.001: 1+raio1;
     
     gama_i= sqrt(raio1.^2-(y-1).^2)+ y0;   %Cálculo do gama imginário dos cículos superiores 
     aux = sqrt(real(gama_i).^2+(y).^2);    %Cálculo do módulo das coordenadas x e y 
     ind = find(aux<=1);                    %Encontrando os índices de módulos menores que 1
     
     plot(y(ind),-real(gama_i(ind)),'k:','LineWidth',1.5);
     hold on
     plot(y(ind),real(gama_i(ind)),'k:','LineWidth',1.5);
     hold on

     gama_i2= sqrt(raio1.^2-(y-1).^2)- y0;   
     aux1 = sqrt(real(gama_i2).^2+(y).^2);  %Cálculo do módulo das coordenadas x e y
     ind1 = find(aux1<=1);                  %Encontrando os índices de módulos menores que 1

     plot(y(ind1),real(gama_i2(ind1)),'k:','LineWidth',1.5);
     hold on
     plot(y(ind1),-real(gama_i2(ind1)),'k:','LineWidth',1.5);
     axis([-1.15 1.15 -1.15 1.15]);
     title(' Carta de Smith ');
     set(gca,'xticklabel',{[]});             %Apagando as informações do eixo x
     set(gca,'yticklabel',{[]});             %Apagando as informações do eixo y
     hold on
    
     %========================================Informando alguns valores de reatância de acordo com o ponto 
     text(.95,.41,'j5','linewidth',2);
     text(.63,.87,'j2');
     text(0,1.1,'j1');
     text(-.74,.87,'j0.5');
     text(-1.05,.45,'j0.2');
     text(-1.1,0,'j0');
     %========================================Informando alguns valores de reatância de acordo com o ponto 
     text(.95,-.41,'-j5');
     text(.63,-.87,'-j2');
     text(0,-1.05,'-j1');
     text(-.74,-.87,'-j0.5');
     text(-1.07,-.42,'-j0.2');
     text(1.03,0.02,'\infty');
end
     %----------------------------------------------Armazenando os valores de entrada  
     R = str2double(get(handles.RR,'string'));      %Pegando o valor de entrada de R
     X = str2double(get(handles.XX,'string'));      %Pegando o valor de entrada de X
     Z0 = str2double(get(handles.z0,'string'));     %Pegando o valor de entrada de Z0
     L = str2double(get(handles.comprimento,'string'));
     OptSinal = get(handles.maismenos,'Value');
        
    if OptSinal == 1;
         ZL = R;
    elseif OptSinal == 2;
         ZL = R + 1j*X;
    elseif OptSinal == 3;
         ZL = R - 1j*X;
    end
     
     zl = ZL/Z0;                                %Normalizando a impedancia de carga
     gama = (zl-1)/(zl+1);                      %Cálculo do coeficiente de reflexão
     mod = abs(gama);                           %Extraindo o módulo do coeficiente de reflexão 
     teta = angle(gama);                        %Extraindo a fase do coeficiente de reflexão
     VSWR = (1+mod)/(1-mod);                    %Cálculo do COE (VSWR)
     beta = 2*pi;
     num = ZL + 1j*Z0*tan(beta*L);              %Cálculo do Zin
     den = Z0 + 1j*ZL*tan(beta*L);
     zz = num/den;
     gamazz = (zz-1)/(zz+1);
     Zin = Z0*(num)/(den);
     
     polar(teta, mod, 'ro') ;                   % Plot de zl
     hold on
     polar(angle(gamazz),abs(gamazz),'bo');     % Plot de zz
     hold on
     theta = linspace(0,2*pi,50);
     plot(abs(gama)*cos(theta),abs(gama)*sin(theta),'--','LineWidth',1.5)
     set(gca,'xticklabel',{[]});             %Apagando as informações do eixo x
     set(gca,'yticklabel',{[]});             %Apagando as informações do eixo y
     title(' Carta de Smith ');
     hold on 
     %----------------------------------------Setando os valores nas variáveis de saída
     set(handles.COE,'string',VSWR);             
     set(handles.gamareal,'string',round(real(gama),1));
     set(handles.gamaimag,'string',round(imag(gama),1));
     set(handles.zinreal,'string',round(real(Zin),1));
     set(handles.zinimag,'string',round(imag(Zin),1));
     set(handles.painel,'visible','on');
     axes(handles.axes1);


function RR_Callback(hObject, eventdata, handles)
% hObject    handle to RR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RR as text
%        str2double(get(hObject,'String')) returns contents of RR as a double


% --- Executes during object creation, after setting all properties.
function RR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function XX_Callback(hObject, eventdata, handles)
% hObject    handle to XX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of XX as text
%        str2double(get(hObject,'String')) returns contents of XX as a double


% --- Executes during object creation, after setting all properties.
function XX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in maismenos.
function maismenos_Callback(hObject, eventdata, handles)
% hObject    handle to maismenos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns maismenos contents as cell array
%        contents{get(hObject,'Value')} returns selected item from maismenos


% --- Executes during object creation, after setting all properties.
function maismenos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maismenos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z0_Callback(hObject, eventdata, handles)
% hObject    handle to z0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z0 as text
%        str2double(get(hObject,'String')) returns contents of z0 as a double


% --- Executes during object creation, after setting all properties.
function z0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function COE_Callback(hObject, eventdata, handles)
% hObject    handle to COE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of COE as text
%        str2double(get(hObject,'String')) returns contents of COE as a double


% --- Executes during object creation, after setting all properties.
function COE_CreateFcn(hObject, eventdata, handles)
% hObject    handle to COE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gamaimag_Callback(hObject, eventdata, handles)
% hObject    handle to COE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of COE as text
%        str2double(get(hObject,'String')) returns contents of COE as a double


% --- Executes during object creation, after setting all properties.
function gamaimag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to COE (see GCBO)
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



function gamareal_Callback(hObject, eventdata, handles)
% hObject    handle to COE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of COE as text
%        str2double(get(hObject,'String')) returns contents of COE as a double


% --- Executes during object creation, after setting all properties.
function gamareal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to COE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq_Callback(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq as text
%        str2double(get(hObject,'String')) returns contents of freq as a double


% --- Executes during object creation, after setting all properties.
function freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function comprimento_Callback(hObject, eventdata, handles)
% hObject    handle to comprimento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comprimento as text
%        str2double(get(hObject,'String')) returns contents of comprimento as a double


% --- Executes during object creation, after setting all properties.
function comprimento_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comprimento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zinreal_Callback(hObject, eventdata, handles)
% hObject    handle to zinreal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zinreal as text
%        str2double(get(hObject,'String')) returns contents of zinreal as a double


% --- Executes during object creation, after setting all properties.
function zinreal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zinreal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function zinimag_Callback(hObject, eventdata, handles)
% hObject    handle to zinimag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of zinimag as text
%        str2double(get(hObject,'String')) returns contents of zinimag as a double


% --- Executes during object creation, after setting all properties.
function zinimag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zinimag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function acumulate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to acumulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in ac_sim.
function ac_sim_Callback(hObject, eventdata, handles)
% hObject    handle to ac_sim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of ac_sim


% --- Executes during object creation, after setting all properties.
function ac_sim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ac_sim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in ac_nao.
function ac_nao_Callback(hObject, eventdata, handles)
% hObject    handle to ac_nao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of ac_nao


% --- Executes during object creation, after setting all properties.
function ac_nao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ac_nao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
