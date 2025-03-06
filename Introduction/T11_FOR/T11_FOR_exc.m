%%% Introduction to programming with MATLAB
%%% Topic #11 - FOR-loops
%%% Objectives: Introduction to iterations with for-loops, nested for-loops
%%%
%%% Dimitris Voudouris, March 2025
%%% Practice


%% Exercise 1

% Ask the user to provide a positive integer
% Then write a for-loop to calculate the sum of all number between 1 and the given integer

% Hint: See lines 58-62 of the main script


%% Exercise 2

% Ask the user to provide a positive integer 'w' with a value between 10 and 20 (including these numbers)
% Write an if-expression to see whether the user provided a number within this range. 
%   If yes, use a for-loop and display the numbers between the value of 'w' and 1 in descending order,. Use fprintf to display the numbers
%       So if w = 10, present 10, 9, 8, ..., 1, each in a separate line, and each value should be presented through a separate iteration.
%   If the user did not give an integer between 10 and 20, return an error with a relevant message
%   We have NOT seen how to return an error. If you spend more than 10 min trying to find out how to do so, proceed to the next exercise


%% Exercise 3

% Ask the user to provide a positive integer 'q' between 100 and 200
% If the user does not give an integer between these values, throw an error (as in Exercise 2)
% Otherwise, use a for-loop that sets the variable 'q' to the next positive integer, until it has a value of 1000
% Whenever the remainder of a division between (1) the value of q at a given iteration and (2) the value 100 is zero, display the current value of 'q' by using fprintf 
% So, if q = 200, the division between q and 100 (200/100) is complete (no remainder), and so the value of q should be presented.


%% Exercise 4

% You are provided with 9 textfiles named 'trial_1' to 'trial_9'
% These are files from a real experiment where a human reached to grasp some objects and the positions of their fingers were recorded through some special cameras
% Each file contains the coordinates (x, y, z) of the participant's thumb and index finger.
% Use a for-loop to work with the data and plot the in 2 separate figures the timecourses of the z-coordinates of each finger (3rd and 6th columns)

% Make all necessary visualization additions (labels, titles, etc.)
    
    
%% END OF EXERCISES


