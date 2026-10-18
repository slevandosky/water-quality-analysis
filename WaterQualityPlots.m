%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 12);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["STATIONCODE", "LOCATIONS", "STATE", "Temp", "D_O__mg_l_", "PH", "CONDUCTIVITY__mhos_cm_", "B_O_D__mg_l_", "NITRATENANN_NITRITENANN_mg_l_", "FECALCOLIFORM_MPN_100ml_", "TOTALCOLIFORM_MPN_100ml_Mean", "year"];
opts.VariableTypes = ["double", "string", "categorical", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "LOCATIONS", "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["LOCATIONS", "STATE"], "EmptyFieldRule", "auto");

% Import the data
water_dataX = readtable("C:\Users\sleva\OneDrive\downloads\water_dataX.csv", opts);


%% Clear temporary variables
clear opts

%Temperature vs Dissolved Oxygen Scatter Plot
scatter(water_dataX.Temp, water_dataX.D_O__mg_l_')

xlabel('Temperature (°C)')
ylabel('Dissolved Oxygen (mg/L)')
title('Temperature vs. Dissolved Oxygen')

grid on

%pH vs Conductivity Scatter Plot

figure;
scatter(water_dataX.PH, water_dataX.CONDUCTIVITY__mhos_cm_)

xlabel('pH')
ylabel('Conductivity (mhos/cm)')
title('pH vs. Conductivity')

grid on
