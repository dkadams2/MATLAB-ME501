function composite_stress_plot(z, AllStress)

subplot(3,1,1); plot(AllStress(1,:), z)
xlabel('Sigma X (Pa)'); ylabel('z thickness (mm)');
xlim([min(AllStress(1,:))-.1*max(AllStress(1,:)),max(AllStress(1,:))+.1*max(AllStress(1,:))]);

subplot(3,1,2); plot(AllStress(2,:), z)
xlabel('Sigma Y (Pa)'); ylabel('z thickness (mm)');
xlim([min(AllStress(2,:))-.1*max(AllStress(2,:)),max(AllStress(2,:))+.1*max(AllStress(2,:))]);

subplot(3,1,3); plot(AllStress(3,:), z)
xlabel('Sigma Z (Pa)'); ylabel('z thickness (mm)');
xlim([min(AllStress(3,:))-.1*max(AllStress(3,:)),max(AllStress(3,:))+.1*max(AllStress(3,:))]);

end