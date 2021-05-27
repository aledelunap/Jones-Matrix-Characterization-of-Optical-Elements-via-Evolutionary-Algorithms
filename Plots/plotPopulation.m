function plotPopulation(population)
%  
% Filename:
%    plot_population
%
% Description:
%    Plot population given by an object array of individuals over the
%    Poincare sphere
%
% Inputs:
%    population - (Individual) Object array of individuals
%
% Outputs:
%    Figure
%
% Author: Alejandra De Luna Pámanes
% email: aledelunap@gmail.com
% May 2021; Last revision: 27-May-2021
%

close all

s = [population.phenotype];

% Measures over Poincare
figure(1)
[x,y,z] = sphere(25);
surf(x,y,z,'FaceColor', [.9 .9 .9],'FaceAlpha', 0.2, 'EdgeAlpha', 0.3);
colormap(flipud(jet))
caxis([0 1])
ylabel(colorbar, 'Fitness Value', 'FontName', 'Times')
xlabel('S_1')
ylabel('S_2')
zlabel('S_3')
view(-135,25)
set(gca, 'FontName', 'Times', 'FontSize', 30)
set(gcf,'color','w');
axis equal
hold on
scatter3(s(1,:), s(2,:), s(3,:), 50, [population.fitness],'filled','MarkerEdgeColor',[.9 .9 .9],'LineWidth',.5)
decrease_by = 0.025;
axpos = get(gca,'position');
axpos(3) = axpos(3) - decrease_by;
set(gca,'position',axpos);
hold off

end