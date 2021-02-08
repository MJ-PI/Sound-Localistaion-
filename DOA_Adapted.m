%%
%                                        SIMULATION - DOA

%                            
a = arduino('COM15', 'Uno', 'Libraries', 'Servo');
s = servo(a, 'D9');
%%
[Tau_AB,Tau_AC, A] = DOA_real(X,Y)
[Alpha_one, Alpha_two, Alpha_avg] = DOA(Tau_AB,Tau_AC);
fprintf('Alpha real = %3.2f ° \n', abs(A)) 
fprintf('Alpha simulated = %3.2f ° \n', Alpha_avg) 

A_real_scaled = abs(A)/180;
Alpha_avg_scaled = abs(Alpha_avg/180);

writePosition(s, A_real_scaled);
current_pos = readPosition(s);
current_pos = current_pos*180;
fprintf('Current motor position is %2.2f °\n\n', current_pos);
pause(2);
%%
clear a
clear s


