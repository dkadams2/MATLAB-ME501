function [allstress] = allstress(E1, E2, v12, v21, G12, theta, eps_xo, eps_yo, gamm_xyo, kxo,kyo, kxyo, z, numplies)

%Compute all stresses in the composite for each layer at top and bottom. To
%be helpful for plotting the stresses

%Loop through each ply
count = 0;
for i=1:numplies
    %Compute Qbar for that ply
    Qbar = Qbar_mat(E1, E2, v12, v21, G12, theta(i));
    zmat = [z(i), z(i+1)];
    
    for j=1:2
        strain = [eps_xo+zmat(j)*kxo; eps_yo+zmat(j)*kyo; gamm_xyo+zmat(j)*kxyo];
        StrainValues(:,j) = strain;
        StressValues(:,j) = Qbar*strain;
    end
    allstress(:,i+count) = StressValues(:,1);
    allstress(:,i+1+count) = StressValues(:,2);
    count = count+1;
end