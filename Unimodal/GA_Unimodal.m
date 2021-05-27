function [i, measures, generations] = GA_Unimodal(sample, mu, lambda, maxi, pc, pm, etac, etam, lower, upper, seedk)
%  
% Filename:
%    GA_Unimodal
%
% Description:
%    Genetic Algorithm with polynomial mutation (PM) and simulated binary crossover (SBX)
%
% Inputs:
%    sample - (double) Sample
%    mu - (double) Number of individuals per generation
%    lambda - (double) Number of offspring per generation
%    maxi - (double) Maximum number of iterations
%    pc - (double) Probability of crossover
%    pm - (double) Probability of mutation
%    etac - (double) SBX pertubation parameter
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
    population(j) = population(j).individualConstructor(sample);
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
            
       for j = 1:2:lambda                           % While offsping < lambda
            
            p = randsample(mu,2);              % Select parents
            
            if rand() <= pc                             % Recombine parents using SBX
                offspring(j:j+1) = population(p(1)).crossover(population(p(2)), sample, etac(i), lower, upper);
            else
                offspring(j:j+1) =  [population(p(1)), population(p(2))];
            end
            if rand() <= pm                             % Mutate offspring using PM
                offspring(j) = offspring(j).mutate(sample, etam(i), lower, upper);
            end
            if rand() <= pm                             % Mutate offspring using PM
                offspring(j+1) = offspring(j+1).mutate(sample, etam(i), lower, upper);
            end
            
            offspring(j) = motorStep(offspring(j)); 
            offspring(j+1) = motorStep(offspring(j+1)); 
            
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
    
    




