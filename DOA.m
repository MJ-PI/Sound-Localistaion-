function [A_p_one_scaled , A_p_two_scaled, A_p_three_scaled, Alpha_avg] = DOA(Tau1,Tau2,Tau3) %Tau1 = between M1&M2, %Tau2 = between M3&M2, %Tau3 = between M1&M3
% DoA recievec three TDoA values

%................... [Geomtric Parameters].........................
c = 343;                %speed of sound
d = 0.10;               %distance between microphone pair 10cm
x_b = d/2;              %distance from centre to side microphones

L_one = Tau1 * c;       %distanace sound travels between M1 & M2
L_two = Tau2 * c;       %distanace sound travels between M2 & M3
L_three = Tau3 * c;     %distanace sound travels between M1 & M3

X = 0.05:0.001:0.16;    %linespace

Y_Line_one = sqrt(((L_one)^4) - (4*(L_one^2)*(x_b^2)) - (4*(L_one^2)*(X.^2)) + (16*(x_b^2)*(X.^2)))/(2*L_one);
Y_Line_two = sqrt((4*(x_b^2)*(X.^2))+(4*(L_two^2)*x_b*X)-(4*(x_b^3)*X)+(L_two^4)-(2*(L_two^2)*(x_b^2))+(x_b^4)-(4*(L_two^2)*(X.^2)))/(2*L_two);
Y_Line_three = sqrt((4*(x_b^2)*(X.^2))+(4*(L_three^2)*x_b*X)-(4*(x_b^3)*X)+(L_three^4)-(2*(L_three^2)*(x_b^2))+(x_b^4)-(4*(L_three^2)*(X.^2)))/(2*L_three);

%.....................[DoA Before Orientation].................
    function [Aplha_p] = Gradient(Y_line)
        % line calulations:
        X_ = 0.05:0.001:0.16;
        midrow_Y = median(Y_line);
        midrow_X = median(X_);
        Ymax = max(Y_line);
        Xmax = max(X_);
        FX_ = (Ymax - midrow_Y)/(Xmax - midrow_X);
        % DoA calulation from line gradients:
        alpha_prime = atan(FX_);
        Aplha_p= radtodeg(alpha_prime);
    end

[Aplha_p_one] = Gradient(Y_Line_one);
[Aplha_p_two] = Gradient(Y_Line_two);
[Aplha_p_three] = Gradient(Y_Line_three);


%.....................[DoA Orientation].................
if (Tau1 < 0 || Tau2 <0 || Tau3 <0)
    A_p_one_scaled =  Aplha_p_one;
    A_p_two_scaled =  Aplha_p_two;
    A_p_three_scaled =  Aplha_p_three;
else
    A_p_one_scaled = 180 - Aplha_p_one;
    A_p_two_scaled = 180 - Aplha_p_two;
    A_p_three_scaled = 180 - Aplha_p_three;
end

if (L_one == 0 && L_two~= 0 && L_three~= 0 )
    Alpha_avg =  (A_p_two_scaled + A_p_three_scaled)/2;
end

if (L_one == 0 && L_two == 0 && L_three~= 0)
    Alpha_avg =  A_p_three_scaled;
end

if (L_one == 0 && L_three == 0 && L_two~= 0 )
    Alpha_avg =  A_p_two_scaled;
end

if (L_two == 0 && L_one~= 0 && L_three~= 0)
    Alpha_avg =  (A_p_one_scaled + A_p_three_scaled)/2;
end

if (L_three == 0 && L_one~= 0 && L_two~= 0)
    Alpha_avg =  (A_p_one_scaled + A_p_two_scaled)/2;
end

if(L_one ~= 0 && L_two ~= 0 && L_three ~= 0)
    Alpha_avg =  (A_p_one_scaled  +   A_p_two_scaled + A_p_three_scaled)/3;
end

end

