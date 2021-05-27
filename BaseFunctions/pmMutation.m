function [individual] = pmMutation(individual, etam, lower, upper)
%  
% Filename:
%    pmMutation
%
% Description:
%    Mutate an individual using the Polynomial Mutation (PM) operator
%
% Inputs:
%    individual - (Individual) Individual
%    etam - (double) Pertubation parameter
%    lower - (double) Lower bounds for beta and alpha respectively
%    upper - (double) Upper bounds for beta and alpha respectively
%
% Outputs:
%    individual - (Individual) Mutated individual
%
% See also: Individual.m
%
% Author: Alejandra De Luna Pámanes
% email: aledelunap@gmail.com
% May 2021; Last revision: 27-May-2021
%

% PM operator
% Deb, Kalyanmoy, and Debayan Deb. "Analysing mutation schemes for real-parameter
% genetic algorithms." International Journal of Artificial Intelligence and Soft 
% Computing 4.1 (2014): 1-28. https://doi.org/10.1504/IJAISC.2014.059280

for i = 1:length(individual.genotype)
        
    u = rand();
    
    % Calculate perturbation and mutated gene
    if u <= 0.5
        delta_l = (2*u)^(1/(1+etam)) - 1;
        x = individual.genotype(i) + delta_l * (individual.genotype(i) - lower(i));
    else
        delta_r = 1-(2*(1-u))^(1/(1+etam));
        x = individual.genotype(i) + delta_r * (upper(i) - individual.genotype(i));
    end
    
    % Impose boundaries
    individual.genotype(i) = min(max(x, lower(i)), upper(i));
    
end

end