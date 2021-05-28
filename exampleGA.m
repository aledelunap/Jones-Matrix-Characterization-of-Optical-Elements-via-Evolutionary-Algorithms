%  
% Filename:
%    example
%
% Description:
%    Run and plot a trial of the EA.
%
% Author: Alejandra De Luna Pámanes
% email: aledelunap@gmail.com
% May 2021; Last revision: 28-May-2021
%

clear

mu = 4;                     % Individuals per generation 
lambda = 2;                 % Offspring per generation

pm = 0.5;                   % Probability of mutation
pc = 0.5;                   % Probability of crossover

etac = @(k) 0*k+100;              % etac
etam = @(k) 0*k+20;               % etam
eta_s = '100-20';                     % Associated etam string

sample = QHQ([0, pi/4, 0]);     % Sample

% lower = [-45, -45];              % Original bounds
% upper = [45, 45];
 
lower = [-90, -90];                % Extended bounds
upper = [90, 90];

% Reproducibility
seeds = [622	212	985	972	454	144	556	355	892	650	269	835	471	603	382	550	590	229	701	590	487	211	821	772	292	174	570	677	744	383	769	182];
seedk = seeds(1);                 % Number of iterations

maxEvals = 6000;

% Evolutionary Algorithm
[iterations, measures, generations] = GA_Unimodal(sample, mu, lambda, maxEvals, pc, pm, etac, etam, lower, upper, seedk);

% Plot result
% plotGenerations(generations, mu)

% Alternatively plot and create a gif
gifname = strcat('GA(',string(mu),'_', string(lambda), ')_eta_', eta_s,'_',string(seedk),'.gif');
gifGenerations(gifname{1}, generations, mu)
              
