%Computes the stress, strain, principal stress, and principal strains
%throughout the laminate. 
%z is the normal z that is a vector of length numplies+1
function [allstress,allstrain,principalstress,principalstrain] = allstress(E1, E2, v12, v21, G12, theta, eps_xo, eps_yo, gamm_xyo, kxo, kyo, kxyo, z, numplies)

%Compute all stresses and strains in the composite for each layer at top and bottom. To
%be helpful for plotting the stresses

%Loop through each ply
count = 0;
for i=1:numplies
    %Compute Qbar for that ply
    Qbar = Qbar_mat(E1, E2, v12, v21, G12, theta(i));
    zmat = [z(i), z(i+1)];
    Tprin = Principal_Trans_mat(theta(i));
    
    for j=1:2
        strain = [eps_xo+zmat(j)*kxo; eps_yo+zmat(j)*kyo; gamm_xyo+zmat(j)*kxyo];
        StrainValues(:,j) = strain;
        StressValues(:,j) = Qbar*strain;
    end
    %Create vector for strains and principal strains in top of ply
    allstrain(:,i+count) = StrainValues(:,1);
    principalstrain(:,i+count) = Tprin*StrainValues(:,1);
    principalstrain(3,i+count) = principalstrain(3,i+count)*2;
    
    %Create vector for strains and principal strains in bottom of ply
    allstrain(:,i+1+count) = StrainValues(:,2);
    principalstrain(:,i+1+count) = Tprin*StrainValues(:,2);
    principalstrain(3,i+1+count) = principalstrain(3,i+1+count)*2;
    
    %Create vector for stresses and principal stresses in top of ply
    allstress(:,i+count) = StressValues(:,1);
    principalstress(:,i+count) = Tprin*StressValues(:,1);
    
    %Create vector for stresses and principal stresses in bottom of ply
    allstress(:,i+1+count) = StressValues(:,2);
    principalstress(:,i+1+count) = Tprin*StressValues(:,2);
    count = count+1;
end