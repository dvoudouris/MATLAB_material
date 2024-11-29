%%% Introduction to programming with MATLAB
%%% Topic #6 - (more) Visualizing data
%%% Objectives: Work with bar and scatter graphs, access and edit graphics' and figure properties
%%%
%%% Dimitris Voudouris, December 2024
%%% Practice


%% Exercise 1

% Set the random number generator to 3
% Create a random vector with 30 integers between 60 and 90, each of those reflecting max humidity values during a 30-days month
% Create another vector with 30 random integers between 20 and 70, reflecting the respective min humidity values
% Use a bar graph to plot the first vector with red filling and red outlines
% At the same x-positions, plot the respective values of the second vector, superimposed over the bars of the first vector. 
% These should be in cyan filling and red outline.
% Choose bar width to ensure good visibility.
% Set the x-label to 'days of month'
% Set the y-label to 'humidity (%)'
% Set the title of the graph to the name of your favorite city/town/village.



%% Exercise 2

% Create a 12 x 4 matrix, each row representing the 12 participants in your experiment
% and each column representing the participants' Reaction Time (RT) in 4 different tasks.
% RTs should have a random integer value between 200 and 450. Set rng to 1 before generating these values.
% Although RT are typically skewed, it is fine for now to use a uniform distribution
% Use a horizontal bar graph to show the 12 RTs for each of the 4 conditions separately 
% (so, you need 4 groups of 12 bars)
% Name the y-ticks to 'Task 1', 'Task 2', etc. and set them to appear in a 90 deg angle relative to the y-axis
% Add an x-label and set the text of that label to be somewhat larger than the default.
% Add a black grid, and any other aesthetic aspects you may like.



%% Exercise 3

% Create a vector with 500 integers between 0 and 1000
% Create a figure with 4 subplots in a 2x2 arrangement
% In the first subplot (upper-left), plot a (default) histogram of your vector
% In the second subplot (upper-right), draw a histogram of the same vector in cyan color, and with a bin width of 50
% In the third subplot, (lower-left), draw a histogram of the same vector in green, and with a bin width of 25
% In the fourth subplot, draw a histogram of the same stuff in red, with a bin width of 10
% Add appropriate x- and y-labels, set the axis to be squared, add a padding
% Set the x- and y-labels to be twice as big relative to the standard
% Save the figure in *.tif format



%% Exercise 4

% Load the file with the road accidents 
% (or any other file of your preference; you can download one from the web or use one that you already have)
% Plot (some of) the data in this file and edit elements of your figure and axes so that the graph is informative and nice. 
% Use as many functions/commands as you can from those that we have already learned
% Explore the figure and/or axes properties and edit two properties that we have not done together. Explain what these edits do



%% END OF EXERCISES
