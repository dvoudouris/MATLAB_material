%%% Introduction to programming with MATLAB - WS 2024/25
%%% Meeting #4 - Saving data
%%% Objectives: Practice various ways to save variables in datafiles of different formats
%%%
%%% Dimitris Voudouris, November 2024


%% Recap
% In the last topic, we saw various ways to read files of different formats.
% Today we will see how to save our variables in files of different formats.


%% Let's first save a mat-file

% To do so, we need some data...Let's load the debt file
debt = readtable('teina230_spreadsheet.xlsx');     

% We now want to choose a sub-matrix of this dataset
% I will choose the debt of some Mediterranean states
% I know that these values occur in rows 6, 28, 29, 30 (note, we will learn more efficient ways to choose rows and columns from a matrix/table)
target_rows = [10, 11, 12, 14, 15, 20];
debt_Med = debt(target_rows, :);        % new table with data from rows belonging to the target countries

% And now we can save these data in a mat-file
save Med debt_Med                  % note: the file name will be 'Med', but after loading this file, you will see a variable 'debt_Med' in your workspace
% in short: save filename variable
% note: no commas allowed!

% What if you want to give a filename that includes spaces?
% Then you need to use brackets and quotes
save('Mediterranean debt', 'debt_Med')
% in short: save('filename', 'variable')
% note: a comma is now required!

% Let's confirm that we did things correctly
clear           % get rid of all variables so that we can...
load Med      % ...load the one we created and check our workspace

% Same for the other file
clear
load 'Mediterranean debt.mat'


%% Important
% If you ask MATLAB to save without specifying a variable name, then MATLAB will save all variables of your workspace under the provided filename
% Example:
var1 = 1:10;
var2 = 5:14;
var3 = var1 .* var2;    
save allvars
clear 
load allvars        % check your workspace to see that you now have four variables loaded. Why four and not three?


%% We can also save files as .txt, .xls, and other such formats

% We can use the 'writetable' command to write txt-files. Columns will be separated with single space
writetable(debt_Med, 'Med.txt')                         
% See the file with the spacing
type Med.txt      % quick way to check what's in there

% Use 'writetable' and separate columns by a tab
writetable(debt_Med, 'Med.txt', 'Delimiter', '\t');
type Med.txt      % now it reads somewhat easier (but still not great)

% We can also write the data to a spreadsheet (e.g., xls format)
writetable(debt_Med, 'Med.xls');
type Med.xls          % will not display anything meaningful because 'type' does not work with spreadsheets

% We can also append data to an existing file
writetable(debt_Med, 'Med.xls', 'WriteMode', 'append');
% Here we append the data 'debt_Scand' to the file 'Scand.xls'
% So what will this file contain?
% do: readtable Med.xls to see what is in there

% Note that the variable will be appended even if it does not have the same number of columns with the one already written in the file
% e.g., the following operation creates a table with five columns
debt_Med_2020 = debt_Med(:, [1, 8:14]);               
writetable(debt_Med_2020, 'Med.xls', 'WriteMode', 'append'); % appends the 5-column sub-matrix to the Scand.xls file
% The new sub-matrix is appended below the previous data. 
% This can't be done with numerical matrices. Now MATLAB fills up the indices with NaNs
readtable('Med.xls')

% You can also save data (e.g., 2020 matrix) in a different sheet of a given spreadsheet
writetable(debt_Med_2020, 'Med.xls', 'Sheet', 2);

% Or you can simply overwrite the previous file
writetable(debt_Med_2020, 'Med.xls', 'WriteMode', 'overwritesheet');
readtable('Med.xls')

% Files can be written also to other locations
target_folder = 'XXX';      % where XXX is a directory in your computer
writetable(debt_Med_2020, sprintf('%s\\Med.xls', target_folder));
cd(target_folder);          % cd stands for 'change directory'. MATLAB will move you to that directory. 


%% You can also write the data into a matrix

var1 = randn(10, 8);
writematrix(var1, 'some random variable');                      % text file, by default
writematrix(var1, 'some random variable', 'Delimiter', '\t');   % default text file but columns separated by tab
writematrix(var1, 'some random variable.xls');                  % now a spreadsheet

% Can we use readtable to read a numerical matrix?
readtable('some random variable.xls');
% Yes! The function 'readtable' will just create headers for each column (Var1, Var2, ...)

% Let's now go one step back
disp(debt_Med);       % here is our table 'debt_Med'
% Can we use writematrix to save a table ?
writematrix(debt_Med, 'Med_num.xls')
% No! The function 'writematrix' expects a numerical matrix, not a table.


%% Take home messages - summary
% 1. Save a MATLAB data files (*.mat) using the command 'save'
%   The file will be saved at your current folder
% 2. Save in other formats (*.txt, *.xls, ...) with 'writetable' or  'writematrix' depending on whether your variable is a table or numerical matrix
% 3. If you want to save the file elsewhere than your current folder, then you need to specify the path in the filename
% 4. Use 'help writetable', 'help writematrix', and 'help save' to play around with the options and tailor the commands to your needs


%% The end

