%Function to compute QBar
function [Qbar] = Qbar_mat(E1, E2, v12, v21, G12, theta)

%Compute necessary Q and angle values from input
Q11 = E1/(1-v12*v21);
Q12 = v12*E2/(1-v12*v21);
Q22 = E2/(1-v12*v21);
Q66 = G12;
s = sin(theta*pi/180);
c = cos(theta*pi/180);
%Compute the Qbar matrix values;
Q11_bar = Q11*c^4+2*(Q12+2*Q66)*s^2*c^2+Q22*s^4;
Q12_bar= (Q11+Q22-4*Q66)*s^2*c^2+Q12*(s^4+c^4);
Q16_bar = (Q11-Q12-2*Q66)*s*c^3+(Q12-Q22+2*Q66)*s^3*c;
Q22_bar = Q11*s^4+2*(Q12+2*Q66)*s^2*c^2+Q22*c^4;
Q26_bar = (Q11-Q12-2*Q66)*s^3*c+(Q12-Q22+2*Q66)*s*c^3;
Q66_bar = (Q11+Q22-2*Q12-2*Q66)*s^2*c^2+Q66*(s^4+c^4);

Qbar = [Q11_bar, Q12_bar, Q16_bar;
        Q12_bar, Q22_bar, Q26_bar;
        Q16_bar, Q26_bar, Q66_bar];
end

