function [F] = EightPointAlgo(pointsImg1, pointsImg2)
% Implementation of the 8 point algorithm, which computes the fundamental
% matrix based on 8 or more point pairs.
% pointsImg1: Matrix containing homogeneous points from the first
% image. (One point per column!)
% pointsImg2: Matrix containing homogeneous points from the second
% image. (One point per column!) 
% F: Fundamental matrix

%----------------------------------
%------------- Task 2  ------------
%----------------------------------

% TODO: Add your code here

num= size(pointsImg1,2);

T_1 = ConditionTrafo(pointsImg1);
T_2 = ConditionTrafo(pointsImg2);
points_image_1 = T_1 * pointsImg1;
points_image_2 = T_2 * pointsImg2;

A = [];
for i = 1:num
    temp = kron(points_image_1(:,i),points_image_2(:,i));
    A = [A;temp'];
end

[U,S,V] = svd(A);

if num >= 9
    f_pp = V(:,9);
else
    f_pp = V(:,8);
end

F_pp = reshape(f_pp,[3,3]);
[U_1,S_1,V_1] = svd(F_pp);
S_1(3,3) = 0;
F_p = U_1 * S_1 * V_1';

F = T_2' * F_p * T_1;
end