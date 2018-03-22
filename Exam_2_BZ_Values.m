%Derrik Adams
%ME 501 - Exam 2
%This code computes the Abz, Bbz, Cbz, and Dbz values for beams on elastic
%foundations

%Input Parameters
b = .7; %Beta
z = 1; %distance from the load to the point of reference
bz = b*z;

%Solve for each value
Abz = exp(-bz)*(sin(bz)+cos(bz));
Bbz = exp(-bz)*sin(bz);
Cbz = exp(-bz)*(cos(bz)-sin(bz));
Dbz = exp(-bz)*cos(bz);