function [individual] = motorStep(individual)
%  
% Filename:
%    motorStep
%
% Description:
%    Adjusts individual's genotype based in the accuracy and precision of
%    Thorlab's Motorized Precision Rotation Mount
%
% Inputs:
%    individual - (Individual) Individual
%
% Outputs:
%    individual - (Individual) Adjusted intividual
%
% See also: Individual.m
%
% Author: Alejandra De Luna Pámanes
% email: aledelunap@gmail.com
% May 2021; Last revision: 27-May-2021
%

for i = 1:length(individual.genotype)
    
    % Calculate the difference between the mount's step and the gene
    dif = mod(individual.genotype(i), 0.03);
    
    % Determine the nearest 0,03 step
    if dif < 0.015
        individual.genotype(i) =  individual.genotype(i) - dif;
    else
        individual.genotype(i) =  individual.genotype(i) + (0.03 - dif);
    end
    
    % Add a 0.1% random perturbation from the normal distribution
    individual.genotype(i) = individual.genotype(i) + 0.03*.001.*randn();
    
end

end