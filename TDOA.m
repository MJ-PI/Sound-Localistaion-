function [Sim_Time] = TDOA(sig1,sig2,Fs)
a = sig1 - mean(sig1);                       % Differences from the mean
b = sig2 - mean(sig2);                       % Differences from the mean
[XC,lag] = xcorr(a,b);                       % [XC,lag] = xcorr(...)  returns a vector of lag indices (Lag).        
XC = XC./max(XC);                            % Normalize the signals so their maximum value is one.    
[maxY, indexOfMaxY] = max(XC);               % The locations of the maximum values of the cross-correlations indicate time leads or lags.
xAtMaxY = lag(indexOfMaxY);                  % [M,I] = max(X) also returns the indices into operating dimension
                                             % corresponding to the maximum values. 
Ts = 1/Fs; 
Sim_Time = ((xAtMaxY)*Ts)*1e6;               % t21 = lag(I21) shifts the data in each variable in the timetable I21 forward ...
                                             % in time (a "lag") by one time step. TT must be regular.                                        
end

