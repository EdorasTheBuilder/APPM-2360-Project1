    % To run the script not as a function, uncomment
    % lines 4-7 and comment lines 9 and 59
%{
f = @(t,y) -y;
g = @(t,y) t;
x1Vals = -10:1:10;
x2Vals = -10:1:10;
%}
    
function vectorfield(f,g,x1Vals,x2Vals)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot direction field for the autonomous first order ODE system 
%       x1' = f(x1,x2)
%       x2' = g(x1,x2)
%   x1Vals - vector of grid points for the x1-axis
%   x2Vals - vector of grid points for the x2-axis
%   f, g are anonymous (@) functions or names of m-files in single quotes
%
% Usage example: x1' = -x2   x2'= x1
%   show vector field for x1 in [-1,3], x2 in [-2,2]
%   using a spacing of .2 for both t and y:
%
%   f = @(x1,x2) -x2
%   g = @(x1,x2) x1
%   vectorfield(f, g, -1:.2:3, -2:.2:2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Set up the grid on which the vector field is plotted
    % and compute the spacing between grid points.

[x1g,x2g] = meshgrid(x1Vals,x2Vals)
Delta_x1 = x1Vals(2) - x1Vals(1)
Delta_x2 = x2Vals(2) - x2Vals(1)

    % Fix up the functions if necessary

if isa(f,'function_handle')
    f = eval(vectorize(f))
end
if isa(g,'function_handle')
    g = eval(vectorize(g))
end

    % Evaluate the functions to find the vector components
    % and the magnitude of the vectors for scaling purposes

dx1dt = feval(f,x1g,x2g);
dx2dt = feval(g,x1g,x2g);
normal = sqrt(dx1dt.^2+dx2dt.^2);
dx1dt = dx1dt./normal;
dx2dt = dx2dt./normal;
quiver(x1g,x2g,dx1dt,dx2dt,0.5,'LineWidth',0.5,'AutoScale','on','Color','[0.4940 0.1840 0.5560]')

    % Fix up the axes.

axis([x1Vals(1)-Delta_x1/2,x1Vals(end)+Delta_x1/2, ...
      x2Vals(1)-Delta_x2/2,x2Vals(end)+Delta_x2/2])

end