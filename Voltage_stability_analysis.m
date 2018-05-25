function varargout = Voltage_stability_analysis(varargin)
% VOLTAGE_STABILITY_ANALYSIS MATLAB code for Voltage_stability_analysis.fig
%      VOLTAGE_STABILITY_ANALYSIS, by itself, creates a new VOLTAGE_STABILITY_ANALYSIS or raises the existing
%      singleton*.
%
%      H = VOLTAGE_STABILITY_ANALYSIS returns the handle to a new VOLTAGE_STABILITY_ANALYSIS or the handle to
%      the existing singleton*.
%
%      VOLTAGE_STABILITY_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VOLTAGE_STABILITY_ANALYSIS.M with the given input arguments.
%
%      VOLTAGE_STABILITY_ANALYSIS('Property','Value',...) creates a new VOLTAGE_STABILITY_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Voltage_stability_analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Voltage_stability_analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Voltage_stability_analysis

% Last Modified by GUIDE v2.5 25-May-2018 11:25:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Voltage_stability_analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @Voltage_stability_analysis_OutputFcn, ...
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


% --- Executes just before Voltage_stability_analysis is made visible.
function Voltage_stability_analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Voltage_stability_analysis (see VARARGIN)
% Choose default command line output for Voltage_stability_analysis
handles.output = hObject;


% TEXT annotations need an axes as parent so create an invisible axes which
% is as big as the figure
handles.laxis = axes('parent',hObject,'units','normalized','position',[0 0 1 1],'visible','off');
% Find all static text UICONTROLS whose 'Tag' starts with latex_
lbls = findobj(hObject,'-regexp','tag','latex_*');
for i=1:length(lbls)
      l = lbls(i);
      % Get current text, position and tag
      set(l,'units','normalized');
      s = get(l,'string');
      p = get(l,'position');
      t = get(l,'tag');
      % Remove the UICONTROL
      delete(l);
      % Replace it with a TEXT object 
      handles.(t) = text(p(1),p(2),s,'interpreter','latex');
end

%Plot unitary circle
axes(handles.axes2);
angle=linspace(0 , 2*pi , 100);
plot(cos(angle),sin(angle),'k');
axis([-1.1 1.1 -1.1 1.1]);   grid on;
title('Closed loop poles in z-plane');
  %Insert logos in axes 4
  axes(handles.axes4); 
  imshow('logos.jpg');
  %Insert Control Figure in axes 7
  axes(handles.axes7); 
  imshow('Plant_control.jpg');
 %Plot resistances:
