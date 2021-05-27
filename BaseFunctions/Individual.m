classdef Individual
%  
% Filename:
%    Individual
%
% Description:
%    Defines an individual for the characterization of homegenous
%    optical elements using Evolutionary Algorithms
%
% Properties:
%    genotype - (double) Polarization stage angles beta and alpha in degrees
%    phenotype - (double) Stoke's parameters
%    ftness - (double)  Interferometric visibility
%    jonesVector - (double) Jones vector
% 
% Methods:
%     individualConstructor - Initialize randomly the properties of an
%                             individual given a sample
%     crossover - Recombines individual with a given individual
%     mutate - Mutates individual
%     
% Author: Alejandra De Luna Pámanes
% email: aledelunap@gmail.com
% May 2021; Last revision: 27-May-2021
%

    properties
        genotype
        phenotype
        jonesVector
        fitness
        sharedfitness
    end
    
    methods
        
        % Initialize
        function individual = individualConstructor(individual, s)
            % Bounds
            % [beta in (-45, 45); alpha in (-45, 45)]
            individual.genotype = [90*rand() - 45; 90*rand() - 45];
            individual.phenotype = stokes(individual.genotype);
            individual.jonesVector = jones(individual.genotype);
            individual.fitness = experiment(individual.jonesVector, s);
        end
        
        % Mutation
        function individual = mutate(individual, s, etam, lower, upper)
            individual = pmMutation(individual, etam, lower, upper);
            individual.jonesVector = jones(individual.genotype);
            individual.fitness = experiment(individual.jonesVector, s);
            individual.phenotype = stokes(individual.genotype);
        end
        
        % Crossover
        function offspring = crossover(individual, mate, s, etac, lower, upper)
            offspring = sbxCrossover([individual, mate], etac, lower, upper);
            offspring(1).jonesVector = jones(offspring(1).genotype);
            offspring(2).jonesVector = jones(offspring(2).genotype);
            offspring(1).fitness = experiment(offspring(1).jonesVector, s);
            offspring(2).fitness = experiment(offspring(2).jonesVector, s);
            offspring(1).phenotype = etokes(offspring(1).genotype);
            offspring(2).phenotype = etokes(offspring(2).genotype);
        end
        
    end
end