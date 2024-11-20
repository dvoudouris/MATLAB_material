%%% Introduction to programming with MATLAB
%%% Topic #5 - Visualizing data
%%% Objectives: Learn how to create line plots, histograms and bar plots, and how to adjust some graph's features
%%%
%%% Dimitris Voudouris, November 2024
%%% Practice

% The duration of each exercises is a rough estimate, but one estimate cannot fit all of you. 
% If it takes you much longer (> two times longer), then this means that this is a hard exercise. You can thus get in touch with me for advice regarding this exercise.


%% Exercise 1   - *** (5-15 min)

% a. Set the seed to 1 and create the variable 'uniform' that has 1000 uniformly distributed numbers. 
% In figure 1, create a histogram showing the distribution of these numbers.

% b. Set the seed to 1 and create the variable 'normal' that has 1000 normally distributed numbers.
% In figure 2, create a histogram showing the distribution of these numbers.
% Use red for the histogram bars.

% c. Set the seed to 1 and create the variable 'integers' that has 1000 integers between 1 and 100.
% In figure 3, create a histogram showing the distribution of these numbers.
% Use black for the histogram bars.


%% Exercise 2   - *** (15-25 min)

% Load the file 'waste_per_capita.xls' 

% a. Create a table-variable that has all information (columns) about:
% Argentina (row 6), Brazil (row 18), Chile (row 28), Peru (row 134), Uruguay (row 182)
% Call this table "southAmerica"

% b. Create another table-variable that has the same information about:
% Aruba (row 7), Bahamas (row 9), Cuba (row 39), Jamaica (row 87), Haiti (row 76)
% Call this table "caribbean"

% c. In figure 1, plot along the x-axis the 5 values related to south America
% Plot each data point using a blue square of thickness = 2
% Add a title and a label for the y-axis
% Add the country codes along the x-axis, and tilt this text by 45 degrees

% d. In figure 2, plot the same stuff as before but now for the Caribbean countries
% Use red hexagons as symbols, again with thickness = 2
% Add a title, y-label and tilted (45 deg) text along the x-axis, as before

% e. In figure 3, plot both the south American AND the Caribbean countries, each with the colors used in figures 1 and 2. 
% Connect the symbols of each variable using lines of the respective color. 
% So, the south America countries should be shown with blue circles, connected with a blue line. Similarly for the Caribbean countries. 
% Avoid using the name of countries along the x-axis, but add a y-axis label, as well as a legend indicating what does each color represent.
% Add the legend at the lower left of your figure


%% Exercise 3   - ? (10-20 min)

% Using the same file as in exercise 2...
% a. Plot in a new figure 70 the frequency with which each value occurs
% For this, consider all the values of the table, not just of one of the previously created variables!
% Important: have the values sorted in 20 bins (how to do so? Look for help) 
% Have the plotted bars in black color with red edges
% Add informative x- and y- axis labels

% b. Create a bar graph in figure 80 where you plot ALL values (of all countries, so super many values)
% Each country should be a separate bar, so you should have many many bars
% All bars should be next to each other
% The bars should be black with green outlines

% c. Compare figure 70 and figure 80. Explain what each of the two visuals shows
% Give a command to MATLAB to close figures 70 and 80


%% Exercise 4   - ***  (20-40 min)

% a. Close all open figures. Then create figure 3 that has 2 subplots on a 2x2 configuration. How to do so?
% Subplot 1 is at the upper left position, subplot 2 is at the upper right position
% In subplot 1, plot the south American countries that you used in exercise 1 (exactly the same commands)
% In subplot 2, do the same for the Caribbean countries
% Add titles to each subplot, as well as y- and x-labels, 
%   and tilted text for each datapoint along the x-axis.
% Use axis lines with equal lengths.
% Give a command to make the y-axis range the same across both panels.

% b. In the same figure, make subplot 3 (centered in the lower row of the 2x2 configuration)
% There, plot the south American countries in blue circles at x-index positions 1 to 5
% In the same subplot, add the Caribbean countries in red circles at x-index positions 1.5 to 5.5
% Use the country abbreviation along the respective positions of the x-axis, tilted by 45 deg
% Title of the subplot should be "south America & Caribbean"
% Set axes to have the same length

% c. Extend the last subplot 3 and plot:
% At x = 7 the average value of the south American countries along with the associated standard deviation. 
% Which command should you use for that? We have not talked about this yet.
% Use a blue square of size = 10 and thickness = 2
% At x = 7.5 do the same for the Caribbean countries, using a red square of size = 10 and thickness = 2
% Extend the x-axis limits from 0 to 8 and keep axes having the same lengths 
% Inspect the figure and then close all open figures


%% Exercise 5   - ? (15-25 min)

% Load the file 'road.xls'
% In figure 1, plot the temporal development of the road accidents for each country. Use a line plot. So, the number of accidents of each country is represented by a single line
% Use a different color and symbol for each country.

% b. Calculate the average number of accidents per year across all countries (You should have a vector with one average value per year.)
% Plot this average of the existing graph using a highlighted line of your preference.
% Add y- and x-labels, a title and a legend.

% c. Can you add the year-values along the x-axis? You could do this manually: xticklabels({'1994', '1995', '1996'.....}) 
% ...but does it really make sense to do it manually? We have many many numbers...
% Can you find a way to deal with this problem? We have not covered this so you need to look for help.


%% Exercise 6   - ? (15-25 min)

% a. Load the file with the debt
% Define 6 variables, each having the numerical data of a country that you would like to visualize.
% Plot these data in separate lines (one line per country). All these 6 lines should be on the same plot.
% Add an y-axis and a legend (let the x-axis be the standard one) 
% Ask MATLAB to place the legend at the best possible location

% b. The graph shows the actual debt in each time of measurement.
% Can you find a way to calculate the change of debt between subsequent measurements? 
% Plot this in a new figure and add a title.

% c. You want to get a broader impression of the debt's temporal development and so you do not care much about the debt in each quarter.
% Take a "moving average" along each country's vector, with a 'sliding window size' of 2.  
% Plot this smoothed time-course of each country in a figure with 6 panels (subplots), one per country. Each panel contains the standard data as plotted in Exercise 6b (plotted in the standard MATLAB style) 
% and the country's moving average (plotted with a thicker, black line).


%% END OF EXERCISES
