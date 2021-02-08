%%
%                               SIMULATION - TDOA

%                            Declaration of Constants.
freq = 800;               % Signal @ 800HZ
Fs = 35000;                % 115200
Ts = 1/Fs;  %1.11e5;  % Sampling time (seconds)
nsamples = 100;
tmax = Ts*nsamples;       % length of time series (seconds) =Ts*nsamples=(500micro)(300)

offset = 10;

tau_max =  1.2113e-04;  %Time Difference

time_shift1 = tau_max/3; %Time Difference 1
phase_shift1 = 2*pi*time_shift1*freq; %Corresponding Phase shift

time_shift2 = tau_max/2; %Time Difference 2
phase_shift2 = 2*pi*time_shift2*freq; %Corresponding Phase shift

time_shift3 = tau_max; %Time Difference 3
phase_shift3 = 2*pi*time_shift3*freq; %Corresponding Phase shift


t = linspace(0.0, tmax, nsamples);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                               Initialisation of Signals
A1 = 100*sin((2.0*pi*t*freq)); 
A1N = A1  + 10*rand(1, length(A1))+offset;  %ADDING NOISE
B1 = 70*sin((2.0*pi*t*freq)+ phase_shift1); 
B1N = B1  + 10*rand(1, length(B1));  %ADDING NOISE

A2 = 100*sin((2.0*pi*t*freq));
B2 = 30*sin((2.0*pi*t*freq)+ phase_shift2)+offset;

A3 = 100*sin((2.0*pi*t*freq));
B3 = 70*sin((2.0*pi*t*freq)+ phase_shift3);

% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 Cross Correlation 
%                                     A1 and B1
[XC1,lag1] = xcorr(A1N,B1N);                  % Cross correlation of signals A1 and B1 --> Gives GCC & Lag
XC1= XC1./max(XC1);                         % normalise results
[maxY1, indexOfMaxY1] = max(XC1);                      
xAtMaxY1 = lag1(indexOfMaxY1);                         
%                                     A2 and B2
[XC2,lag2] = xcorr(A2,B2);           
XC2 = XC2/max(XC2);           
[maxY2, indexOfMaxY2] = max(XC2);                      
xAtMaxY2 = lag2(indexOfMaxY2);  
%                                     A3 and B3
[XC3,lag3] = xcorr(A3,B3);           
XC3 = XC3/max(XC3);    
[maxY3, indexOfMaxY3] = max(XC3);                      
xAtMaxY3 = lag3(indexOfMaxY3);  
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%                                           Plotting the data                              
                                       % Plotting SIgnals A1&B1
figure(1)
subplot(2,1,1)
plot(A1N)
ylabel('Amplitude');
ylim([-150 150]);
xlabel('Time');
hold on
yline(0);
xline(0);
plot(B1N)
hold off
title('Simulated Waves [A1,B1]');

                                  % Plotting the Cross Correlation of A1&B1
subplot(2,1,2)
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

                                        % Plotting SIgnals A2&B2
figure(2)
subplot(2,1,1)
plot(A2)
ylabel('Amplitude');
xlabel('Time');
hold on
yline(0);
plot(B2)
hold off
title('Ideal Signal - Positive Phase Shift')
                                  % Plotting the Cross Correlation of A2&B2
subplot(2,1,2)
plot(lag2,XC2)
hold on
yline(0);
xline(0);
text(200,0.8,'TDOA = 52.083us')
plot(xAtMaxY2,maxY2,'o', 'MarkerFaceColor','red','MarkerSize', 5)
ylabel('Cross Correlation');
axis tight;
title('GCC Plot');
xlabel('Lag');

                                        % Plotting SIgnals A3&B3
figure(3)
subplot(2,1,1)
plot(A3)
ylabel('Amplitude')
xlabel('Time')
hold on
plot(B3)
xline(0);
hold off
title('Ideal Signal - Negative Phase Shift')

                                % Plotting the Cross Correlation of A3&B3
subplot(2,1,2)
plot(lag3,XC3) 

hold on
yline(0) ;                       % Where no phase delay woul exsist
xline(0) ;
text(200,0.85,'TDOA = -190.97us')
plot(xAtMaxY3,maxY3,'o', 'MarkerFaceColor','red','MarkerSize', 5)
ylabel('Cross Correlation');
axis tight;
title('GCC Plot')
xlabel('Lag');

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%                                   Value Verification
fprintf('Real Lag 1 = %f us \n', time_shift1*1000000) %*1000000 to us
fprintf('Function Simulated Lag 1 = %0.3f us \n\n', TDOA(A1N,B1N,Fs))

fprintf('Real Lag 2 = %0.3f us \n', time_shift2*1000000)
fprintf('Function Simulated Lag 2 = %0.3f us \n\n', TDOA(A2,B2,Fs))

fprintf('Real Lag 3 = %0.3f us \n', time_shift3*1000000)
fprintf('Function Simulated Lag 3 = %0.3f us\n\n', TDOA(A3,B3,Fs))


tic
TDOA(A1N,B1N,Fs)
t_TDOA = toc