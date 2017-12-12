function varargout = ProyectoTDCyS(varargin)
% PROYECTOTDCYS MATLAB code for ProyectoTDCyS.fig
%      PROYECTOTDCYS, by itself, creates a new PROYECTOTDCYS or raises the existing
%      singleton*.
%
%      H = PROYECTOTDCYS returns the handle to a new PROYECTOTDCYS or the handle to
%      the existing singleton*.
%
%      PROYECTOTDCYS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROYECTOTDCYS.M with the given input arguments.
%
%      PROYECTOTDCYS('Property','Value',...) creates a new PROYECTOTDCYS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProyectoTDCyS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProyectoTDCyS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProyectoTDCyS

% Last Modified by GUIDE v2.5 12-Dec-2017 10:04:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProyectoTDCyS_OpeningFcn, ...
                   'gui_OutputFcn',  @ProyectoTDCyS_OutputFcn, ...
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


% --- Executes just before ProyectoTDCyS is made visible.
function ProyectoTDCyS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProyectoTDCyS (see VARARGIN)

% Choose default command line output for ProyectoTDCyS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ProyectoTDCyS wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = ProyectoTDCyS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function y_n_edit_Callback(hObject, eventdata, handles)
% hObject    handle to y_n_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_n_edit as text
%        str2double(get(hObject,'String')) returns contents of y_n_edit as a double


% --- Executes during object creation, after setting all properties.
function y_n_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_n_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in graficar_y_n.
function graficar_y_n_Callback(hObject, eventdata, handles)
% hObject    handle to graficar_y_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Leemos los valores de los textbox
y_n = str2num(get(handles.y_n_edit,'String'));
centro_y = str2num(get(handles.y_n_centro_edit,'String'));

% Obtenemos el numerod e muestras de acuerdo al tamanio del vector leido
num_muestras = length(y_n);
valoresGrafica = cell(length(y_n),2);

% Si el centro es la primera posicion del vector
if centro_y == 1
    
    % Se asignan los valores
    for i=1:num_muestras
        valoresGrafica{i,2} = y_n(i);
        valoresGrafica{i,1} = i-1;
    end
    
% Si el centro es una posicion intermedia en el vector
else
    
    % Se asignan los valores
    indice = -centro_y+1;
    for i=1:num_muestras
        valoresGrafica{i,2} = y_n(i);
        valoresGrafica{i,1} = indice;
        indice = indice +1;
    end
end
grafica_y_n = cell2mat(valoresGrafica);
assignin ('base','grafica_y_n',grafica_y_n);
assignin ('base','centro_y',centro_y);
% Graficamos en la GUI
stem(handles.y_n_axes,grafica_y_n(:,1),grafica_y_n(:,2),'Color',[1 0 0]);
set(handles.y_n_axes,'XMinorTick','on');
grid on


function x_n_edit_Callback(hObject, eventdata, handles)
% hObject    handle to x_n_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_n_edit as text
%        str2double(get(hObject,'String')) returns contents of x_n_edit as a double


% --- Executes during object creation, after setting all properties.
function x_n_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_n_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in graficar_x_n.
function graficar_x_n_Callback(hObject, eventdata, handles)
% hObject    handle to graficar_x_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Leemos los valores de los textbox
x_n = str2num(get(handles.x_n_edit,'String'));
centro_x = str2num(get(handles.x_n_centro_edit,'String'));

% Obtenemos el numerod e muestras de acuerdo al tamanio del vector leido
num_muestras = length(x_n);
valoresGrafica = cell(length(x_n),2);

% Si el centro es la primera posicion del vector
if centro_x == 1
    
    % Se asignan los valores
    for i=1:num_muestras
        valoresGrafica{i,2} = x_n(i);
        valoresGrafica{i,1} = i-1;
    end
    
% Si el centro es una posicion intermedia en el vector
else
    
    % Se asignan los valores
    indice = -centro_x+1;
    for i=1:num_muestras
        valoresGrafica{i,2} = x_n(i);
        valoresGrafica{i,1} = indice;
        indice = indice +1;
    end
end
grafica_x_n = cell2mat(valoresGrafica);
assignin ('base','grafica_x_n',grafica_x_n);
assignin ('base','centro_x',centro_x);
% Graficamos en la GUI
stem(handles.x_n_axes,grafica_x_n(:,1),grafica_x_n(:,2),'Color',[0 1 0]);
set(handles.x_n_axes,'XMinorTick','on');
grid on