calculogeral(hObject, eventdata, handles)

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Voltage_stability_analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Voltage_stability_analysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function rpv_min_Callback(hObject, eventdata, handles)
% hObject    handle to rpv_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calculogeral(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of rpv_min as text
%        str2double(get(hObject,'String')) returns contents of rpv_min as a double


% --- Executes during object creation, after setting all properties.
function rpv_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rpv_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rpv_max_Callback(hObject, eventdata, handles)
% hObject    handle to rpv_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calculogeral(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of rpv_max as text
%        str2double(get(hObject,'String')) returns contents of rpv_max as a double


% --- Executes during object creation, after setting all properties.
function rpv_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rpv_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rpvest_min_Callback(hObject, eventdata, handles)
% hObject    handle to rpvest_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calculogeral(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of rpvest_min as text
%        str2double(get(hObject,'String')) returns contents of rpvest_min as a double


% --- Executes during object creation, after setting all properties.
function rpvest_min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rpvest_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rpvest_max_Callback(hObject, eventdata, handles)
% hObject    handle to rpvest_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calculogeral(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of rpvest_max as text
%        str2double(get(hObject,'String')) returns contents of rpvest_max as a double


% --- Executes during object creation, after setting all properties.
function rpvest_max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rpvest_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rpvestmax_Callback(hObject, eventdata, handles)
% hObject    handle to rpvestmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calculogeral(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of rpvestmax as text
%        str2double(get(hObject,'String')) returns contents of rpvestmax as a double


% --- Executes during object creation, after setting all properties.
function rpvestmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rpvestmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rpvmax_Callback(hObject, eventdata, handles)
% hObject    handle to rpvmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calculogeral(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of rpvmax as text
%        str2double(get(hObject,'String')) returns contents of rpvmax as a double


% --- Executes during object creation, after setting all properties.
function rpvmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rpvmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function rpvestmin_Callback(hObject, eventdata, handles)
% hObject    handle to rpvestmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calculogeral(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of rpvestmin as text
%        str2double(get(hObject,'String')) returns contents of rpvestmin as a double


% --- Executes during object creation, after setting all properties.
function rpvestmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rpvestmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Cpv_Callback(hObject, eventdata, handles)
% hObject    handle to Cpv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Cpv as text
%        str2double(get(hObject,'String')) returns contents of Cpv as a double


% --- Executes during object creation, after setting all properties.
function Cpv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Cpv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ctol_Callback(hObject, eventdata, handles)
% hObject    handle to Ctol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ctol as text
%        str2double(get(hObject,'String')) returns contents of Ctol as a double


% --- Executes during object creation, after setting all properties.
function Ctol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ctol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fcv_Callback(hObject, eventdata, handles)
% hObject    handle to fcv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fcv as text
%        str2double(get(hObject,'String')) returns contents of fcv as a double


% --- Executes during object creation, after setting all properties.
function fcv_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fcv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fs2_Callback(hObject, eventdata, handles)
% hObject    handle to fs2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fs2 as text
%        str2double(get(hObject,'String')) returns contents of fs2 as a double


% --- Executes during object creation, after setting all properties.
function fs2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fs2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function latex_text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to latex_text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function latex_text8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to latex_text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over latex_text8.
function latex_text8_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to latex_text8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function rpvmin_Callback(hObject, eventdata, handles)
% hObject    handle to rpvmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calculogeral(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of rpvmin as text
%        str2double(get(hObject,'String')) returns contents of rpvmin as a double


% --- Executes during object creation, after setting all properties.
function rpvmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rpvmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function cm_draw_line_Callback(hObject, eventdata, handles)
% hObject    handle to cm_draw_line (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imline;

% --------------------------------------------------------------------
function cm_draw_rectangle_Callback(hObject, eventdata, handles)
% hObject    handle to cm_draw_rectangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imrect;

% --------------------------------------------------------------------
function cm_draw_Callback(hObject, eventdata, handles)
% hObject    handle to cm_draw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%calculo_root_locus(hObject, eventdata, handles);
guidata(hObject, handles); % Save the updated structure
flag1=str2num(get(handles.flag_calc,'String'));
flag1=flag1+1;
set(handles.flag_calc,'String',flag1);
guidata(hObject, handles); % Save the updated structure
calculo_root_locus(hObject, eventdata, handles);

function calculogeral(hObject, eventdata, handles)
%Variables as numbers
rpvmin=str2num(get(handles.rpvmin,'String'));
rpvmax=str2num(get(handles.rpvmax,'String'));
rpvestmin=str2num(get(handles.rpvestmin,'String'));
rpvestmax=str2num(get(handles.rpvestmax,'String'));
% Ts2=1/(str2num(get(handles.fs2,'String')));
% Cpv=str2num(get(handles.Cpv,'String'))*1e-6; 
% Ctol=str2num(get(handles.Ctol,'String'));
%     Cpvmin=(1-0.01*Ctol)*Cpv;       Cpvmax=(1+0.01*Ctol)*Cpv;
% fcv = str2num(get(handles.fcv,'String'));

%Plotting rpv and estimated rpv
axes(handles.axes1);
%plot([rpvmin rpvmax rpvmax rpvmin rpvmin],[rpvestmin rpvestmin rpvestmax rpvestmax rpvestmin],'k', 'LineWidth',1);
fill1 = fill([rpvmin rpvmin rpvmax rpvmax rpvmin],[rpvestmax rpvestmin rpvestmin rpvestmax rpvestmax],[0.9 0.9 0.9]);
hold on
plot([rpvmin rpvmin],[rpvestmax rpvestmin],'m', 'LineWidth',1);         %AB
plot([rpvmin rpvmax],[rpvestmin rpvestmin],'b', 'LineWidth',1);         %BC
plot([rpvmax rpvmax],[rpvestmin rpvestmax],'c', 'LineWidth',1);         %CD
plot([rpvmax rpvmin],[rpvestmax rpvestmax],'g', 'LineWidth',1);         %DA
xymax=1.1*max([rpvmax rpvestmax]);
xymin=min([min([rpvmin rpvestmin])-0.09*xymax 0]);
axis([xymin xymax xymin xymax]);
deltaABCD=0.05*(xymax-xymin);
text(rpvmin-deltaABCD,rpvestmax,'A');       text(rpvmin-deltaABCD,rpvestmin,'B');
text(rpvmax+deltaABCD/2,rpvestmin,'C');           text(rpvmax+deltaABCD/2,rpvestmax,'D');
rponto1=max([rpvmin rpvestmin]);
rponto2=min([rpvmax rpvestmax]);
plot([rponto1 rponto2],[rponto1 rponto2],'r', 'LineWidth',1.5);
texto201=text((rponto2+rponto1)/2-2,(rponto2+rponto1)/2+5,'$r_{pv}=\hat{r}_{pv}$');
set(texto201,'Interpreter','Latex');    set(texto201,'Color',[1 0 0]);   set(texto201,'FontSize',12);
clear rponto1 rponto2
xlabel('$r_{pv}$','Interpreter','Latex')
ylabel('$\hat{r}_{pv}$','Interpreter','Latex')
h1 = get(gca, 'xlabel');
oldpos = get(h1, 'Position')
set(h1, 'Position', oldpos + [0, (xymax-xymin)*0.05, 0])
title('Operation point - \textbf{\textit{r}} plane','Interpreter','Latex')
grid on
hold off


function calculo_root_locus(hObject, eventdata, handles)

rpvmin=str2num(get(handles.rpvmin,'String'));
rpvmax=str2num(get(handles.rpvmax,'String'));
rpvestmin=str2num(get(handles.rpvestmin,'String'));
rpvestmax=str2num(get(handles.rpvestmax,'String'));
Ts2=1/(str2num(get(handles.fs2,'String')));
Cpv=str2num(get(handles.Cpv,'String'))*1e-6; 
Ctol=str2num(get(handles.Ctol,'String'));
    Cpvmin=(1-0.01*Ctol)*Cpv;       Cpvmax=(1+0.01*Ctol)*Cpv;
fcv = str2num(get(handles.fcv,'String'));
Ctolflag=get(handles.checkbox2,'Value');
%Calculating root locus
polomax=0;
kv=1-exp(-2*pi*fcv*Ts2);
np=str2num(get(handles.num_pontos,'String'))/4;
%%%Line AB
rpvAB=rpvmin;                                  % rpv=4.25
rpv_estAB=linspace (rpvestmax,rpvestmin,np);   % rpv_est = 9 to 60
pAB0=zeros(np,2);           pAB1=zeros(np,2);           pAB2=zeros(np,2); 
for num=1:np
kc=-1/(rpv_estAB(num)*(1-exp(-Ts2/(Cpv*rpv_estAB(num)))));      zc=exp(-Ts2/(Cpv*rpv_estAB(num)));
Cv=kv*kc*tf([1 -zc],[1 -1],Ts2);
ppv=exp(-Ts2/(Cpv*rpvAB));              kpv=-rpvAB*(1-ppv);         %Nominal capacitance Cpv
Gv=tf([0  kpv],[1 -ppv],Ts2);
gmf=minreal(feedback(Cv,Gv));
pAB0(num,:)=pzmap(gmf)';
if Ctolflag
    ppv=exp(-Ts2/(Cpvmin*rpvAB));              kpv=-rpvAB*(1-ppv);         %Minimum Cpv as tolerance
    Gv=tf([0  kpv],[1 -ppv],Ts2);
    gmf=minreal(feedback(Cv,Gv));
    pAB1(num,:)=pzmap(gmf)';
    ppv=exp(-Ts2/(Cpvmax*rpvAB));              kpv=-rpvAB*(1-ppv);         %Maximum Cpv as tolerance
    Gv=tf([0  kpv],[1 -ppv],Ts2);
    gmf=minreal(feedback(Cv,Gv));
    pAB2(num,:)=pzmap(gmf)';
    polomax1=max(abs([pAB0(num,:) pAB1(num,:) pAB2(num,:)]));           %Updates the maximum pole
else polomax1=max(abs([pAB0(num,:)]));
end
if (polomax <  polomax1)
    polomax= polomax1;
end
end
%%% Line BC
rpvBC=linspace (rpvmin,rpvmax,np);            % rpv=4.25 to 60.3
rpv_estBC=rpvestmin;                          % rpv_est=6
pBC0=zeros(np,2);       pBC1=zeros(np,2);       pBC2=zeros(np,2);
for num=1:np    
kc=-1/(rpv_estBC*(1-exp(-Ts2/(Cpv*rpv_estBC))));    zc=exp(-Ts2/(Cpv*rpv_estBC));
Cv=kv*kc*tf([1 -zc],[1 -1],Ts2);
ppv=exp(-Ts2/(Cpv*rpvBC(num)));         kpv=-rpvBC(num)*(1-ppv);        %Nom Cpv
Gv=tf([0  kpv],[1 -ppv],Ts2);
gmf=minreal(feedback(Cv,Gv));
pBC0(num,:)=pzmap(gmf)';
if Ctolflag
    ppv=exp(-Ts2/(Cpvmin*rpvBC(num)));         kpv=-rpvBC(num)*(1-ppv);     %Minm Cpv
    Gv=tf([0  kpv],[1 -ppv],Ts2);
    gmf=minreal(feedback(Cv,Gv));
    pBC1(num,:)=pzmap(gmf)';
    ppv=exp(-Ts2/(Cpvmax*rpvBC(num)));         kpv=-rpvBC(num)*(1-ppv);     %Max Cpv
    Gv=tf([0  kpv],[1 -ppv],Ts2);
    gmf=minreal(feedback(Cv,Gv));
    pBC2(num,:)=pzmap(gmf)';
    polomax1=max(abs([pBC0(num,:) pBC1(num,:) pBC2(num,:)]));           %Updates the maximum pole
else  polomax1=max(abs([pBC0(num,:)]));
end
if (polomax <  polomax1)
    polomax= polomax1;
end
end
%%% Line CD
rpvCD=rpvmax;                                            % rpv=60.3
rpv_estCD=linspace (rpvestmin,rpvestmax,np);            % rpv_est=6 to 60
pCD0=zeros(np,2);       pCD1=zeros(np,2);           pCD2=zeros(np,2);
for num=1:np    
kc=-1/(rpv_estCD(num)*(1-exp(-Ts2/(Cpv*rpv_estCD(num)))));    zc=exp(-Ts2/(Cpv*rpv_estCD(num)));
Cv=kv*kc*tf([1 -zc],[1 -1],Ts2);
ppv=exp(-Ts2/(Cpv*rpvCD));         kpv=-rpvCD*(1-ppv);      %Nom Cpv
Gv=tf([0  kpv],[1 -ppv],Ts2);
gmf=minreal(feedback(Cv,Gv));
pCD0(num,:)=pzmap(gmf)';
if Ctolflag
    ppv=exp(-Ts2/(Cpvmin*rpvCD));         kpv=-rpvCD*(1-ppv);   %Min Cpv
    Gv=tf([0  kpv],[1 -ppv],Ts2);
    gmf=minreal(feedback(Cv,Gv));
    pCD1(num,:)=pzmap(gmf)';
    ppv=exp(-Ts2/(Cpvmax*rpvCD));         kpv=-rpvCD*(1-ppv);   %Max Cpv
    Gv=tf([0  kpv],[1 -ppv],Ts2);
    gmf=minreal(feedback(Cv,Gv));
    pCD2(num,:)=pzmap(gmf)';
    polomax1=max(abs([pCD0(num,:) pCD1(num,:) pCD2(num,:)]));           %Updates the maximum pole
else polomax1=max(abs([pCD0(num,:)]));
end
if (polomax <  polomax1)
    polomax= polomax1;
end
end
%%% Line DA
rpvDA=linspace (rpvmax,rpvmin,np);            % rpv=60.3 to 4.25
rpv_estDA=rpvestmax;                          % rpv_est=60
pDA0=zeros(np,2);           pDA1=zeros(np,2);       pDA2=zeros(np,2);
for num=1:np    
kc=-1/(rpv_estDA*(1-exp(-Ts2/(Cpv*rpv_estDA))));    zc=exp(-Ts2/(Cpv*rpv_estDA));
Cv=kv*kc*tf([1 -zc],[1 -1],Ts2);
ppv=exp(-Ts2/(Cpv*rpvDA(num)));         kpv=-rpvDA(num)*(1-ppv);    %Nom Cpv
Gv=tf([0  kpv],[1 -ppv],Ts2);
gmf=minreal(feedback(Cv,Gv));
pDA0(num,:)=pzmap(gmf)';
if Ctolflag
    ppv=exp(-Ts2/(Cpvmin*rpvDA(num)));         kpv=-rpvDA(num)*(1-ppv);    %Min Cpv
    Gv=tf([0  kpv],[1 -ppv],Ts2);
    gmf=minreal(feedback(Cv,Gv));
    pDA1(num,:)=pzmap(gmf)';
    ppv=exp(-Ts2/(Cpvmax*rpvDA(num)));         kpv=-rpvDA(num)*(1-ppv);    %Max Cpv
    Gv=tf([0  kpv],[1 -ppv],Ts2);
    gmf=minreal(feedback(Cv,Gv));
    pDA2(num,:)=pzmap(gmf)';
    polomax1=max(abs([pDA0(num,:) pDA1(num,:) pDA2(num,:)]));           %Updates the maximum pole
else polomax1=max(abs([pDA0(num,:)]));
end
if (polomax <  polomax1)
    polomax= polomax1;
end
end
    
%Plotting the root locus
%Unitary circle
axes(handles.axes2);
angle=linspace(0 , 2*pi , 100);
plot(cos(angle),sin(angle),'k');
axis([-1.1 1.1 -1.1 1.1]);   grid on;
title('Closed loop poles in z-plane');
hold on
%Fill
fill([real(pAB0(:,1)) ;  real(pBC0(:,1)) ; real(pCD0(:,1));  real(pDA0(:,1)); real(pAB0(1,1))], [imag(pAB0(:,1)) ;  imag(pBC0(:,1)) ; imag(pCD0(:,1));  imag(pDA0(:,1)); imag(pAB0(1,1))], [0.9 0.9 0.9],'EdgeColor','none');
fill([real(pAB0(:,2)) ;  real(pBC0(:,2)) ; real(pCD0(:,2));  real(pDA0(:,2)); real(pAB0(1,2))], [imag(pAB0(:,2)) ;  imag(pBC0(:,2)) ; imag(pCD0(:,2));  imag(pDA0(:,2)); imag(pAB0(1,2))], [0.9 0.9 0.9],'EdgeColor','none');
%Plot AB
plot(real(pAB0(:,1)),imag(pAB0(:,1)),'m.','LineWidth',2);         plot(real(pAB0(:,2)),imag(pAB0(:,2)),'m.','LineWidth',2);
text(real(pAB0(1,1)),imag(pAB0(1,1)),'A');                               text(real(pAB0(1,2)),imag(pAB0(1,2)),'A');
%Plot BC
plot(real(pBC0(:,1)),imag(pBC0(:,1)),'b.','LineWidth',2);         plot(real(pBC0(:,2)),imag(pBC0(:,2)),'b.','LineWidth',2);
text(real(pBC0(1,1)),imag(pBC0(1,1)),'B');                              text(real(pBC0(1,2)),imag(pBC0(1,2)),'B');
%Plot CD
plot(real(pCD0(:,1)),imag(pCD0(:,1)),'c.','LineWidth',2);         plot(real(pCD0(:,2)),imag(pCD0(:,2)),'c.','LineWidth',2);
text(real(pCD0(1,1)),imag(pCD0(1,1)),'C');                              text(real(pCD0(1,2)),imag(pCD0(1,2)),'C');
%Plot DA
plot(real(pDA0(:,1)),imag(pDA0(:,1)),'g.','LineWidth',2);         plot(real(pDA0(:,2)),imag(pDA0(:,2)),'g.','LineWidth',2);
text(real(pDA0(1,1)),imag(pDA0(1,1)),'D');                              text(real(pDA0(1,2)),imag(pDA0(1,2)),'D');

if Ctolflag          %Plots if capacitor tolerance is checked
    colorCtoln=[0.5 0 0];
    colorCtolp=[0 0.5 0];
    plot(real(pAB1(:,1)),imag(pAB1(:,1)),'.','MarkerEdgeColor',colorCtoln);         plot(real(pAB1(:,2)),imag(pAB0(:,2)),'.','MarkerEdgeColor',colorCtoln);       %Plot Cpvmin
    plot(real(pAB2(:,1)),imag(pAB2(:,1)),'.','MarkerEdgeColor',colorCtolp);         plot(real(pAB2(:,2)),imag(pAB2(:,2)),'.','MarkerEdgeColor',colorCtolp);       %Plot Cpvmax
    plot(real(pBC1(:,1)),imag(pBC1(:,1)),'.','MarkerEdgeColor',colorCtoln);         plot(real(pBC1(:,2)),imag(pBC1(:,2)),'.','MarkerEdgeColor',colorCtoln);       %Plot Cpvmin
    plot(real(pBC2(:,1)),imag(pBC2(:,1)),'.','MarkerEdgeColor',colorCtolp);         plot(real(pBC2(:,2)),imag(pBC2(:,2)),'.','MarkerEdgeColor',colorCtolp);       %Plot Cpvmax
    plot(real(pCD1(:,1)),imag(pCD1(:,1)),'.','MarkerEdgeColor',colorCtoln);         plot(real(pCD1(:,2)),imag(pCD1(:,2)),'.','MarkerEdgeColor',colorCtoln);       %Plot Cpvmin
    plot(real(pCD2(:,1)),imag(pCD2(:,1)),'.','MarkerEdgeColor',colorCtolp);         plot(real(pCD2(:,2)),imag(pCD2(:,2)),'.','MarkerEdgeColor',colorCtolp);       %Plot Cpvmax
    plot(real(pDA1(:,1)),imag(pDA1(:,1)),'.','MarkerEdgeColor',colorCtoln);         plot(real(pDA1(:,2)),imag(pDA1(:,2)),'.','MarkerEdgeColor',colorCtoln);       %Plot Cpvmin
    plot(real(pDA2(:,1)),imag(pDA2(:,1)),'.','MarkerEdgeColor',colorCtolp);         plot(real(pDA2(:,2)),imag(pDA2(:,2)),'.','MarkerEdgeColor',colorCtolp);       %Plot Cpvmax
    t92=text(0.75, -0.8, strcat('C_{pv}-',get(handles.Ctol,'String'),' %'));
    set(t92,'Color',colorCtoln);     set(t92,'Interpreter','Tex');
    t93=text(0.75, -0.95, strcat('C_{pv}+',get(handles.Ctol,'String'),' %'));
    set(t93,'Color',colorCtolp);     set(t93,'Interpreter','Tex');
end
    

%Other plots
plot(exp(-2*pi*fcv*Ts2),0,'rs','MarkerFaceColor','r');          %Desired closed loop pole (red square)
if (polomax<1)
        t91=text(0.6,1,'Stable Loop');
else
        t91=text(0.3,1,'Possibly Unstable Loop');
        set(t91,'Color','red');
end
hold off



function flag_calc_Callback(hObject, eventdata, handles)
% hObject    handle to flag_calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of flag_calc as text
%        str2double(get(hObject,'String')) returns contents of flag_calc as a double

% --- Executes during object creation, after setting all properties.
function flag_calc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to flag_calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2



function num_pontos_Callback(hObject, eventdata, handles)
% hObject    handle to num_pontos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_pontos as text
%        str2double(get(hObject,'String')) returns contents of num_pontos as a double


% --- Executes during object creation, after setting all properties.
function num_pontos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_pontos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
