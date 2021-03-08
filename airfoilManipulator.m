%   Daniel Wijaya
%   27/10/2018
%   AERO Advanced McGill
%   manipulate airfoil to desired shape, orientation, and position
%   note: scale airfoil up from 1 ft chord

function [af] = airfoilManipulator(af, c, alpha, x, z)

%scale
af = af*c;
%rotate
R = [cos(alpha), -sin(alpha); sin(alpha), cos(alpha)];
for i=1:size(af,1)
    af(i,:) = (R*af(i,:)')';
end
%translate
%xtranslate
af(:,1) = af(:,1) + x;
%ytranslate
yMove = max(af(:,2));
af(:,2) = af(:,2) - yMove;
%ztranslate
af = [af, z*ones(size(af,1),1)];

end