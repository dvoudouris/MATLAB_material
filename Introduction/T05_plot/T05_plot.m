%%% Introduction to programming with MATLAB
%%% Topic #5 - Visualizing data
%%% Objectives: Learn how to create line plots, histograms and bar plots, and how to adjust some graph's features
%%%
%%% Dimitris Voudouris, November 2024


% MATLAB offers several types of visualization options.
% We will start with simple point-data plots


%% Point-data plots
rng(1);                         % set the seed to 1, then we all have the same values
dummy = randi([1 50], 1, 10);   % create a random row vector with 10 integers between 1 and 50
% We use the command 'plot' in the following form:
% plot(input)
% So: 
plot(dummy(1))                  % plot the first value of the vector
% Oops, we do not see anything. This is because the default plotting marker is too small
% Let's choose a larger marker
plot(dummy(1), 'o')             % use a circle
% In other words: 
% plot(input, properties)       % help plot to see all details --we will cover several, but not all

% We now have a graphic. What do we see?
% First, a new window opened, named Figure 1
% Here, we see a single panel (set of x- and y-axes)
% In this panel we see that the single data point of our input variable is plotted at x = 1, y = dummy(1)
% x = 1 because our input (dummy(1)) contains a single value.
% Let's now plot the value(2)
plot(dummy(2), 'o')             % use again a circle
% Again, the value is plotted at x = 1 because again our input (dummy(2)) contains a single value
% What will happen if we plot the first 3 values?
plot(dummy(1:3), 'o')
% The first value is plotted at     x = 1, y = dummy(1)
% The second value is plotted at    x = 2, y = dummy(2)
% The third value is plotted at     x = 3, y = dummy(3)
% Similarly, we can plot all 10 values: 
plot(dummy, 'ro')                   % now use red circles

% Remember:
% plot(input, properties)
% The x-axis values correspond to the index position of your input's variable
% The y-axis values correspond to the actual value of the input

% Now that we saw the basis plotting principle, we can go on with some more meaningful data


%% Line plots
% Let's load the debt file
debt = readtable('teina230_spreadsheet.xlsx');

% Take the numerical values about Belgium (row 3)
debt_BEL = debt{3, 2:2:end};          % as column-input we give those columns that contain numerical elements
% Let's now plot Belgium's debt:
plot(debt_BEL)          
% x-axis represents the index positions of the elements in the variable debt_BEL
% y-axis represented the actual value of each element for each index position
% We can make the graph more informative
ylabel('debt (% GDP)')              % add a label along the y-axis
xlabel('time (a.u.)')               % and a label along the x-axis

% Let's now create some more variables for other countries
debt_BUL    = debt{4, 2:2:end};        % Bulgaria
debt_CZ     = debt{5, 2:2:end};        % Czechia
debt_DK     = debt{6, 2:2:end};        % Denmark
debt_GER    = debt{7, 2:2:end};        % Germany
debt_EST    = debt{8, 2:2:end};        % Estonia
debt_IRL    = debt{9, 2:2:end};        % Ireland
debt_GRE    = debt{10, 2:2:end};       % Greece

% Say, we now want to plot the data of Bulgaria
plot(debt_BUL, 'ro-')    % use a red line with circular markers 
% The previous plot about Belgium is now gone; Figure 1 has only the data about Bulgaria. 
% What if we want to plot two or more datasets in the same plot?
hold on                 % holds the current figure *on* and adds subsequent graphs
plot(debt_CZ, 'go-')    % plot the debt of Czechia in green circles connected with a green line
% We can set some graphic's properties:
ylim([0 50])            % sets the range of the y-axis values from 0 to 50
% Note the bracketing used (square brackets inside normal brackets)
% Also note that the smaller value is typed before the larger one. 
% *** This means that, when you want to set negative values along the y-axis, say 0 to -30, you should type ylim([-30 0]), and not ylim([0 -30]) *** 
xlim([0 13])            % same logic for x-axis
legend('BUL', 'CZ', 'location', 'best')             % the order is sensitive, if you would type legend('CZ', 'BUL') then the green data would appear as if they belonged to Bulgaria
plot(debt_BEL, 'bo-', 'DisplayName', 'BEL')         % plot also the data about Belgium...(details in a bit)
% There are two main points here:
% First, where are Belgium's data now?
%   Remember, we set the y-values between 0 and 50, what if Belgium has values outside this window?
%   Set the y-axis values to automatically fit the plotted data:
ylim auto                   % here we are

% Second, in newer MATLAB versions, adding another plot-command while *holding on* and while having set a legend
%   will auto-update the existing legend. However, because the legend will be updated with an odd name, 
%   we proactively define a DisplayName to set the name for that new data correctly

% Now plot the debt of Ireland without a DisplayName and see how the legend behaves
plot(debt_IRL, 'mo-')


