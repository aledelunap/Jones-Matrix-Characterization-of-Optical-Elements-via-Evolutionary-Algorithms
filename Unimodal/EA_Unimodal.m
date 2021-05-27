function [i, measures, generations] = EA_Unimodal(s, mu, lambda, maxi, pm, etam, lower, upper, seedk)
%  
% Filename:
%    EA_Unimodal
%
% Description:
%    Evolutionary Algorithm with polynomial mutation (PM)
%
% Inputs:
%    sample - (double) Sample
%    mu - (double) Number of individuals per generation
%    lambda - (double) Number of offspring per generation
%    maxi - (double) Maximum number of iterations
%    pm - (double) Probability of mutation
%    etam - (double) PM pertubation parameter
%    lower - (double) Lower bounds for beta and alpha respectively
%    upper - (double) Upper bounds for beta and alpha respectively
%    seedk - (double) Seed for the random number generator
%
% Outputs:
%    i - (double) Number of generations
%    measures - (double) Number of evaluations
%    generations - (Individual) Object array containing the individuals
%                  in each generation
%
% Author: Alejandra De Luna Pámanes
% email: aledelunap@gmail.com
% May 2021; Last revision: 27-May-2021
%

% Set seed
rng(seedk)

% Evolutionary Algorithm

% Initial population
population = Individual.empty(mu,0);    % Population matrix
for j = 1:mu                            % Initialize Population
    population(j) = Individual;
    population(j) = population(j).individualConstructor(s);
end

[~,ind] = sort([population.fitness],'descend');     % Sort individuals
population = population(ind);                       % in Population

generations = population;

% Initalize variables
measures = mu; 
i = 0;
evolution = 1;

if  abs(1 - population(1).fitness) <= 10^(-4)       % Fitness termination criteria
    evolution = 0;
end
        
% Evolution cycle
if evolution == 1
    for i = 1:maxi
        
        offspring =  Individual.empty(lambda,0);    % Init offspring array
        
        % Mutation
        for j = 1:lambda
            c = randi([1 mu]);                      % Select mutant's parent
            if rand() <= pm
                offspring(j) = population(c).mutate(s, etam(i), lower, upper);     % Mutate individual
            else
                offspring(j) = population(c);
            end
            
            offspring(j) = motorStep(offspring(j));     % Motor 
            
        end

        population = [population, offspring];            % New population (mu + lambda)
        [~,ind] = sort([population.fitness],'descend');  % Sort new population
        population = population(ind);                 
        
        population = population(1:mu);                   % Select next generation
        
        measures = measures + lambda;                    % Save measurements of offspring
        generations = [generations population];
        
        % Termination criteria
        if  abs(1 - population(1).fitness) <= 10^(-4)    % Fitness termination criteria
            break
        end
        
    end
end
    




