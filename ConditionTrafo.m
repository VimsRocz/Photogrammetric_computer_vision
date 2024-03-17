function [T] = ConditionTrafo(points)
% Get the conditioning transformation based on the sepcified points.
% points: Matrix containing homogeneous points. (One point per column!)
% T: Transformation matrix.

%----------------------------------
%------------- Task 1  ------------
%----------------------------------

% TODO: Add your code here
 Point = mean (points,2);
X_c = Point(1,1);           %our points seperated are in 1 row
Y_c = Point(2,1);           %our points seperated are in 2 row

Variance = var(points,0,2);
 sum = sqrt(2/(Variance(1,1)+Variance(2,1)));
 
 T= diag([sum sum 1]);
 T(1,3)= - sum * X_c;
  T(2,3)= - sum * Y_c;

end