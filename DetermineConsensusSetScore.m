function [ score ] = DetermineConsensusSetScore( pointsImg1, pointsImg2, E, K )
% Determine the quality of the essential matrix coressponding to the point pairs.
% pointsImg1: Matrix containing homogeneous points from the first
% image. (One point per column!)
% pointsImg2: Matrix containing homogeneous points from the second
% image. (One point per column!) 
% Note: pointsImg1 and pointsImg2 have to be equally sorted, so that the
% points corresponding to the same pair have the same index.
% E: Essential matrix
% K: Calibration matrix
% score: Percentage of points contained in the consensus set.

%----------------------------------
%------------- Task 5  ------------
%----------------------------------

% TODO: Add your code here
F = inv(K)' * E * inv(K);
Threshold = 3;

I_pp = F * pointsImg1;
d_calc = I_pp' * pointsImg2 ./ sqrt(I_pp(1,:).^2 + I_pp(2,:).^2); 

n = size(d_calc,2);
count_number = 0;
for i = 1:n
    if d_calc(1,i)<Threshold
        count_number = count_number+1;
    end
end

score = count_number/n;
end