% --- Executes on button press in realizarOperacion.
function realizarOperacion_Callback(hObject, eventdata, handles)
% hObject    handle to realizarOperacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hacemos un switch case del grupo de Radio buttons
sum = get(handles.sumaRadioButton,'Value');
res = get(handles.restaRadioButton,'Value');
mul = get(handles.multiplicacionRadioButton,'Value');
amp = get(handles.amplificacionRadioButton,'Value');
des = get(handles.despRadioButton,'Value');
die = get(handles.diezmacionRadioButton,'Value');
inL = get(handles.interpolacionLinealRadioButton,'Value');
in0 = get(handles.interpolacionaCeroRadioButton,'Value');
inE = get(handles.interpolacionEscalonRadioButton,'Value');
ref = get(handles.reflejoRadioButton,'Value');
ate = get(handles.atenuacionRadioButton,'Value');
grafica_x_n = evalin('base','grafica_x_n');
grafica_y_n = evalin('base','grafica_y_n');
centro_x = evalin('base','centro_x');
centro_y = evalin('base','centro_y');
if sum
    sumar(grafica_x_n,grafica_y_n,centro_x,centro_y,handles);
else if res
        restar(grafica_x_n,grafica_y_n,centro_x,centro_y,handles);
    else if mul
            multiplicar(grafica_x_n,grafica_y_n,centro_x,centro_y,handles);
        else if amp
                amplificar(grafica_x_n,centro_x,handles);
            else if ate
                    atenuar(grafica_x_n,centro_x,handles);
                else if des
                       desplazar(grafica_x_n,centro_x,handles); 
                    else if die
                            diezmar(grafica_x_n,centro_x,handles);
                        else if inL
                                interpolarLinealmente(grafica_x_n,centro_x,handles);
                            else if inE
                                    interpolarEscalon(grafica_x_n,centro_x,handles);
                                else if in0
                                        interpolar_a_cero(grafica_x_n,centro_x,handles);
                                    else if ref
                                            reflejar(grafica_x_n,centro_x,handles);
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

% Funcion de la operacion suma
function sumar(x_n,y_n,centro_x,centro_y,handles)
if centro_x > centro_y
    diferencia = centro_x-centro_y;
    y_n=[zeros(diferencia,2);y_n];
    if length(x_n) > length(y_n)
        diferencia = length(x_n) - length(y_n);
        y_n=[y_n;zeros(diferencia,2)];
    else
        diferencia = length(y_n) - length(x_n);
        x_n=[x_n;zeros(diferencia,2)];
    end
else
    diferencia = centro_y - centro_x;
    x_n=[zeros(diferencia,2);x_n];
    if length(x_n) > length(y_n)
        diferencia = length(x_n) - length(y_n);
        y_n=[y_n;zeros(diferencia,2)];
    else
        diferencia = length(y_n) - length(x_n);
        x_n=[x_n;zeros(diferencia,2)];
    end
end
assignin ('base','x_n',x_n);
assignin ('base','y_n',y_n);
if centro_x > centro_y
    lim_inf = min(x_n(:,1));
    if max(x_n(:,1)) > max(y_n(:,1))
        lim_sup = max(x_n(:,1));
    else
        lim_sup = max(y_n(:,1));
    end
else
    lim_inf = min(y_n(:,1)); 
    if max(x_n(:,1)) > max(y_n(:,1))
        lim_sup = max(x_n(:,1));
    else
        lim_sup = max(y_n(:,1));
    end
end
assignin ('base','lim_inf',lim_inf);
assignin ('base','lim_sup',lim_sup);
resultadosValores = cell(100,2);
k = 1; % Posicion el la cell de resultadosValores
for i=lim_inf:lim_sup
   resultadosValores{k,1} = i;
   resultadosValores{k,2} = x_n(k,2)+y_n(k,2);
   k = k+1;
end
resmat = cell2mat(resultadosValores);

% Graficamos en la GUI
stem(handles.resultado_axes,resmat(:,1),resmat(:,2),'Color',[1 0 1]);
set(handles.resultado_axes,'XMinorTick','on');
grid on

% Funcion de la operacion restar
function restar(x_n,y_n,centro_x,centro_y,handles)
if centro_x > centro_y
    diferencia = centro_x-centro_y;
    y_n=[zeros(diferencia,2);y_n];
    if length(x_n) > length(y_n)
        diferencia = length(x_n) - length(y_n);
        y_n=[y_n;zeros(diferencia,2)];
    else
        diferencia = length(y_n) - length(x_n);
        x_n=[x_n;zeros(diferencia,2)];
    end
