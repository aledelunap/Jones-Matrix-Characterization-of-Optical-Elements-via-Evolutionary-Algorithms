function offspring = sbxCrossover(parents, etac, lower, upper)
%  
% Filename:
%    offspring
%
% Description:
%    Recombines a pair of individuals to create a pair of offspring using
%    the Simulated Binary Crossover (SBX) operator
%
% Inputs:
%    parents - (Individual) Object array containing a pair of individuals
%    etac - (double) Pertubation parameter
%    lower - (double) Lower bounds for beta and alpha respectively
%    upper - (double) Upper bounds for beta and alpha respectively
%
% Outputs:
%    offsping - (Individual) Object array containing a pair of individuals
%
% See also: Individual.m
%
% Author: Alejandra De Luna Pámanes
% email: aledelunap@gmail.com
% May 2021; Last revision: 27-May-2021
%

% Define offspring array
offspring = parents;

% SBX operator
% Deb, Kalyanmoy, and Hans-Georg Beyer. "Self-adaptive genetic algorithms 
% with simulated binary crossover." Evolutionary computation 9.2 (2001).
% https://doi.org/10.1162/106365601750190406

for i = 1:length(parents(1).genotype)
    
    u = rand();
    
    % Calculate spread factor beta
    if u <= 0.5
        beta = (2*u)^(1/(etac+1));
    else
        beta = (1/(2*(1-u))).^(1/(etac+1));
    end
    
    % Ofsspring solutions
    offspring(1).genotype(i) = 0.5*((1+beta)*parents(1).genotype(i) + (1-beta)*parents(2).genotype(i));
    offspring(2).genotype(i) = 0.5*((1-beta)*parents(1).genotype(i) + (1+beta)*parents(2).genotype(i));
    
    % Impose boundaries
    offspring(1).genotype(i) = min(max(offspring(1).genotype(i), lower(i)), upper(i));
    offspring(2).genotype(i) = min(max(offspring(2).genotype(i), lower(i)), upper(i));

end

end
