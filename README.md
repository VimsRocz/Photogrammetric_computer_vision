# Photogrammetric_computer_vision

# Projective Geometry for Image Alignment

This repository contains MATLAB code for implementing projective geometry techniques to determine the relative orientation of an image pair. The methods covered include estimating the Fundamental Matrix and the Essential Matrix, along with the implementation of a RANSAC-based approach for robustness against outliers.

## Contents

- `Ex2.m`: Main MATLAB file serving as the entrance point of the exercise.
- `ConditionTrafo.m`: MATLAB function for conditioning image coordinates.
- `EightPointAlgo.m`: MATLAB function for implementing the eight-point algorithm to determine the Fundamental Matrix.
- `GetE8Point.m`: MATLAB function to determine the Essential Matrix using calibration matrices and the eight-point algorithm.
- `EstimateE.m`: MATLAB function implementing the RANSAC-based approach to estimate the Essential Matrix.
- `DetermineConsensusSetScore.m`: MATLAB function to assess the quality of the Essential Matrix derived by a single iteration of RANSAC.
- `DecomposeE.m`: MATLAB function for decomposing the Essential Matrix to estimate the relative orientation of the image pair.
- `AuxiliaryFunctions.m`: MATLAB file containing auxiliary functions like `GetRelOcran`.

## Instructions

1. **Conditioning Image Coordinates**: Implement the `ConditionTrafo` function to condition the image coordinates before estimating the Fundamental or Essential matrix. Use this function within subsequent tasks.
2. **Determine Fundamental Matrix**: Implement the eight-point algorithm in the `EightPointAlgo` function to determine the Fundamental Matrix of the image pair.
3. **Determine Essential Matrix**: Implement the `GetE8Point` function to determine the Essential Matrix. Use calibration matrices and the eight-point algorithm.
4. **Implement RANSAC-based Approach**: Implement a RANSAC-based approach in the `EstimateE` function to robustly estimate the Essential Matrix.
5. **Determine Number of Iterations**: Calculate the minimum number of iterations required for RANSAC to select at least one subset without outliers with a probability of 99.5%.
6. **Assess Quality of Essential Matrix**: Implement the `DetermineConsensusSetScore` function to determine the size of the consensus set for the Essential Matrix.
7. **Check Constraints and Identify Inliers**: Use the Fundamental Matrix to check constraints and identify inliers in the image pairs.
8. **Decompose Essential Matrix**: Implement the `DecomposeE` function to decompose the Essential Matrix and estimate the relative orientation of the image pair.


