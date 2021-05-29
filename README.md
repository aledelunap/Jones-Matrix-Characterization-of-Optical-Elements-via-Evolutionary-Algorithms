# Jones Matrix Characterization of Optical Elements via Evolutionary Algorithms

MATLAB implementation for the analytical characterization of homogeneous optical elements using Evolutionary Algorithms (EAs), an EA and a Genetic Algorithm (GA). The characterization method consists of finding the eigenvectors of an unknown element using a Mach-Zehnder interferometer and interferometric visibility measurements. The eigenvectors of an optical element correspond to polarization states of light that have the same polarization state after traversing the optical element, meaning the eigenvectors have the highest interferometric visibility of 1. Since homogeneous optical elements are characterized by orthogonal eigenvectors, the EAs implemented find a single eigenvector of any given sample.

We implemented the EAs using the Mach-Zehnder interferometer arrangement shown below. We used a real-valued representation to describe the genotype of an individual describing a polarization state. The genotype is determined by angles 𝛂 and 𝛃 of the <b>H</b>(𝛃) <b>Q</b>(𝛂) <b>h</b> polarizing stage, where <b>H</b> is a half-wave plate, <b>Q</b> is a quarter-wave plate, and <b>h</b> is the input polarization chosen to be horizontally polarized light. The phenotype of an individual is then the resulting Stokes vector of the genotype, which can be mapped to the surface of the Poincaré sphere. The fitness of an individual is determined as follows. A polarization state is generated by rotating the <b>H</b> and <b>Q</b> elements, then the beam is divided 50:50 using a beam-splitter (BS) and one of the beams interacts with the unknown element <b>J</b>. The beams are then recombined using again a BS and the resulting interference pattern is captured at the end using a CCD camera. The fitness of an individual is the interferometric visibility from the resulting interference pattern.

<p align="center"><img src="experimental_arrangment.png " width=800></p>

Both the EA and the GA use the Polynomial Mutation (PM) operator as the mutation operator and the GA uses the Simulated Binary Crossover (SBX) operator as the recombination operator. The population is initialized randomly, and in each generation 𝛌 offspring are produced using the variation operators with probability <i>p<sub>m</sub></i> and <i>p<sub>c</sub></i> respectively. Then, the next generation is created by selecting the best 𝛍 individuals from the set of (𝛍 + 𝛌) individuals. Each generation is checked for an individual with the maximum interferometric visibility of 1, if it has been found the EA is terminated. Otherwise, the evolution process continues until the best fitted individual has been found or the maximum number of evaluations has been reached.

We provide two files to exemplify the use of our code: exampleEA.m and exampleGA.m. In both files, the different parameters may be varied and the resulting evolution process is plotted at the end to observe how the population evolves over the Poincaré sphere. For instance, the following gif shows an evolution of the (8 + 2) EA:

<p align="center"><img src="EA(8_2)_eta_100_622.gif " width=500></p>

This MATLAB implementation corresponds to the code used in <a href="https://arxiv.org/abs/2101.12293">Jones Matrix Characterization of Optical Elements via Evolutionary Algorithms </a>.
