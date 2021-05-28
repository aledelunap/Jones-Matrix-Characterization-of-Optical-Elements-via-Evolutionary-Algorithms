function QHQ = QHQ(angles)
%  
% Filename:
%    QHQ
%
% Description:
%    Calculate the resultant Jones matrix of the QHQ sample given a set of
%    angles
%
% Inputs:
%    angles - (double) Angles for the QHQ sample
%
% Outputs:
%    QHQ - (double) Jones matrix
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
QHQ = LR(pi/2,angles(1))*LR(pi,angles(2))*LR(pi/2,angles(3));

end