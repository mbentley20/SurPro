 clear all
%% 1 - establish database connection
%https://www.mathworks.com/help/database/ug/postgresql-odbc-windows.html
%https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

%Open Apps --> Database Explorer
%Select New --> ODBC to configure the ODBC data source
%Click on the "System DSN" tab and select "Add"
%Select the PostgreSQL ODBC driver (eg. PostgreSQL ANSI(x64))
%In the Data Source box, enter an appropriate name for the data source, such as PostgreSQL. You use this name to establish a connection to your database. 
%In the Description box, enter a description for this data source, such as PostgreSQL database.
%In the Database box, enter the name of your database.
%In the Server box, enter the name of your database server. Consult your database administrator for the name of your database server. 
%In the Port box, enter the port number. The default port number is 5432. 
%In the User Name box, enter your user name.
%In the Password box, enter your password.
%Click "Test" to test the database connection
%Click "Save" to save the setup
%% 2 - connect to the database
%%conn = database('PostgreSQL30','postgres','PavementSucks~123$5');
%%t = tables(conn,conn.DefaultCatalog,'public');
%%[indx,tf] = listdlg('ListString',t(:,1),'PromptString','Select Database','SelectionMode','single');
%sqlquery = ['SELECT * FROM public.',t{indx}];
%% Check how many IDs are in the Database
sqlquery = ['SELECT * FROM' ' "' t{indx} '"'];
curs = exec(conn,sqlquery);
curs = fetch(curs);
AA = curs.Data;
AA2 = cell2mat(AA(:,1));
AA3 = isnumeric(AA2);
%% Import from Summary File
[filename,pathname] = uigetfile({'*.xlsx','*.xls'},'Input');
%Create the Starting ID Number for the New Entries
    if AA3 == 0
        IDfin = 0;
    else
        IDfin = max(AA2);
    end
        IDstart = IDfin+1;
        
        clear A B C

%Read the Data from the Summary Sheet
        %%ExcelFile ='_Summary.xlsread';
        %%[A,B,C,D,E,G,H,I,J,K] = xlsread(fullfile(pathname,filename),'Measurement Data');
        %%[D,E,F] = xlsread(fullfile(pathname,filename),'Environmental Data');
       %%LF = F{2,5};
       %%LR = F{3,5};
       %%RF = F{4,5};
        %%RR = F{5,5};
        %%SRI = num2str (F{7,5},'%03d');
        %%Tire = F{8,5};
        %%Personnel = E{1,2}; Project = E{2,2}; Date = E{3,2}; OdometerStart = F{4,2}; OdometerEnd = F{5,2}; Vehicle = E{6,2}; Calibrator = E{7,2}; Pavement = E{8,2}; State = E{9,2};
        %%MM = E{12,2}; Long = E{12,10}; Lat = E{12,11}; Images = E{12,13};
        %%Time = datestr(F{12,1},'HH:MM:SS'); AirTemp = F{12,6}; RH = F{12,12}; CorrFactor = F{12,15};
        %%EnvData = {Personnel,Project,Date,OdometerStart,OdometerEnd,Vehicle,Calibrator,Pavement};
        %%EnvData2 = {Time,MM,AirTemp,RH,Long,Lat,Images,CorrFactor,State,PulseFile,LF,LR,RF,RR,SRI,Tire};
        %%EnvData3 = [EnvData,EnvData2];
        %%SC = size(C(2:end,:));
%% Organize Data for Export to Database
        %%for i = 2:SC(1)+1
           %% for j = 1:SC(2)
           %% NaNStatus = isnan(C{i,j});
            %%if NaNStatus == 1
                %%if j>=9 && j<=21
                    %%C{i,j} = [];
               %% else
                  %%  C{i,j} = '';
                %%end
            %%end
           %% end
       %% end
        
        %%IDnum = [IDstart:1:IDstart+SC(1)-1]';

       %% exdata = [num2cell(IDnum),C(2:end,:)];
        
       %% SED = size(exdata(:,5));
       %% for n = 1:SED(1)
           %% if isstr(exdata{n,5})==0
           %%     exdata{n,5} = num2str(exdata{n,5});
          %%  end
      %%  end
        
       %% exdata2 = repmat(EnvData3,SC(1),1);
      %%  exdata3 = [exdata,exdata2];
%Convert Columns to Right Class for Database

%MP to text
     %%   if isequal(class(exdata3{1,5}),'double')==1
            exdata3(:,5) = cellstr(num2str(cell2mat(exdata3(:,5))));
     %%   end

%         Handwritten Values to Text
%         if isequal(class(exdata3{1,7}),'double')==1
%             exdata3(:,7) = cellstr(num2str(cell2mat(exdata3(:,7))));
%         end

%Vehicle Speed to text
       %% if isequal(class(exdata3{1,8}),'double')==1
           %% exdata3(:,8) = cellstr(num2str(cell2mat(exdata3(:,8))));
       %% end
%% Export to Database
%Insert the Collected Measurement Data into the Database
      %%  colnames = {'"ID"','"Measurement_Name"','"Pulse_Num"','"Good_Bad"','"MP"','"Direction"','"Handwritten_Values"','"Vehicle_Speed"','"Comments"','"400_Hz"','"500_Hz"','"630_Hz"','"800_Hz"','"1000_Hz"','"1250_Hz"','"1600_Hz"','"2000_Hz"','"2500_Hz"','"3150_Hz"','"4000_Hz"','"5000_Hz"','"Awtd"','"Time"','"Personnel"','"Project"','"Test_Date"','"Odometer_Start"','"Odometer_End"','"Vehicle"','"Calibrator"','"Pavement"','"Time_Environmental_Measurements"','"MM_Environmental_Measurements"','"Air_Temperature"','"Relative_Humidity"','"Longitude"','"Latitude"','"Images"','"Temperature_Correction_Factor"','"State"','"Filename"','"LF"','"LR"','"RF"','"RR"','"SRI"','"Tire"'};
        
      %%  datainsert(conn,['"' t{indx} '"'],colnames,exdata3);
%% Delete Data
%1. Go into pgadmin
%2. Right click OBSIData and select "View/Edit Data" --> "All Rows"
%3. Select the rows to delete and click the delete icon