function varargout = matching_smith(varargin)
% MATCHING_SMITH MATLAB code for matching_smith.fig
%      MATCHING_SMITH, by itself, creates a new MATCHING_SMITH or raises the existing
%      singleton*.
%
%      H = MATCHING_SMITH returns the handle to a new MATCHING_SMITH or the handle to
%      the existing singleton*.
%
%      MATCHING_SMITH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATCHING_SMITH.M with the given input arguments.
%
%      MATCHING_SMITH('Property','Value',...) creates a new MATCHING_SMITH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before matching_smith_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to matching_smith_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help matching_smith

% Last Modified by GUIDE v2.5 24-Apr-2019 00:15:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @matching_smith_OpeningFcn, ...
                   'gui_OutputFcn',  @matching_smith_OutputFcn, ...
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


% --- Executes just before matching_smith is made visible.
function matching_smith_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to matching_smith (see VARARGIN)

% Choose default command line output for matching_smith
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes matching_smith wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = matching_smith_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
r = [0 .25 .5 1 2];
for i = 1:1:length(r)                           % Plot dos círculos reais
    
    x0 = r(i)/(1+r(i));
    raio = 1/(1+r(i));
    x = x0-raio:.01:x0+raio;
    gama_r = sqrt(raio^2 - (x-x0).^2);      %Cálculo do gama real 
    plot(x,real(gama_r),'b','linewidth',1);
    hold on
    plot(x,-real(gama_r),'b','linewidth',1);

end

x1 = [.001 .2 .5 1 2 5];
for i= 1:1:length(x1)                       % Plot dos círculos imaginários 
     
    
     y0= 1/(x1(i));                         %Setando um y0 pequeno para criar a reta central
     raio1= (1/x1(i));                      %Setando um raio1 pequeno para criar a reta central
     y=1-raio1 :.001: 1+raio1;
     
     gama_i= sqrt(raio1.^2-(y-1).^2)+ y0;   %Cálculo do gama imginário dos cículos superiores 
     aux = sqrt(real(gama_i).^2+(y).^2);    %Cálculo do módulo das coordenadas x e y 
     ind = find(aux<=1);                    %Encontrando os índices de módulos menores que 1
     
     plot(y(ind),-real(gama_i(ind)),'k:','LineWidth',1);
     hold on
     plot(y(ind),real(gama_i(ind)),'k:','LineWidth',1);
     hold on

     gama_i2= sqrt(raio1.^2-(y-1).^2)- y0;   
     aux1 = sqrt(real(gama_i2).^2+(y).^2);  %Cálculo do módulo das coordenadas x e y
     ind1 = find(aux1<=1);                  %Encontrando os índices de módulos menores que 1

     plot(y(ind1),real(gama_i2(ind1)),'k:','LineWidth',1);
     hold on
     plot(y(ind1),-real(gama_i2(ind1)),'k:','LineWidth',1);
     axis([-1.15 1.15 -1.15 1.15]);
     title(' Carta de Smith ');
     set(gca,'xticklabel',{[]});             %Apagando as informações do eixo x
     set(gca,'yticklabel',{[]});             %Apagando as informações do eixo y
     hold on
    
end

% --- Executes on button press in calcular.
function calcular_Callback(hObject, eventdata, handles)
% hObject    handle to calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset');
r = [0 .25 .5 1 2];
for i = 1:1:length(r)                           % Plot dos círculos reais
    
    x0 = r(i)/(1+r(i));
    raio = 1/(1+r(i));
    x = x0-raio:.01:x0+raio;
    gama_r = sqrt(raio^2 - (x-x0).^2);      %Cálculo do gama real 
    plot(x,real(gama_r),'b','linewidth',1);
    hold on
    plot(x,-real(gama_r),'b','linewidth',1);

end

