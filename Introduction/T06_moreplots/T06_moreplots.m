%%% Introduction to programming with MATLAB
%%% Topic #6 - (more) Visualizing data
%%% Objectives: Work with bar and scatter graphs, access and edit graphics' and figure properties
%%%
%%% Dimitris Voudouris, December 2024


%% Intro
% Last time we saw some ways to visualize data.
% Today we will see some more ways to do so.
% We will also learn more about accessing detailed graph properties 


%% Bar graphs
% We will start with bar graphs.
% Let's create a vector with 7 values, each reflecting the maximal temperature in each of this week's days
x = 71:77;                                          % vector to assign each of the y-values to an x-position, change this to 45:51 to see the values plotted at x=45 to x=51
temp_high = [37 39 41 38 38 37 33];                 
w1 = 0.5;                                           % here we specify the width of the bars (standard is 1)
bar(x, temp_high, w1, 'FaceColor', [0.8 0 0]);      % plot x against temp_high, in red color 
% --NOTE: the x and the y values (the first two inputs) must have the same length!!

% Now let's overlay bars with the minimal temperature
temp_low = [22 20 17 16 18 15 17];                  
w2 = 0.25;       
hold on
bar(x, temp_low, w2, 'FaceColor', [0 0 0.5]);    	% plot the new vector 'temp_low' in blue and with a narrower bar, specified by w2
% --NOTE: the vector x remains the same as before


%% Horizontal bar graphs
% We can also have bars in a horizontal direction
figure;         
barh(temp_high, 'r')            % use the previously created vector and a simpler way to define color
hold on
barh(temp_low, w2, 'c')         % use the previously created vector, specify a narrower bar width and a color
% add labels and stuff
xlabel('temperature (Celsius)')
ylabel('week days')
axis square
legend('maximal', 'minimal')

% Access properties about the *axes* of the graph:
g = gca                % create variable 'g' where properties related to the axes can be accessed and edited
% gca stands for Get Current Axis
% See all the options that you can play with. We will edit only some of these.

% Add names for each day/bar (for each x-tick)
g.YTickLabel = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'};

% Let's now add a grid to see small differences between days more easily
grid on 

g.GridColorMode = 'manual';         % set the grid-color mode to manual (default is auto)
g.GridColor = 'k';                  % now you can set the color of the grid to what you want, here black
g.GridAlphaMode = 'manual';         % set the transparency option to be manual (default is auto)
g.GridAlpha = 1;                    % now we can set it to be fully opaque (well visible)
g.LabelFontSizeMultiplier = 1.5;    % change the size of the x and y labels

% Add more grid lines
g.XMinorGrid = 'on';
g.YMinorGrid = 'on';
g.MinorGridColorMode = 'manual';
g.MinorGridAlphaMode = 'manual';
g.MinorGridColor = 'k';
g.MinorGridAlpha = 1;


%% Figure properties
% You can change a whole-lot of stuff when accessing the properties of your graphics
% However, when you want to change properties of the *figure*, you need to create a different variable
close all
h = gcf;                    % Get Current Figure -if there is no figure open, it will create one 
h.WindowStyle = 'docked';   % dock the figure in the MATLAB environment
h.Color = 'k';              % set the background color of the figure to black


% Create a random vector:
rng(1);                             % set the random number generator to 1
var1 = randn(500, 1) * 100;         % 500 normally distributed numbers, each multiplied by 100 
% (we multiply to have a larger spectrum of values)
h1 = histogram(var1);               % create a histogram and assign the handle-name 'h1' to the newly opened figure
% Now you can access the properties of this new figure
h1.BinWidth = 2;                    % set the bin width to 2


%% Save a figure
saveas(h, 'myFigure.png');    % save(figure, filename)
% the first input is the figure variable. Note that you should use the command 'saveas' (which targets graphical outputs), not 'save' (which targets variables/data)
% The variable here is called 'h', as defined in line 73
% If you do not want to create an explicit variable name for your figure, then you can use the variable name 'gcf',
%   which is automatically created when opening a figure. However, in this case, gcf refers always to the most recently used figure. 
%   So in this case, MATLAB will save the figure that was active for the last time!
saveas(gcf, 'myFigure2.png'); 
% You can specify different types of extensions, from .jpg, and .tif, to .eps and .pdf
% help saveas for more information


%% Scatter plots
% Let's create a sinusoidal vector
x = 0:0.1:10*pi;
y = sin(x);

% Plot x and y against each other
% This time we will use a 'scatter' plot
% This has some advantages compared to 'simple' plot option
sz = linspace(100, 1, length(x));   % generate *length(x)* values between 1 and 100
c = linspace(1, 100, length(x));    % generate the same vector under the name 'c', not necessary but could help make the subsequent steps a bit more comprehensible
% now use these two vectors to:
% a) set the size of each marker separately (sz)
% b) set the color of each marker separately (c) 
% neither of these tasks can be done with 'plot'
s = scatter(x, y, sz, c, 'filled');         % inputs are the x-y data, and then we use 'sz' to determine the size of the markers, and 'c' to determine the color of each marker
% we could have used the following command: s = scatter(x, y, sz, sz, 'filled'); .... because 'sz' and 'c' contain the same values, but I thought that using two distinct variables would make this more understandable. 
ax = gca;       % ax for 'axes'
ax.YColorMode = 'manual';
ax.YColor = 'w';
ax.XColorMode = 'manual';
ax.XColor = 'w';
ylabel('y direction');
xlabel('x direction');
ax.LabelFontSizeMultiplier = 1.5;
axis square
axis padded


%% Take home messages - summary
% 
% 1. Access the properties of your axes by calling the Get Current Axes (gca)
% 2. Access the properties of your figure by calling the Get Current Figure (gcf)
% 3. Define each of these commands (gca, gcf) in  a variable name so that you can easily access the properties
% 4. Use a scatter plot to change the size and color of individual markers


%% The end


