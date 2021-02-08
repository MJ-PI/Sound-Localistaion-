function [Tau_A,Tau_C, DOA_radians] = DOA_real(X,Y)
% This function produces the real Time difference (Tau) 
% and the associated Direction of arrival (DOA)
% from the (X;Y) coordinates passed to it.

A = (-0.05);
B = 0.05;
C = 0;

DA = sqrt((A-X)^2 + (Y)^2);
DB = sqrt((B-X)^2 + (Y)^2);
DC = sqrt((C-X)^2 +(Y)^2);

diff_A = DA - DB;
diff_C = DA - DC;

Tau_A = diff_A/343;
Tau_C = diff_C/343;

if X>0
    Phi = radtodeg(atan(Y/X));
    DOA_radians = 180 - Phi ;
else
    DOA_radians = radtodeg(atan(Y/X));
end 
    
end

