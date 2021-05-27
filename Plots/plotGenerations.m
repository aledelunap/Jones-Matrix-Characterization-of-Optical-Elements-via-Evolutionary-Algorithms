function plotGenerations(generations, mu)
%  
% Filename:
%    plotGenerations
%
% Description:
%    Plot generations given by an object array of individuals over the
%    Poincare sphere and the number of individuals per generation
%
% Inputs:
%    generations - (Individual) Object array of individuals
%    mu - (double) Number of individuals per generation
%
% Outputs:
%    Figures
%
% Author: Alejandra De Luna Pámanes
% email: aledelunap@gmail.com
% May 2021; Last revision: 27-May-2021
%

close all

figure(1)
axpos = get(gca,'position');
axpos(3) = axpos(3) - 0.010;
axpos(2) = axpos(2) + 0.025;
set(gca,'position',axpos);

for j = 1:mu:length(generations)
    
    % Individuals
    s = [generations(j:j+mu-1).phenotype];
    fitness = [generations(j:j+mu-1).fitness];

    % Poincare sphere plot
    [x,y,z] = sphere(25);
    surf(x,y,z,'FaceColor', [.9 .9 .9],'FaceAlpha', 0.35, 'EdgeAlpha', 0.3);
    colormap(flipud(jet))
    caxis([0 1])
    ylabel(colorbar, 'Fitness Value', 'FontName', 'Times')
    xlabel('S_1')
    ylabel('S_2')
    zlabel('S_3')
    view(45,25)
    set(gca, 'FontName', 'Times', 'FontSize', 22)
    set(gcf,'color','w');
    axis equal
    hold on
    scatter3(s(1,:), s(2,:), s(3,:), 50, fitness,'filled','MarkerEdgeColor',[.9 .9 .9],'LineWidth',.5)
    hold off
    pause(0.001)
end