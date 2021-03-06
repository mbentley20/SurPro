function varargout = SurProGUI(varargin)
% SURPROGUI MATLAB code for SurProGUI
%      SURPROGUI, by itself, creates a new SURPROGUI or raises the existing
%      singleton*.
%
%      H = SURPROGUI returns the handle to a new SURPROGUI or the handle to
%      the existing singleton*.
%
%      SURPROGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SURPROGUI.M with the given input arguments.
%
%      SURPROGUI('Property','Value',...) creates a new SURPROGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SurProGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SurProGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SurProGUI

% Last Modified by GUIDE v2.5 03-Feb-2020 09:49:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SurProGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SurProGUI_OutputFcn, ...
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


% --- Executes just before SurProGUI is made visible.
function SurProGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SurProGUI (see VARARGIN)

%% Wheel Path 1 Refrence from our SurProGUI (Date - November 2019)
Ref_wheel1=num2cell(repmat(70.41201,12,1));

data_wheel1=get(handles.uitable1,'Data');
data_wheel1(:,2)=Ref_wheel1;
set(handles.uitable1,'Data', data_wheel1);


%%Wheel Path 2 Refrence from our SurProGUI ( Date - November 2019)
Ref_wheel2=num2cell(repmat(40.89488,12,1));

data_wheel2=get(handles.uitable2,'Data');
data_wheel2(:,2)=Ref_wheel2;
set(handles.uitable2,'Data', data_wheel2);


%% Wheel Path 3 Refrence from our SurProGUI ( Date - November 2019)
Ref_wheel3=num2cell(repmat(93.51557,12,1));

data_wheel3=get(handles.uitable3,'Data');
data_wheel3(:,2)=Ref_wheel3;
set(handles.uitable3,'Data', data_wheel3);

%% Wheel Path 4 Refrence from our SurProGUI ( Date - November 2019)

Ref_wheel4=num2cell(repmat(154.687,12,1));

data_wheel4=get(handles.uitable4,'Data');
data_wheel4(:,2)=Ref_wheel4;
set(handles.uitable4,'Data', data_wheel4);

% Choose default command line output for SurProGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SurProGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SurProGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called






% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Wheel Path  Calculations code

%%Wheel Path 1 Results code from UiTable 1%% 

tableData = get(handles.uitable1, 'Data');
WP1=str2double(tableData(:,1));
WP1 = WP1(~isnan(WP1));
avg_WP1=mean(WP1);
std_WP1=std(WP1);
cov_WP1=std_WP1./avg_WP1.*100;
ref_WP1=tableData{1,2};
abs_diff_WP1=abs(WP1-ref_WP1)
avg_diff_WP1=mean(abs_diff_WP1);
percent_diff_WP1=avg_diff_WP1./ref_WP1.*100;

idk=str2double(tableData(:,4));
idk=idk(~isnan(idk));
surpro_temp_WP1=mean(idk)

idk=str2double(tableData(:,5));
idk=idk(~isnan(idk));
kestral_temp_WP1=mean(idk)




data_WP1=[avg_WP1;std_WP1;cov_WP1;avg_diff_WP1;percent_diff_WP1;surpro_temp_WP1;kestral_temp_WP1];

%%Wheel Path 2 Results code from UITable2

tableData = get(handles.uitable2, 'Data');
WP2=str2double(tableData(:,1));
WP2 = WP2(~isnan(WP2));
avg_WP2=mean(WP2);
std_WP3=std(WP2);
cov_WP2=std_WP3./avg_WP2.*100;
ref_WP2=tableData{2,2};
abs_diff_WP2=abs(WP2-ref_WP2)
avg_diff_WP2=mean(abs_diff_WP2);
percent_diff_WP2=avg_diff_WP2./ref_WP2.*100;

idk=str2double(tableData(:,4));
idk=idk(~isnan(idk));
surpro_temp_WP3=mean(idk)

idk=str2double(tableData(:,5));
idk=idk(~isnan(idk));
kestral_temp_WP2=mean(idk)

%%if cov_WP2 >=3 
    'Fail'
%%end 

%%vpass_or_fail_WP2=


data_WP2=[avg_WP2;std_WP3;cov_WP2;avg_diff_WP2;percent_diff_WP2;surpro_temp_WP3;kestral_temp_WP2];



%Wheel Path 3 Results code from UITable3

tableData = get(handles.uitable3, 'Data');
WP3=str2double(tableData(:,1));
WP3 = WP3(~isnan(WP3));
avg_WP3=mean(WP3);
std_WP3=std(WP3);
cov_WP3=std_WP3./avg_WP3.*100;
ref_WP3=tableData{2,2};
abs_diff_WP3=abs(WP3-ref_WP3)
avg_diff_WP3=mean(abs_diff_WP3);
percent_diff_WP3=avg_diff_WP3./ref_WP3.*100;

idk=str2double(tableData(:,4));
idk=idk(~isnan(idk));
surpro_temp_WP3=mean(idk)

idk=str2double(tableData(:,5));
idk=idk(~isnan(idk));
kestral_temp_WP3=mean(idk)

data_WP3=[avg_WP3;std_WP3;cov_WP3;avg_diff_WP3;percent_diff_WP3;surpro_temp_WP3;kestral_temp_WP3];


