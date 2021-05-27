function phenotype  = stokes(genotype)
%  
% Filename:
%    phenotype
%
% Description:
%    Defines the phenotype of an individual given it's genotype
%
% Inputs:
%    genotype - (double) Beta and alpha angles in degrees of the HWP and QWP [beta; alpha]
%
% Outputs:
%    phenotype - (double) Stokes parameters [S_1; S_2; S_3]
%
% See also: Individual.m, experiemnt.m
%
% Author: Alejandra De Luna Pámanes
% email: aledelunap@gmail.com
% May 2021; Last revision: 27-May-2021
%

% Verify the array size matches the expected input
if ~isequal(size(genotype), [2 1])
    error('Genotype must be a 2x1 vector.')
end

% Initialize phenotype array
phenotype = zeros(3,1);

% Calculate Stokes parameters 
% Dorilian Lopez-Mago, Arturo Canales-Benavides, Raul I. Hernandez-Aranda, 
% and Julio C. Gutiérrez-Vega, "Geometric phase morphology of Jones matrices,
% " Opt. Lett. 42, 2667-2670 (2017). https://doi.org/10.1364/OL.42.002667
phenotype(1) = cosd(2*genotype(2)) * cosd(4*genotype(1) - 2*genotype(2));
phenotype(2) = cosd(2*genotype(2)) * sind(4*genotype(1) - 2*genotype(2));
phenotype(3) = sind(2*genotype(2));

end