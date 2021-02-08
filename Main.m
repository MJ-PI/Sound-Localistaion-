%%
delete(instrfindall)
clear all
close all 
clc

%%                                      MAIN LOOP

tic                         % Begin Timer 

Fs = 115200;                % Baudrate
s = serialport('COM15',Fs); % Open Serial Port at Fs = 115200Hz

%                                   [SIGNAL STORING]
for j = 1:4
    

FSS = 34000;                % 34000 ACTUAL SAMPLING RATE
i = 0;

while (i < 200)
i = i + 1;

data = read(s,13,'string');
sep = str2num(data);

if sep(1) == 1
   break
end 

M1(i) = sep(1); 
M2(i) = sep(2);
M3(i) = sep(3);

end
N1 = M1(100:end);  % To remove link between sampling sections
N2 = M2(100:end);
N3 = M3(100:end);

%                                          [TDoA Algorithm]
[Tau_AB] = TDOA(N2,N1,FSS);
[Tau_AC] = TDOA(N3,N1,FSS);
[Tau_BC] = TDOA(N2,N3,FSS);
%                                           [DoA Algorithm]
[Alpha_one, Alpha_two, Alpha_three, Alpha_avg] = DOA(Tau_AB/1e6,Tau_AC/1e6,Tau_BC/1e6); 
alpha2(j) = Alpha_avg;
fprintf('DOA(%1.0f) = %3.2f ° \n',j, Alpha_avg) 


end 
A = (alpha2(1)+alpha2(2)+alpha2(3)+alpha2(4))/(4); % Averaged DoAs to give DoA_final
collect_t = toc;                                   % end timer 
fprintf('Alpha average = %3.2f ° \n\n', A)         % Print Result

clear s                   % Clear serial port 
delete(instrfindall)        



%%
%  Plot Unfiltered & Filtered Signals
      %%
      
figure(2)
plot(N1,'Color',[0, 0.4470, 0.7410])
hold on
plot(N2)
plot(N3,'Color',[0, 0.5, 0])
%title('Unfiltered Signals');
legend('Signal 1','Signal 2', 'Signal 3');
xlabel('Sample(i)');
ylabel('Digital Value');
hold off



%                                        GCC of Unfiltered Data

[XC1,lag1] = xcorr(N1,N2);                  
XC1= XC1./max(XC1);
[maxY1, indexOfMaxY1] = max(XC1);              
xAtMaxY1 = lag1(indexOfMaxY1);                                 
                             	  
Ts = 1/FSS;  
Sim_Time = ((xAtMaxY1)*Ts)*1e6;         

[Tau_12] = TDOA(N2,N1,FSS);


%                                     Plot GCC of Unfiltered Data
figure(3)
plot(lag1,XC1)
hold on
yline(0);
xline(0);
plot(xAtMaxY1,maxY1,'o', 'MarkerFaceColor','red','MarkerSize', 5)
ylabel('Cross Correlation');
xlabel('Lag');
axis tight;
title('GCC')
hold off


%%                 Filter       and filter plot  

f = designfilt('lowpassfir', 'FilterOrder', 8, 'CutoffFrequency', 10, 'SampleRate', FSS); %% This Filter aint workig

FM1 = filter(f,M1);
FM2 = filter(f,M2);
FM3 = filter(f,M3);

D1 = FM1(100:end);
D2 = FM2(100:end);
D3 = FM3(100:end);

subplot(2,1,2)
plot(N1,'Color',[0, 0.4470, 0.7410])
hold on
plot(N2)
plot(N3,'Color',[0, 0.5, 0])
title('Filtered Signals');
legend('Signal 1','Signal 2', 'Signal 3');
xlabel('Sample(i)');
ylabel('Digital Value');
hold off 

%%                  Print Individual Filtred and Unfiltered Signals
figure(1)
subplot(3,1,1)
plot(M1,'k')
hold on
plot(FM1,'Color',[0, 0.4470, 0.7410])
title('Signal 1');
legend('Unfiltered','Filtered');
xlabel('Sample(i)');
ylabel('Digital Value');

subplot(3,1,2)
plot(M2,'k')
hold on
plot(FM2)
title('Signal 2');
legend('Unfiltered','Filtered');
xlabel('Sample(i)');
ylabel('Digital Value');

subplot(3,1,3)
plot(M3,'k')
hold on
plot(FM3,'Color',[0 0.5 0])
title('Signal 3');
legend('Unfiltered','Filtered');
xlabel('Sample(i)');
ylabel('Digital Value');


%% Motor Control (Rewrites the Arduino Code)

a = arduino('COM15', 'Uno', 'Libraries', 'Servo');
m = servo(a, 'D9');

Alpha_avg_scaled = abs(Alpha_avg/180);
writePosition(m, Alpha_avg_scaled);
current_pos = readPosition(m);
current_pos = current_pos*180;
fprintf('Current motor position is %2.2f °\n\n', current_pos);
pause(2);

delete(instrfindall)
clear a
clear m
%%
 arduinoCom = serial('COM15','BaudRate',9600);  % insert your serial
                                                           %properties here
 sendData = 5;
 fopen(arduinoCom);
 fprintf(arduinoCom,'%d',sendData); %this will send 5 to the arduino
 fscanf(arduinoCom)    %this will read response
                       %or use BytesAvailableFcn property of serial

%%
delete(instrfindall)

