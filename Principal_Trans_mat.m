function T = Principal_Trans_mat(theta)

%Build the transformation matrix
%calculate sin of the angle (converted to radians for matlab)
s = sin(theta*pi/180);
c = cos(theta*pi/180);

%Build transformation matrix
T = [c^2,    s^2,   2*s*c;
     s^2,    c^2,   -2*s*c;
    -s*c,    s*c,   (c^2)-(s^2)];
end
 
 