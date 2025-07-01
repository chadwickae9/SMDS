%Arthur Chadwick
%TCO Journal Paper
%extract data manually from SPENVIS output graph in PlotDigitizer.com/app.
%reproduce in MATLAB, and into 1 graph

data = readtable('electron_data.csv'); 
data2 = readtable('proton_data.csv'); 

data = (sortrows(data, 1));
data2 = (sortrows(data2, 1));


%log 10 axes


x = data{:,1};
y = data{:,2};
x2 = data2{:,1};
y2 = data2{:,2};

loglog(x,y,'LineWidth',2)
hold on
loglog(x2,y2,'LineWidth',2)
legend('AE-8 > 1.00 MeV','AP-8 > 50.00 MeV')

xlim([10^2 10^5])
ylim([10^0 10^8])
xlabel('Altitude (km)')
ylabel('Maximum Flux (cm^{-2} s^{-1})')