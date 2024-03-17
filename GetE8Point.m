function [E] = GetE8Point(pointsImg1, pointsImg2, K)
% Estimates the essential matrix based on the fundamental matrix. Uses the
% "EightPointAlgo" function!
% pointsImg1: Matrix containing homogeneous points from the first
% image. (One point per column!)
% pointsImg2: Matrix containing homogeneous points from the second
% image. (One point per column!)
% K: Calibration matrix
% E: Essential matrix

%----------------------------------
%------------- Task 3  ------------
%----------------------------------

% TODO: Add your code here
Points_Image_1__N_P = inv(K) * pointsImg1;
Points_Image_2__N_P = inv(K) * pointsImg2;
E_p = EightPointAlgo(Points_Image_1__N_P,Points_Image_2__N_P);

[X,Y,Z] = svd(E_p);
sigma = (Y(1,1) + Y(2,2))/2;
Y(1,1) = sigma;
Y(2,2) = sigma;
Y(3,3) = 0;
E = X * Y * Z';


end