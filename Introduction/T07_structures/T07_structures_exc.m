%%% Introduction to programming with MATLAB
%%% Topic #7 - Structures
%%% Objectives: Learn how to initiate structure arrays, and navigate with fields
%%%
%%% Dimitris Voudouris, December 2024
%%% Practice


%% Exercise 1   - *** (5-10 min)

% Load the file 'trial_1'
% This trial contains the position of an object along the three principal axes (x, y, z) and 
%   over a recording of a certain period of time
% Each column represents one of the axes (column 1: x-axis; column 2: y-axis; column 3: z-axis)
% Each row represents one moment during the recording (row 1: time-point 1, row 2: time-point 2, etc.)
% Assign the data of each column in a separate field of a structure that is named 'data'.
% Choose fieldnames that make sense.


%% Exercise 2   - *** (5-10 min)

% a. Extend the previous structure by adding one more field named 'info'.
% This field contains some text that describes what is in each field.
%   e.g,. 'x y z position of trial 1'

% b. Now bring this field before the three other ones.


%% Exercise 3   - *** (5-10 min)

% a. Add one more field in this structure and name it 'trialnr'
% This field contains a single number that corresponds to the trial number 
%   (e.g., in this example, it should be 1 because you read trial_1). 

% b. Now bring this field in the second position (after the 'info' field).


%% Exercise 4   - *** (15-20 min)

% Create an automatically docked figure with light gray background.
% This figure should have three subplots: 
%   in each of these subplots, plot the x-, y-, and z-data of your data-file
% Use a black line for each curve, a red (fully) opaque grid and a title over each subplot indicating the axis that you plot. 
% Add x- and y-legends, and anything else that you think is nice for your visualization
    
    
%% END OF EXERCISES