%Wheel Path 4 Results code from UITable4

tableData = get(handles.uitable4, 'Data');
WP4=str2double(tableData(:,1));
WP4 = WP4(~isnan(WP4));
avg_WP4=mean(WP4);
std_WP4=std(WP4);
cov_WP4=std_WP4./avg_WP4.*100;
ref_WP4=tableData{2,2};
abs_diff_WP4=abs(WP4-ref_WP4)
avg_diff_WP4=mean(abs_diff_WP4);
percent_diff_WP4=avg_diff_WP4./ref_WP4.*100;

idk=str2double(tableData(:,4));
idk=idk(~isnan(idk));
surpro_temp_WP4=mean(idk)

idk=str2double(tableData(:,5));
idk=idk(~isnan(idk));
kestral_temp_WP4=mean(idk)



data_WP4=[avg_WP4;std_WP4;cov_WP4;avg_diff_WP4;percent_diff_WP4;surpro_temp_WP4;kestral_temp_WP4];


%Table 5 results getting the data 


table5_data=[data_WP1,data_WP2,data_WP3,data_WP4];
set(handles.uitable5,'Data',table5_data)


function texto_Callback(hObject, eventdata, handles)
edit=get(hObject,'string');
set(handles.slider,'value',str2num(edit));
guidata(hObject,handles); 








% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





% --- Executes during object creation, after setting all properties.
function Date_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Date (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function Personel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Personel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function location_CreateFcn(hObject, eventdata, handles)
% hObject    handle to location (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in month.
function month_Callback(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns month contents as cell array
%        contents{get(hObject,'Value')} returns selected item from month


% --- Executes during object creation, after setting all properties.
function month_CreateFcn(hObject, eventdata, handles)
% hObject    handle to month (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in year.
function year_Callback(hObject, eventdata, handles)
% hObject    handle to year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns year contents as cell array
%        contents{get(hObject,'Value')} returns selected item from year


% --- Executes during object creation, after setting all properties.
function year_CreateFcn(hObject, eventdata, handles)
% hObject    handle to year (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_Callback(hObject, eventdata, handles)
valor=get(hObject,'value');
set(handles.texto,'string',(num2str(round(valor,0))));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on key press with focus on slider and none of its controls.
function slider_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to slider (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in outcomes.
function outcomes_Callback(hObject, eventdata, handles)
% hObject    handle to outcomes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox6.
  % hObject    handle to listbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: contents = cellstr(get(hObject,'String')) returns listbox6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox6



% --- Executes during object creation, after setting all properties.
function listbox6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in listbox7.
function listbox7_Callback(hObject, eventdata, handles)
% hObject    handle to listbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox7


% --- Executes during object creation, after setting all properties.
function listbox7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox8.
function listbox8_Callback(hObject, eventdata, handles)
% hObject    handle to listbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox8


% --- Executes during object creation, after setting all properties.
function listbox8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox9.
function listbox9_Callback(hObject, eventdata, handles)
% hObject    handle to listbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox9


% --- Executes during object creation, after setting all properties.
function listbox9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
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


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
set(handles.uitable1,'ColumnEditable',true);





% --- Executes when entered data in editable cell(s) in uitable5.
function uitable5_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable5 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable5,'ColumnEditable',true);



% --- Executes on key press with focus on listbox6 and none of its controls.
function listbox6_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to listbox6 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATAmatlab 


% --- Executes during object deletion, before destroying properties.
function uitable1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

A=rand(1,8);
th=uitable5('Data', A);
A(1,:)=[];
set(th, 'Data', A);


% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


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


% --- Executes on button press in database.
function database_Callback(~, eventdata, handles)
% hObject    handle to database (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in Uitable2.
function Uitable2_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to Uitable2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
set(handles.Uitable2,'ColumnEditable',true);





% --- Executes when entered data in editable cell(s) in Uitable3.
function Uitable3_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to Uitable3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
set(handles.Uitable3,'ColumnEditable',true);


% --- Executes when entered data in editable cell(s) in Uitable4.
function Uitable4_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to Uitable4 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
set(handles.Uitable4,'ColumnEditable',true);


% --- Executes when entered data in editable cell(s) in uitable7.
function uitable7_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable7 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable7,'ColumnEditable',true);


% --- Executes when entered data in editable cell(s) in uitable1.
function Uitable1_CellEditCallback(hObject, eventdata, handles)
%%data_wheel1=get(handles.uitable1,'Data')
%data_wheel1(:,3)= data_wheel1{(:,2) - data_wheel1(:,1)}
%%set(handles.uitable1,'Data',data_wheel1)

%set(handles.uitable1,'Data', data_wheel1);
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)

 


% --- Executes during object creation, after setting all properties.
function Uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


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


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in uitable6.
function uitable6_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable6 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function uitable6_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uitable6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uitable6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uitable6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on uitable6 and none of its controls.
function uitable6_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to uitable6 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected cell(s) is changed in uitable7.
function uitable7_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable7 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function uitable7_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uitable7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uitable7_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uitable7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on uitable7 and none of its controls.
function uitable7_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to uitable7 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in uitable3.
function uitable3_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uitable4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected cell(s) is changed in uitable5.
function uitable5_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable5 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uitable5_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uitable5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function uitable5_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uitable5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
