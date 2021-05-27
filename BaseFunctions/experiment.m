function [V] = experiment(J,s)
%  
% Filename:
%    experiment
%
% Description:
%    Determines the interferometric visibility of a Jones vector given a sample
%    using the Mach–Zehnder interferometer. The sample is located in the upper
%    arm.
%
% Inputs:
%    J - (double) Jones vector
%    s - (double) Sample angles for the QHQ
%
% Outputs:
%    V - (double) Interferometric visibility
%
% See also: jones.m, sample.m
%
% Author: Alejandra De Luna Pámanes
% email: aledelunap@gmail.com
% May 2021; Last revision: 27-May-2021
%

% Non-Polarizing Beam Splitter matrix (N-PBS)
BS = [1i,1i;
      1,1]/sqrt(2);

% First BS
Rx = BS(1,1)*J(1); % Refelcted beam
Ry = BS(1,2)*J(2);
Tx = BS(2,1)*J(1); % Transmited beam
Ty = BS(2,2)*J(2);

% Sample
T = sample(s,[Tx;Ty]);

% Second BS
TRx = BS(1,1)*T(1); % Reflected beam
TRy = BS(1,2)*T(2);
RTx = BS(2,1)*Rx; % Transmited beam
RTy = BS(2,2)*Ry;

% Power
%I = abs(RTx + TRx)^2 + abs(RTy + TRy)^2;

% Delay - Transmited beam delay
% Electric field E(0,0) - Two plane monocromatic  interference k = (0, 0, 1)
% Variables of Interference
n = 768;
% XY Plane
Z = zeros(n,n);
[X] = meshgrid(linspace(-10,10,n));

% Reflected beam    
theta = pi/2; % Tilt angle
RTx = RTx*exp(1i*X*sin(theta));
RTy = RTy*exp(1i*X*sin(theta));
% Transmited beam
TRx = TRx.*exp(1i*Z);
TRy = TRy.*exp(1i*Z);

% Fringe Visibility
V = conj(RTx+TRx).*(RTx+TRx)+conj(RTy+TRy).*(RTy+TRy);

Pmax = max(max(V));
Pmin = min(min(V));

V = real((Pmax-Pmin)/(Pmax+Pmin));

% Verify visibility
if (0>V) || (V>1) || imag(V)~=0
    disp(J)
    quit
end