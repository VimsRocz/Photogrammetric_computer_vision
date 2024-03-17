function [ E ] = EstimateE( pointsImg1, pointsImg2, K )
% Implementation of the RANSAC algorithm, which should determine a  
% essential matrix robustly.
% pointsImg1: Matrix containing homogeneous points from the first
% image. (One point per column!)
% pointsImg2: Matrix containing homogeneous points from the second
% image. (One point per column!) 
% Note: pointsImg1 and pointsImg2 have to be equally sorted, so that the
% points corresponding to the same pair have the same index.
% K: Calibration matrix
% E: Best estimation of the essential matrix.

%----------------------------------
%------------- Task 4  ------------
%----------------------------------

% TODO: Define number of iterations for RANSAC
w = 0.700;    %0.75 also
s = 8.000;
p = 0.995;  %90% is also better in the sense
n_iteration = ceil(log(1-p)/log(1-w^s));
%----------------------------------
%------------- Task 6  ------------
%----------------------------------

% TODO: Add your code here
E = zeros(3,3);
score = 0;

for i = 1:n_iteration
    id = randperm(1154,8);
    points1 = pointsImg1(:,id);
    points2 = pointsImg2(:,id);
    
    E_tmp = GetE8Point(points1,points2,K);
    score_tmp = DetermineConsensusSetScore(points1,points2,E_tmp,K);
    
    if score_tmp > score
        E = E_tmp;
        score = score_tmp;
    end  
end

end