else
    diferencia = centro_y - centro_x;
    x_n=[zeros(diferencia,2);x_n];
    if length(x_n) > length(y_n)
        diferencia = length(x_n) - length(y_n);
        y_n=[y_n;zeros(diferencia,2)];
    else
        diferencia = length(y_n) - length(x_n);
        x_n=[x_n;zeros(diferencia,2)];
    end
end
assignin ('base','x_n',x_n);
assignin ('base','y_n',y_n);
if centro_x > centro_y
    lim_inf = min(x_n(:,1));
    if max(x_n(:,1)) > max(y_n(:,1))
        lim_sup = max(x_n(:,1));
    else
        lim_sup = max(y_n(:,1));
    end
else
    lim_inf = min(y_n(:,1)); 
    if max(x_n(:,1)) > max(y_n(:,1))
        lim_sup = max(x_n(:,1));
    else
        lim_sup = max(y_n(:,1));
    end
end
assignin ('base','lim_inf',lim_inf);
assignin ('base','lim_sup',lim_sup);
resultadosValores = cell(100,2);
k = 1; % Posicion el la cell de resultadosValores
for i=lim_inf:lim_sup
   resultadosValores{k,1} = i;
   resultadosValores{k,2} = x_n(k,2)-y_n(k,2);
   k = k+1;
end
resmat = cell2mat(resultadosValores);

% Graficamos en la GUI
stem(handles.resultado_axes,resmat(:,1),resmat(:,2),'Color',[1 0 1]);
set(handles.resultado_axes,'XMinorTick','on');
grid on

% Funcion de la operacion multiplicar
function multiplicar(x_n,y_n,centro_x,centro_y,handles)
if centro_x > centro_y
    diferencia = centro_x-centro_y;
    y_n=[zeros(diferencia,2);y_n];
    if length(x_n) > length(y_n)
        diferencia = length(x_n) - length(y_n);
        y_n=[y_n;zeros(diferencia,2)];
    else
        diferencia = length(y_n) - length(x_n);
        x_n=[x_n;zeros(diferencia,2)];
    end
else
    diferencia = centro_y - centro_x;
    x_n=[zeros(diferencia,2);x_n];
    if length(x_n) > length(y_n)
        diferencia = length(x_n) - length(y_n);
        y_n=[y_n;zeros(diferencia,2)];
    else
        diferencia = length(y_n) - length(x_n);
        x_n=[x_n;zeros(diferencia,2)];
    end
end
assignin ('base','x_n',x_n);
assignin ('base','y_n',y_n);
if centro_x > centro_y
    lim_inf = min(x_n(:,1));
    if max(x_n(:,1)) > max(y_n(:,1))
        lim_sup = max(x_n(:,1));
    else
        lim_sup = max(y_n(:,1));
    end
else
    lim_inf = min(y_n(:,1)); 
    if max(x_n(:,1)) > max(y_n(:,1))
        lim_sup = max(x_n(:,1));
    else
        lim_sup = max(y_n(:,1));
    end
end
assignin ('base','lim_inf',lim_inf);
assignin ('base','lim_sup',lim_sup);
resultadosValores = cell(100,2);
k = 1; % Posicion el la cell de resultadosValores
for i=lim_inf:lim_sup
   resultadosValores{k,1} = i;
   resultadosValores{k,2} = x_n(k,2)*y_n(k,2);
   k = k+1;
end
resmat = cell2mat(resultadosValores);

% Graficamos en la GUI
stem(handles.resultado_axes,resmat(:,1),resmat(:,2),'Color',[1 0 1]);
set(handles.resultado_axes,'XMinorTick','on');
grid on

% Funcion de la operacion amplificar
function amplificar(x_n,centro_x,handles)
k = str2num(get(handles.valor_k_edit,'String'));
for i=1:length(x_n(:,1))
    x_n(i,2) = x_n(i,2)*k;
end
% Graficamos en la GUI
stem(handles.resultado_axes,x_n(:,1),x_n(:,2),'Color',[1 0 1]);
set(handles.resultado_axes,'XMinorTick','on');
grid on