x1 = [.001 .2 .5 1 2 5];
for i= 1:1:length(x1)                       % Plot dos círculos imaginários 
     
    
     y0= 1/(x1(i));                         %Setando um y0 pequeno para criar a reta central
     raio1= (1/x1(i));                      %Setando um raio1 pequeno para criar a reta central
     y=1-raio1 :.001: 1+raio1;
     
     gama_i= sqrt(raio1.^2-(y-1).^2)+ y0;   %Cálculo do gama imginário dos cículos superiores 
     aux = sqrt(real(gama_i).^2+(y).^2);    %Cálculo do módulo das coordenadas x e y 
     ind = find(aux<=1);                    %Encontrando os índices de módulos menores que 1
     
     plot(y(ind),-real(gama_i(ind)),'k:','LineWidth',1);
     hold on
     plot(y(ind),real(gama_i(ind)),'k:','LineWidth',1);
     hold on

     gama_i2= sqrt(raio1.^2-(y-1).^2)- y0;   
     aux1 = sqrt(real(gama_i2).^2+(y).^2);  %Cálculo do módulo das coordenadas x e y
     ind1 = find(aux1<=1);                  %Encontrando os índices de módulos menores que 1

     plot(y(ind1),real(gama_i2(ind1)),'k:','LineWidth',1);
     hold on
     plot(y(ind1),-real(gama_i2(ind1)),'k:','LineWidth',1);
     axis([-1.15 1.15 -1.15 1.15]);
     title(' Carta de Smith ');
     set(gca,'xticklabel',{[]});             %Apagando as informações do eixo x
     set(gca,'yticklabel',{[]});             %Apagando as informações do eixo y
     hold on
    
   end
     %----------------------------------------------Armazenando os valores de entrada  
     R = str2double(get(handles.r,'string'));      %Pegando o valor de entrada de R
     X = str2double(get(handles.x,'string'));      %Pegando o valor de entrada de X
     Z0= str2double(get(handles.Z0,'string'));     %Pegando o valor de entrada de Z0
     F = str2double(get(handles.f,'string'));
     OptSinal = get(handles.sinal,'Value');
        
    if OptSinal == 1;
         ZL = R;
    elseif OptSinal == 2;
         ZL = R + 1j*X;
    elseif OptSinal == 3;
         ZL = R - 1j*X;
    end
    
    F = F*1e9;
    c = 3*1e8;
    zl = ZL/Z0;                                %Normalizando a impedancia de carga
    gama = (zl-1)/(zl+1);                      %Cálculo do coeficiente de reflexão
    mod = abs(gama);                           %Extraindo o módulo do coeficiente de reflexão 
    teta = angle(gama);                        %Extraindo a fase do coeficiente de reflexão
    polar(teta, mod, 'ro') ;                   % Plot de zl
    
    hold on
    theta = linspace(0,2*pi,50);
    plot(abs(gama)*cos(theta),abs(gama)*sin(theta),'r--','LineWidth',1.5)
    set(gca,'xticklabel',{[]});             %Apagando as informações do eixo x
    set(gca,'yticklabel',{[]});             %Apagando as informações do eixo y
    title(' Carta de Smith ');
    hold on 
    
     OptMetodo = get(handles.metodo,'Value');
     
     if OptMetodo == 2
        yl = 1/zl;
        RL = real(ZL);
        XL = imag(ZL);
        w = 2*pi*F;
        x = [-cos(teta) -abs(gama)*cos(teta) 0 abs(gama)*cos(teta) cos(teta)];
        y = [-sin(teta) -abs(gama)*sin(teta) 0 abs(gama)*sin(teta) sin(teta)];
        
        gamayl = (yl-1)/(yl+1);
        modyl = abs(gamayl);
        tetayl = angle(gamayl);
        polar(tetayl, modyl, 'bo')
        plot(x,y,'k--');
        hold on
        cosseno = .5*cos(theta); 
        seno = .5*sin(theta);
        plot(cosseno-.5,seno,'y--','LineWidth',1.5);
        plot(cosseno+.5,seno,'c--','LineWidth',1.5);
        ax = abs(gama)*cos(teta);
        ay = abs(gama)*sin(teta);
        
        if R <= Z0;
            yl = round(yl,1);
            zl = round(zl,1);
            str = ['ZL =' num2str(zl) '\rightarrow '];
            str1 = ['YL =' num2str(yl) '\rightarrow '];
            text(ax-.8, ay+.05,str,'Color','red','FontSize',14);
            text(-ax-.8, -ay+.05,str1,'Color','blue','FontSize',14);
        else
            if X >= 65 
                yl = round(yl,1);
                zl = round(zl,1);
                str = ['ZL =' num2str(zl) '\rightarrow '];
                str1 = ['\leftarrow YL =' num2str(yl)];
                text(ax-.8, ay+.05,str,'Color','red','FontSize',14);
                text(-ax+.1, -ay+.05,str1,'Color','blue','FontSize',14);
            else
                yl = round(yl,1);
                zl = round(zl,1);
                str = ['\leftarrow ZL =' num2str(zl)];
                str1 = ['\leftarrow YL =' num2str(yl)];
                text(ax+.1, ay+.05,str,'Color','red','FontSize',14);
                text(-ax+.1, -ay+.05,str1,'Color','blue','FontSize',14);    
            end
            
        end
        if RL > Z0
            num1 = XL + sqrt(RL/Z0)*sqrt(RL^2+XL^2-Z0*RL);
            num2 = XL - sqrt(RL/Z0)*sqrt(RL^2+XL^2-Z0*RL);
            den = RL^2 + XL ^2;
    
            B1 = num1/den;
            B2 = num2/den;
    
            X1 = (1/B1)+(XL*Z0)/RL - Z0/(B1*RL);
            X2 = (1/B2)+(XL*Z0)/RL - Z0/(B2*RL);
    
            b1 = B1*Z0;
            x1 = X1/Z0;
            b2 = B2*Z0;
            x2 = X2/Z0;
    
            format shortEng
            C1 = b1/(w*Z0);
            L1 = x1*Z0/(w);
            C2 = -1/(x2*Z0*w);
            L2 = -Z0/(b2*w);
            
            set(handles.c1,'string',C1);
            set(handles.l1,'string',L1);
            set(handles.c2,'string',C2);
            set(handles.l2,'string',L2);
        elseif RL < Z0
            X1 = sqrt(RL*(Z0-RL))-XL;
            X2 = (-1)*sqrt(RL*(Z0-RL))-XL;
    
            B1 = sqrt((Z0-RL)/RL)/Z0;
            B2 = (-1)*sqrt((Z0-RL)/RL)/Z0;
    
            b1 = B1*Z0;
            x1 = X1/Z0;
            b2 = B2*Z0;
            x2 = X2/Z0;
            
            C1 = b1/(w*Z0);
            L1 = x1*Z0/(w);
            C2 = -1/(x2*Z0*w);
            L2 = -Z0/(b2*w);
            
            set(handles.c1,'string',C1);
            set(handles.l1,'string',L1);
            set(handles.c2,'string',C2);
            set(handles.l2,'string',L2);
        end
     elseif OptMetodo == 3
            RL = real(ZL);
            XL = imag(ZL);
            Y0 = 1/Z0;
            yl = 1/zl;
            
            gamayl = (yl-1)/(yl+1);
            modyl = abs(gamayl);
            tetayl = angle(gamayl);
            polar(tetayl, modyl, 'ko')
            hold on
            cosseno = .5*cos(theta); 
            seno = .5*sin(theta);
            plot(cosseno+.5,seno,'y--','LineWidth',2);
            ax = abs(gama)*cos(teta);
            ay = abs(gama)*sin(teta);
        
        if R <= Z0;
            yl = round(yl,1);
            zl = round(zl,1);
            str = ['ZL =' num2str(zl) '\rightarrow '];
            str1 = ['YL =' num2str(yl) '\rightarrow '];
            text(ax-.8, ay+.05,str,'Color','red','FontSize',14);
            text(-ax-.8, -ay+.05,str1,'Color','blue','FontSize',14);
        else
            if X >= 65 
                yl = round(yl,1);
                zl = round(zl,1);
                str = ['ZL =' num2str(zl) '\rightarrow '];
                str1 = ['\leftarrow YL =' num2str(yl)];
                text(ax-.8, ay+.05,str,'Color','red','FontSize',14);
                text(-ax+.1, -ay+.05,str1,'Color','blue','FontSize',14);
            else
                yl = round(yl,1);
                zl = round(zl,1);
                str = ['\leftarrow ZL =' num2str(zl)];
                str1 = ['\leftarrow YL =' num2str(yl)];
                text(ax+.1, ay+.05,str,'Color','red','FontSize',14);
                text(-ax+.1, -ay+.05,str1,'Color','blue','FontSize',14);    
            end
        end
            num1 = (XL+sqrt(RL*((Z0-RL)^2+XL^2)/Z0));
            num2 = (XL-sqrt(RL*((Z0-RL)^2+XL^2)/Z0));
            den = RL-Z0;

            t1 = num1/den;
            t2 = num2/den;

            D11 = (1/(2*pi))*atan(t1);
            D22 = (1/(2*pi))*(pi+atan(t2));

            if D11 < 0
                D11 = D11+.5;
            end

            if D22 < 0
                D22 = D22+.5;
            end

            numb1 = (RL^2)*t1-(Z0-XL*t1)*(XL+Z0*t1);
            numb2 = (RL^2)*t2-(Z0-XL*t2)*(XL+Z0*t2);
            denb1 = Z0*(RL^2+(XL+Z0*t1)^2);
            denb2 = Z0*(RL^2+(XL+Z0*t2)^2);

            B1 = numb1/denb1;
            B2 = numb2/denb2;

            L11 = ((-1)/(2*pi))*(atan(Y0/B2))+.25;
            L22 = ((1)/(2*pi))*(pi-atan(Y0/B1))-.25;
            L33 = ((1)/(2*pi))*(pi-atan(B1*Z0))-.25;
            L44 = ((-1)/(2*pi))*(atan(B2*Z0))+.25;
            
            set(handles.d1_para,'string',round(D11*(c/F),3));
            set(handles.d2_para,'string',round(D22*(c/F),3));
            set(handles.l1_para,'string',round(L11*(c/F),3));
            set(handles.l2_para,'string',round(L22*(c/F),3));
            set(handles.l3_para,'string',round(L33*(c/F),3));
            set(handles.l4_para,'string',round(L44*(c/F),3));
     elseif OptMetodo == 4
            YL = 1/ZL;
            Y0 = 1/Z0;
            GL = real(YL);
            BL = imag(YL);
                        
            cosseno = .5*cos(theta); 
            seno = .5*sin(theta);
            plot(cosseno+.5,seno,'y--','LineWidth',2);
           
            ax = abs(gama)*cos(teta);
            ay = abs(gama)*sin(teta);
        
        if R <= Z0;
            zl = round(zl,1);
            str = ['ZL =' num2str(zl) '\rightarrow '];
            text(ax-.8, ay+.05,str,'Color','red','FontSize',14);
        else
            if X >= 65 
                zl = round(zl,1);
                str = ['ZL =' num2str(zl) '\rightarrow '];
                text(ax-.8, ay+.05,str,'Color','red','FontSize',14);
            else
                zl = round(zl,1);
                str = ['\leftarrow ZL =' num2str(zl)];
                text(ax+.1, ay+.05,str,'Color','red','FontSize',14);    
            end
        end
            
            
            
            num11 = BL + sqrt(GL*((Y0-GL)^2+BL^2)/Y0);
            num21 = BL - sqrt(GL*((Y0-GL)^2+BL^2)/Y0);
            den11 = GL-Y0;

            t11 = num11/den11;
            t21 = num21/den11;

            numx1 = (GL^2)*t11-(Y0-BL*t11)*(BL+Y0*t11);
            numx2 = (GL^2)*t21-(Y0-BL*t21)*(BL+Y0*t21);
            denx1 = Y0*((GL^2)+(BL+Y0*t11)^2);
            denx2 = Y0*((GL^2)+(BL+Y0*t21)^2);

            X1 = numx1/denx1;
            X2 = numx2/denx2;


            dx1 = (1/(2*pi))*(pi+atan(t11));
            dx2 = (1/(2*pi))*(atan(t21));

            if dx1 < 0
                dx1 = dx1+.5;
            end

            if dx2 < 0
                dx2 = dx2+.5;
            end

            lx1 = (-1/(2*pi))*atan(Z0/X2);
            lx2 = (1/(2*pi))*(atan(X1/Z0))+.25;
            lx3 = ((-1)/(2*pi))*(atan(Z0/X2))+.25;
            lx4 = ((1)/(2*pi))*(atan(X1/Z0));
            
            set(handles.d1_serie,'string',round(dx1*(c/F),3));
            set(handles.d2_serie,'string',round(dx2*(c/F),3));
            set(handles.l1_serie,'string',round(lx1*(c/F),3));
            set(handles.l2_serie,'string',round(lx2*(c/F),3));
            set(handles.l3_serie,'string',round(lx3*(c/F),3));
            set(handles.l4_serie,'string',round(lx4*(c/F),3));
     elseif OptMetodo == 5
            RL = real(ZL);
        
            Z1 = sqrt(Z0*RL);
            z1 = Z1/Z0;
            L = (c/F)/4;
            
            ax = abs(gama)*cos(teta);
            ay = abs(gama)*sin(teta);
        
        if R <= Z0;
            zl = round(zl,1);
            str = ['ZL =' num2str(zl) '\rightarrow '];
            text(ax-.8, ay+.05,str,'Color','red','FontSize',14);
        else
            if X >= 65 
                zl = round(zl,1);
                str = ['ZL =' num2str(zl) '\rightarrow '];
                text(ax-.8, ay+.05,str,'Color','red','FontSize',14);
            else
                zl = round(zl,1);
                str = ['\leftarrow ZL =' num2str(zl)];
                text(ax+.1, ay+.05,str,'Color','red','FontSize',14);    
            end
        end
            
            set(handles.z1_quarto,'string',Z1);
            set(handles.l_quarto,'string',L);
     end
     
    %----------------------------------------Setando os valores nas variáveis de saída
