function Ty = Trans_y(theta)

%Build the transformation matrix
%calculate sin of the angle (converted to radians for matlab)
s = sin(theta*pi/180);
c = cos(theta*pi/180);

%Build transformation matrix
Ty = [c,    0,   s;
      0,    1,   0;
      -s,   0,   c];
end