% Funcion de la operacion atenuar
function atenuar(x_n,centro_x,handles)
k = str2num(get(handles.valor_k_edit,'String'));
for i=1:length(x_n(:,1))
    x_n(i,2) = x_n(i,2)/k;
end
% Graficamos en la GUI
stem(handles.resultado_axes,x_n(:,1),x_n(:,2),'Color',[1 0 1]);
set(handles.resultado_axes,'XMinorTick','on');
grid on

% Funcion de la operacion desplazar
function desplazar(x_n,centro_x,handles)
t = str2num(get(handles.valor_k_edit,'String'));
x_n_desp = cell(1,1);

if t~=0
    % Si se desplaza hacia la izquierda
    if t>0
        % Si hay que agregar elementos
        if t > centro_x - 1
            diferencia = t-(centro_x-1);
            sup = x_n(1,1);
            assignin('base','diferencia',diferencia);
            if diferencia == 1.0
                resto = zeros(1,2);
                resto(1,1) = sup-1;
            else
                posiciones = (sup-diferencia):1:(sup-1);
                resto = zeros(diferencia,2);
                resto(:,1) = posiciones';
            end
            x_n = [resto;x_n];
            x_n(:,1) = x_n(:,1)+t;
        % Si no hay que agregar
        else
            x_n(:,1) = x_n(:,1)+t;
        end
    else
        % Si hay que agregar elementos
        if abs(t) > length(x_n)-centro_x
            diferencia = abs(t)-(length(x_n)-centro_x);
            sup = x_n(length(x_n),1);
            assignin('base','diferencia',diferencia);
            if diferencia == 1.0
                resto = zeros(1,2);
                resto(1,1) = sup+1;
            else
                posiciones = (sup+1):1:(sup+diferencia);
                resto = zeros(diferencia,2);
                resto(:,1) = posiciones';
            end
            x_n = [x_n;resto];
            x_n(:,1) = x_n(:,1)+t;
        % Si no hay que agregar
        else
            x_n(:,1) = x_n(:,1)+t;
        end
    end
end

% Graficamos en la GUI
stem(handles.resultado_axes,x_n(:,1),x_n(:,2),'Color',[1 0 1]);
set(handles.resultado_axes,'XMinorTick','on');
grid on

function valor = buscarValor(x,x_n)
for i=1:length(x_n(:,1))
    if x_n(i,1) == x
        valor = x_n(i,2);
        break;
    else
        valor = 0;
    end
end

function valor = existeValor(x,x_n)
for i=1:length(x_n(:,1))
    if x_n(i,1) == x
        valor = true;
        break;
    else
        valor = false;
    end
end

% Funcion de la operacion diezmar
function diezmar(x_n,centro_x,handles)
res = cell(100,2);
k = str2double(get(handles.valor_k_edit,'String'));
j = 1;
for i=1:length(x_n(:,1))
    valor = buscarValor(x_n(i,1)*k,x_n);
    existe = existeValor(x_n(i,1)*k,x_n);
    if existe
        res{j,1} = x_n(i,1);
        res{j,2} = valor;
        j = j+1;
    end
end
res_grafica = cell2mat(res);
% Graficamos en la GUI
stem(handles.resultado_axes,res_grafica(:,1),res_grafica(:,2),'Color',[1 0 1]);
set(handles.resultado_axes,'XMinorTick','on');
grid on


% Funcion de la operacion interpolacion lineal
function interpolarLinealmente(x_n,centro_x,handles)
res = cell(500,2);
k = str2num(get(handles.valor_k_edit,'String'));
incremento_x = 1/k;
aux_inc_x = incremento_x;
pos = 1;
for i=1:length(x_n(:,1))-1
    incremento_x = aux_inc_x;
    incremento_y = (x_n(i+1,2)-x_n(i,2))/k;
    aux_inc_y = incremento_y;
    res{pos,1} = x_n(i,1);
    res{pos,2} = x_n(i,2);
    pos = pos +1;
    for j=1:k-1
        res{pos,1} = x_n(i,1)+incremento_x;
        res{pos,2} = x_n(i,2)+incremento_y;
        incremento_x = incremento_x+aux_inc_x;
        incremento_y = incremento_y+aux_inc_y;
        pos = pos +1;
    end
