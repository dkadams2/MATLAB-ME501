function Tx = Trans_x(theta)

%Build the transformation matrix
%calculate sin of the angle (converted to radians for matlab)
s = sin(theta*pi/180);
c = cos(theta*pi/180);

%Build transformation matrix
Tx = [1,    0,   0;
      0,    c,   s;
      0,   -s,   c];
end