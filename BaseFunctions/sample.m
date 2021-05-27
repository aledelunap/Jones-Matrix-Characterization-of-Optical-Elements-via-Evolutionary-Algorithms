function [J] = sample(s,J)
%  
% Filename:
%    sample
%
% Description:
%    Calculate the resultant Jones vector given by the interaction of a 
%    sample and a Jones vector
%
% Inputs:
%    s - (double) Angles for the QHQ sample
%    J - (double) Input Jones vector
%
% Outputs:
%    J - (double) Output Jones vector
%
% See also: jones.m
%
% Author: Alejandra De Luna Pámanes
% email: aledelunap@gmail.com
% May 2021; Last revision: 27-May-2021
%

% Linear rearder with a fast axis unchanged convention
% Chipman, Russell A., Wai-Sze Tiffany Lam, and Garam Young. Polarized light
% and optical systems. CRC press, 2018: 134-135. https://doi.org/10.1201/9781351129121
% (Radians)
LR = @(delta,theta) exp(1i*delta/2)*[exp(-1i*delta/2).*(cos(theta).^2)+exp(1i*delta/2).*(sin(theta).^2), -1i*sin(delta/2)*sin(2*theta);
                    -1i*sin(delta/2)*sin(2*theta), exp(1i*delta/2)*cos(theta).^2+exp(-1i*delta/2)*(sin(theta).^2)];               
% (Degrees)              
%expd = @(d) cosd(d)+1i*sind(d);
%LR = @(delta,theta) expd(delta/2)*[expd(-delta/2).*(cosd(theta).^2)+expd(delta/2).*(sind(theta).^2), -1i*sind(delta/2)*sind(2*theta);
%                    -1i*sind(delta/2)*sind(2*theta), expd(delta/2)*cosd(theta).^2+expd(-delta/2)*(sind(theta).^2)];               

% Quarter- and half-wave plates
% Q: LR(pi/2, theta)
% H: LR(pi, theta)
J = LR(pi/2,s(1))*LR(pi,s(2))*LR(pi/2,s(3))*J;

end
