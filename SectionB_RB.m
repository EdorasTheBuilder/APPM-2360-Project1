%%Imports

% Get the directory of the current script (script.m)
repoPath = fileparts(mfilename('fullpath'));
% Construct the ath to the 'provided' folder dynamically
providedPath = fullfile(repoPath, 'provided');
% Add 'provided' folder to the MATLAB path
addpath(providedPath);



%%3 

a_const = 1.5; 
b_const = 1.1; 
g_const = 2.5;
d_const = 1.4; 


u = @(x1, x2) - a_const .* x1 + b * x1 .* x2;
v = @(x1, x2) g_const .* x2 - d_const * x1 .* x2;
x1Vals = 0:1:5;
x2Vals = 0:1:5;

vectorfield(u,v,x1Vals,x2Vals)









