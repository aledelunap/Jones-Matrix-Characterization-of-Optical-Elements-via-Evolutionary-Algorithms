# Jones Matrix Characterization of Optical Elements via Evolutionary Algorithms

MATLAB implementation for the analytical characterization of homogeneous optical elements using Evolutionary Algorithms (EAs), an EA and a Genetic Algorithm (GA). The characterization method consists of finding the eigenvectors of an unknown element using a Mach-Zehnder interferometer and interferometric visibility measurements, for which the eigenvectors have the highest interferometric visibility of 1. Since homogeneous optical elements are characterized by orthogonal eigenvectors, the EAs implemented find a single eigenvector of any given sample.

We implemented the EAs using a real-valued representation. Both the EA and the GA use the Polynomial Mutation (PM) operator as the mutation operator and the GA uses the Simulated Binary Crossover (SBX) operator as the recombination operator. The population is initialized randomly, and in each generation 𝛌 offspring are produced using the variation operators with probability <i>p<sub>m</sub></i> and <i>p<sub>c</sub></i> respectively. Then, the next generation is created by selecting the best 𝛍 individuals from the set of (𝛍 + 𝛌) individuals. Each generation is checked for an individual with the maximum interferometric visibility of 1, if it has been found the EA is terminated. Otherwise, the evolution process continues until the best fitted individual has been found or the maximum number of evaluations has been reached.

We provide two files to exemplify the use of our code: exampleEA.m and exampleGA.m. In both files, the different parameters may be varied and the resulting evolution process is plotted at the end to observe how the population evolves over the Poincaré sphere. For instance, the following gif shows an evolution of the (8 + 2) EA:

<p align="center"><img src="EA(8_2)_eta_100_622.gif " width=400></p>

This MATLAB implementation corresponds to the code used in <a href="https://arxiv.org/abs/2101.12293">Jones Matrix Characterization of Optical Elements via Evolutionary Algorithms </a>.
