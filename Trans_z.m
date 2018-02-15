function Tz = Trans_z(theta)

%Build the transformation matrix
%calculate sin of the angle (converted to radians for matlab)
s = sin(theta*pi/180);
c = cos(theta*pi/180);

%Build transformation matrix
Tz = [c,    s,   0;
     -s,    c,   0;
      0,    0,   1];
end
