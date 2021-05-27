function [J] = jones(angles)
%  
% Filename:
%    jones
%
% Description:
%    Transform horizontal polarization (h) using a polarization stage given
%    a pair of angles beta and alpha
%
% Inputs:
%    angles - (double) Angles beta and alpha
%
% Outputs:
%    J - (double) Jones vector
%
% See also: Individual.m, experiment.m
%
% Author: Alejandra De Luna Pámanes
% email: aledelunap@gmail.com
% May 2021; Last revision: 27-May-2021
%

% Verify input
if ~isequal(size(angles), [2 1])
    error('Angles must be in a 2x1 vector.')
elseif angles(1)~=real(angles(1)) || angles(2)~=real(angles(2))
    error('Angles  must be real.')
end

% Exponential funtion 
% (Degrees)
expd = @(d) cosd(d)+1i*sind(d);
% Linear rearder with a fast axis unchanged convention
% Chipman, Russell A., Wai-Sze Tiffany Lam, and Garam Young. Polarized light
% and optical systems. CRC press, 2018: 134-135. https://doi.org/10.1201/9781351129121
% (Degrees)
LR = @(delta,theta) expd(delta/2)*[expd(-delta/2).*(cosd(theta).^2)+expd(delta/2).*(sind(theta).^2), -1i*sind(delta/2)*sind(2*theta);
                    -1i*sind(delta/2)*sind(2*theta), expd(delta/2)*cosd(theta).^2+expd(-delta/2)*(sind(theta).^2)];               

% Quarter- and half-wave plates
% Q: LR(pi/2, theta)
% H: LR(pi, theta)               
Q = LR(90, angles(2));
H = LR(180, angles(1));

% Horizontal polarization
h = [1;0];

% Polarization stage
J = H*Q*h;

% Verify output
if ~isequal(size(J), [2 1])
    error('Jones vector is not a 2x1 vector.')
end
   
end