end
res{pos,1} = x_n(i+1,1);
res{pos,2} = x_n(i+1,2);
incremento_y = (-x_n(i+1,2))/k;
aux_inc_y = incremento_y;
incremento_x = aux_inc_x;
pos = pos+1;
for j=1:k-1
    res{pos,1} = x_n(i+1,1)+incremento_x;
    res{pos,2} = x_n(i+1,2)+incremento_y;
    incremento_x = incremento_x+aux_inc_x;
    incremento_y = incremento_y+aux_inc_y;
    pos = pos +1;
end
res_grafica = cell2mat(res);
% Graficamos en la GUI
stem(handles.resultado_axes,res_grafica(:,1),res_grafica(:,2),'Color',[1 0 1]);
set(handles.resultado_axes,'XMinorTick','on');
grid on


% Funcion de la operacion interpolar a cero
function interpolar_a_cero(x_n,centro_x,handles)
res = cell(500,2);
k = str2num(get(handles.valor_k_edit,'String'));
incremento_x = 1/k;
aux_inc_x = incremento_x;
pos = 1;
for i=1:length(x_n(:,1))-1
    incremento_x = aux_inc_x;
    res{pos,1} = x_n(i,1);
    res{pos,2} = x_n(i,2);
    pos = pos +1;
    for j=1:k-1
        res{pos,1} = x_n(i,1)+incremento_x;
        res{pos,2} = 0;
        incremento_x = incremento_x+aux_inc_x;
        pos = pos +1;
    end
end
res{pos,1} = x_n(i+1,1);
res{pos,2} = x_n(i+1,2);
incremento_x = aux_inc_x;
pos = pos+1;
for j=1:k-1
    res{pos,1} = x_n(i+1,1)+incremento_x;
    res{pos,2} = 0;
    incremento_x = incremento_x+aux_inc_x;
    pos = pos +1;
end
res_grafica = cell2mat(res);
% Graficamos en la GUI
stem(handles.resultado_axes,res_grafica(:,1),res_grafica(:,2),'Color',[1 0 1]);
set(handles.resultado_axes,'XMinorTick','on');
grid on

% Funcion de la operacion interpolacion escalon
function interpolarEscalon(x_n,centro_x,handles)
res = cell(500,2);
k = str2num(get(handles.valor_k_edit,'String'));
incremento_x = 1/k;
aux_inc_x = incremento_x;
pos = 1;
for i=1:length(x_n(:,1))-1
    incremento_x = aux_inc_x;
    res{pos,1} = x_n(i,1);
    res{pos,2} = x_n(i,2);
    pos = pos +1;
    for j=1:k-1
        res{pos,1} = x_n(i,1)+incremento_x;
        res{pos,2} = x_n(i,2);
        incremento_x = incremento_x+aux_inc_x;
        pos = pos +1;
    end
end
res{pos,1} = x_n(i+1,1);
res{pos,2} = x_n(i+1,2);
incremento_x = aux_inc_x;
pos = pos+1;
for j=1:k-1
    res{pos,1} = x_n(i+1,1)+incremento_x;
    res{pos,2} = x_n(i+1,2);
    incremento_x = incremento_x+aux_inc_x;
    pos = pos +1;
end
res_grafica = cell2mat(res);
% Graficamos en la GUI
stem(handles.resultado_axes,res_grafica(:,1),res_grafica(:,2),'Color',[1 0 1]);
set(handles.resultado_axes,'XMinorTick','on');
grid on

% Funcion de la operacion reflejo
function reflejar(x_n,centro_x,handles)
% Graficamos en la GUI
stem(handles.resultado_axes,x_n(:,1)',fliplr(x_n(:,2)'),'Color',[1 0 1]);
set(handles.resultado_axes,'XMinorTick','on');
grid on

function y_n_centro_edit_Callback(hObject, eventdata, handles)
% hObject    handle to y_n_centro_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_n_centro_edit as text
%        str2double(get(hObject,'String')) returns contents of y_n_centro_edit as a double


% --- Executes during object creation, after setting all properties.
function y_n_centro_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_n_centro_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_n_centro_edit_Callback(hObject, eventdata, handles)
% hObject    handle to x_n_centro_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_n_centro_edit as text
%        str2double(get(hObject,'String')) returns contents of x_n_centro_edit as a double


% --- Executes during object creation, after setting all properties.
function x_n_centro_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_n_centro_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valor_k_edit_Callback(hObject, eventdata, handles)
% hObject    handle to valor_k_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valor_k_edit as text
%        str2double(get(hObject,'String')) returns contents of valor_k_edit as a double


% --- Executes during object creation, after setting all properties.
function valor_k_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valor_k_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