%% Setting some properties related to the graphics
% We can add a grid to better tell differences between datapoints
grid on
axis square                     % will make the two axes have the same length
title('debt of some countries')
ylabel('debt (% GDP)'); xlabel('time (a.u.)')   
xticklabels( {''} )             % will repeat an empty field along each tick of your x-axis (so it will make the values along the x-axis disappear)

% Open a new figure:
figure(3)   
% Let's plot the debt of Estonia using 
%   - squares of the RGB color that will be defined in square brackets,
%   - a thickness of the squares equal to 2 arbitrary units,
%   - black color of the interior of the squares, and
%   - with each square having a size equal to 10 arbitrary units
plot(debt_EST, 's', 'color', [0.301, 0.745, 0.933], 'Linewidth', 2, ...
    'MarkerFaceColor', 'k', 'markersize', 10)

% Keep the latest used figure on and add a dashed line connecting the squares
% The line should have the RGB color defined in the square brackets
hold on; plot(debt_EST, ':', 'Color', [.5, .5, .5])
title(' debt of Estonia')
ylabel('debt (% GDP)'); xlabel('time (a.u.)')   
xlim([0 11])    % same logic for x-axis
xticklabels({''}) 
axis square

% Open figure 80 and plot...
figure(80)  
plot(debt_DK, 'rv-', 'markersize', 5); hold on  % the debt of Denmark
plot(debt_GER, 'm^-', 'Markersize', 5)          % and the plot of Germany
axis padded         % adds a margin between the plot and the plot box
close(80)   % now close figure 80 /// if you want to close several, but not all, figures do: close(input), e.g., close(1, 2, 89) means close figures 1, 2, and 89
close all   % and now close all open figures


%% Plot a complete matrix
% Let's now plot all data of our matrix
% When plotting matrices, MATLAB will plot each *column* in a separate line
% In the case of the current datafile, our interest is likely on how the debt of each country develops over time,
%   which means that we are interested in plotting each *row* in a separate line
% So, we want to plot row 1 with a specific color, row 2 with another color, etc.
% How to do so? Transpose the matrix, so row 1 becomes column 1...
plot(debt{:, 2:2:end}')       % all rows, columns 2-to-end ///note the accent after closing the curly bracket, which will transpose the matrix
hold on
title('all countries')
ylabel('debt (% GDP)'); xlabel('time (a.u.)')   
xticklabels({''}) 
axis square; axis padded

plot(debt{2, 2:2:end}, 'k', 'Linewidth', 4)     % highlight the timecourse of the second country, just for fun
% I chose to highlight this curve by setting it to black and choosing a line with thickness of 4 arbitrary units 


%% Histograms
% Another type of visuals are histograms
% These show you the frequency with which a certain value appears
% Open a new figure and plot a histogram of the debts of Belgium
figure; histogram(debt_BEL)
histogram(debt_BEL, 'Edgecolor', 'k', 'Facecolor', 'b', 'Linewidth', 2)     
% set the color of the bars to Blue, of the outlines to black (k), and
%   set the thickness of the outline to 2 arbitrary units
ylim([0 10])
% What does the histogram tell us?
% That there is one instance of values (debt as % of the GDP) between 90 and 100, five instances of values between 100 and 110, etc.


%% Bar graphs
figure;     % In a new figure, plot a bar graph with the debt of Germany
bar(debt_GER, 'Facecolor', [25/255 54/255 132/255], 'Edgecolor', [174/225, 127/255, 156/255], 'Linewidth', 2) 
% Each bar shows the debt for a given time. 
% The bar graph is similar to the line plot that we created earlier.
% Let's superimpose the line plot over the bar graph to confirm this.
hold on;   % Important :) 
plot(debt_GER, 'o-', 'Color', [112/255, 163/255, 79/255], 'LineWidth', 2)   
% Plotting in MATLAB typically requires normalised RGB color values (from 0 to 1). Instead of a value [255 255 255], it uses [1 1 1]. 
% So, I define the color triplets by dividing the RGB values by 255.

% We can plot two debts next to each other:
close all
bar([debt_GER, debt_GRE])   % first 10 bars belong to variable 1 (Germany), next 10 to variable 2 (Greece). Not quite a meaningful visualization
bar([debt_GER; debt_GRE])   % at x = 1, we plot the bars associated with the first row, at x = 2 we plot those associated with the other row. Quite similar as in the line above
bar([debt_GER', debt_GRE']) % at each x-index, there are 2 values, one per variable (first for Germany, second for Greece). This might be more informative


%% Take home messages - summary
% 1. Open and close a figure using the command 'figure(optional_number)', and 'close(optional_number)', respectively
% 2. Produce point-data plots and line-plots using the command 'plot'
%   plot(input, optional_properties)    ///help plot for more details
% 3. Produce histograms using the command 'histogram'
% 4. Produce bar graphs using the command 'bar'
% 5. Useful commands to set graphic properties:
%       ylim, xlim, ylabel, xlabel, xticklabels, yticklabels, title, legend, axis square, axis padded, axis equal, grid on
%       We can't cover all these in the seminar, so you should be at least aware of the commands and ideally try these commands out


%% The end