%      set(handles.COE,'string',VSWR);             
%      set(handles.gamareal,'string',round(real(gama),1));
%      set(handles.gamaimag,'string',round(imag(gama),1));
%      set(handles.zinreal,'string',round(real(Zin),1));
%      set(handles.zinimag,'string',round(imag(Zin),1));
     set(handles.painel,'visible','on');
     axes(handles.axes1);


function r_Callback(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r as text
%        str2double(get(hObject,'String')) returns contents of r as a double


% --- Executes during object creation, after setting all properties.
function r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_Callback(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x as text
%        str2double(get(hObject,'String')) returns contents of x as a double


% --- Executes during object creation, after setting all properties.
function x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in sinal.
function sinal_Callback(hObject, eventdata, handles)
% hObject    handle to sinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sinal contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sinal


% --- Executes during object creation, after setting all properties.
function sinal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z0_Callback(hObject, eventdata, handles)
% hObject    handle to Z0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z0 as text
%        str2double(get(hObject,'String')) returns contents of Z0 as a double


% --- Executes during object creation, after setting all properties.
function Z0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function f_Callback(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f as text
%        str2double(get(hObject,'String')) returns contents of f as a double


% --- Executes during object creation, after setting all properties.
function f_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in metodo.
function metodo_Callback(hObject, eventdata, handles)
% hObject    handle to metodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OptMetodo = get(handles.metodo,'Value');
    if OptMetodo == 1;
        set(handles.secaoL,'visible','off');
        set(handles.tocopara,'visible','off');
        set(handles.tocoserie,'visible','off');
        set(handles.quarto,'visible','off');
    elseif OptMetodo == 2;
        set(handles.secaoL,'visible','on');
        set(handles.tocopara,'visible','off');
        set(handles.tocoserie,'visible','off');
        set(handles.quarto,'visible','off');
    elseif OptMetodo == 3;
        set(handles.secaoL,'visible','off');
        set(handles.tocopara,'visible','on');
        set(handles.tocoserie,'visible','off');
        set(handles.quarto,'visible','off');
    elseif OptMetodo == 4;
        set(handles.secaoL,'visible','off');
        set(handles.tocopara,'visible','off');
        set(handles.tocoserie,'visible','on');
        set(handles.quarto,'visible','off');
    elseif OptMetodo == 5;
        set(handles.secaoL,'visible','off');
        set(handles.tocopara,'visible','off');
        set(handles.tocoserie,'visible','off');
        set(handles.quarto,'visible','on');
    end
    

% Hints: contents = cellstr(get(hObject,'String')) returns metodo contents as cell array
%        contents{get(hObject,'Value')} returns selected item from metodo


% --- Executes during object creation, after setting all properties.
function metodo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to metodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c1_Callback(hObject, eventdata, handles)
% hObject    handle to c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c1 as text
%        str2double(get(hObject,'String')) returns contents of c1 as a double


% --- Executes during object creation, after setting all properties.
function c1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c2_Callback(hObject, eventdata, handles)
% hObject    handle to c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c2 as text
%        str2double(get(hObject,'String')) returns contents of c2 as a double


% --- Executes during object creation, after setting all properties.
function c2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function l1_Callback(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l1 as text
%        str2double(get(hObject,'String')) returns contents of l1 as a double


% --- Executes during object creation, after setting all properties.
function l1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l2_Callback(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l2 as text
%        str2double(get(hObject,'String')) returns contents of l2 as a double


% --- Executes during object creation, after setting all properties.
function l2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d1_para_Callback(hObject, eventdata, handles)
% hObject    handle to d1_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d1_para as text
%        str2double(get(hObject,'String')) returns contents of d1_para as a double


% --- Executes during object creation, after setting all properties.
function d1_para_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d1_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d2_para_Callback(hObject, eventdata, handles)
% hObject    handle to d2_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d2_para as text
%        str2double(get(hObject,'String')) returns contents of d2_para as a double


% --- Executes during object creation, after setting all properties.
function d2_para_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d2_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l1_para_Callback(hObject, eventdata, handles)
% hObject    handle to l1_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l1_para as text
%        str2double(get(hObject,'String')) returns contents of l1_para as a double


% --- Executes during object creation, after setting all properties.
function l1_para_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l1_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l2_para_Callback(hObject, eventdata, handles)
% hObject    handle to l2_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l2_para as text
%        str2double(get(hObject,'String')) returns contents of l2_para as a double


% --- Executes during object creation, after setting all properties.
function l2_para_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l2_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l3_para_Callback(hObject, eventdata, handles)
% hObject    handle to l3_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l3_para as text
%        str2double(get(hObject,'String')) returns contents of l3_para as a double


% --- Executes during object creation, after setting all properties.
function l3_para_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l3_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l4_para_Callback(hObject, eventdata, handles)
% hObject    handle to l4_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l4_para as text
%        str2double(get(hObject,'String')) returns contents of l4_para as a double


% --- Executes during object creation, after setting all properties.
function l4_para_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l4_para (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d1_serie_Callback(hObject, eventdata, handles)
% hObject    handle to d1_serie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d1_serie as text
%        str2double(get(hObject,'String')) returns contents of d1_serie as a double


% --- Executes during object creation, after setting all properties.
function d1_serie_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d1_serie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d2_serie_Callback(hObject, eventdata, handles)
% hObject    handle to d2_serie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d2_serie as text
%        str2double(get(hObject,'String')) returns contents of d2_serie as a double


% --- Executes during object creation, after setting all properties.
function d2_serie_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d2_serie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l1_serie_Callback(hObject, eventdata, handles)
% hObject    handle to l1_serie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l1_serie as text
%        str2double(get(hObject,'String')) returns contents of l1_serie as a double


% --- Executes during object creation, after setting all properties.
function l1_serie_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l1_serie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l2_serie_Callback(hObject, eventdata, handles)
% hObject    handle to l2_serie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l2_serie as text
%        str2double(get(hObject,'String')) returns contents of l2_serie as a double


% --- Executes during object creation, after setting all properties.
function l2_serie_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l2_serie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l3_serie_Callback(hObject, eventdata, handles)
% hObject    handle to l3_serie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l3_serie as text
%        str2double(get(hObject,'String')) returns contents of l3_serie as a double


% --- Executes during object creation, after setting all properties.
function l3_serie_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l3_serie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l4_serie_Callback(hObject, eventdata, handles)
% hObject    handle to l4_serie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l4_serie as text
%        str2double(get(hObject,'String')) returns contents of l4_serie as a double


% --- Executes during object creation, after setting all properties.
function l4_serie_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l4_serie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z1_quarto_Callback(hObject, eventdata, handles)
% hObject    handle to z1_quarto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z1_quarto as text
%        str2double(get(hObject,'String')) returns contents of z1_quarto as a double


% --- Executes during object creation, after setting all properties.
function z1_quarto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z1_quarto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l_quarto_Callback(hObject, eventdata, handles)
% hObject    handle to l_quarto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l_quarto as text
%        str2double(get(hObject,'String')) returns contents of l_quarto as a double


% --- Executes during object creation, after setting all properties.
function l_quarto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l_quarto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
