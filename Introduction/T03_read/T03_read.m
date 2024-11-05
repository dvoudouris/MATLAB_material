%%% Introduction to programming with MATLAB
%%% Topic #3 - Reading files
%%% Objectives: Practice various ways to read files
%%% 
%%% Dimitris Voudouris, November 2024


%% One important reminder
% Before we proceed to today's topic, that's a reminder to keep on using
% comments along your code. Write comments and read them again to ensure
% that they describe correctly your intentions. Then review your code to
% confirm that your code does what you want it to do.


%% Today we start with loading files
% We can load several different file formats in MATLAB (.xls, .csv, ...)
% We will start with loading the native MATLAB format (*.mat)
 
% Loading a mat-file is simple
load __demodata.mat         % REMEMBER: The data file needs to be accessible to MATLAB, otherwise you will get complaints
% You can make the file accessible in two main ways:
% 1. Save your data file in your current folder. To prove this, set your current folder to a directory where the file '__demodata.mat' is *not* in, and try to load it.
%   According to the error that you get, we need to either change our MATLAB current folder, or add the file's folder to the MATLAB path. 
%   So here comes the second way (setting the MATLAB path)...
% 2. Go to Tab HOME and click 'Set Path' in the panel ENVIRONMENT. Then click 'Add folder' and choose the folder where your data file is.
%   Alternatively, you can also execute: 
%   addpath('XXXX');    ,where XXXX is the folder where your data file is. 
% Now MATLAB will search for files not only in your 'Current Folder, but also in the folders added in the path.

% Other ways to read a file that is neither located in your current folder nor in your search path, 
% include loading the complete path than just the filename: 
load 'XXXX/__demodata.mat'  
% , where XXXX is the folder where the __demodata.mat file is located. 

% Once the file is loaded, you can see a new variable in the your workspace. 
% This variable may have a different name than the filename, as in our case today.
% This is because I had saved a MATLAB variable 'stimlist' under the filename '__demodata.mat'.
% So when I load the filename '__demodata.mat', the contained variable 'stimlist' will appear in my workspace.
% We will see more about saving files in the next topic. 


%% Loading a .txt file
load __demodata.txt                           % the same file as before, but now as .txt

% Loading such a text file with the command *load* is easy, as long as the file contains only numbers
% The following file contains characters/words in the first row, each of which explains the contents of each column
load __demodata_str.txt                       % this command will complain because *load* cannot handle text       

% One way to deal with this is to use the command *readmatrix*:
mydata = readmatrix('__demodata_str.txt');  % reads the ^numerical^ values of the matrix included in the specified file and adds the contents in the variable 'mydata'
mydata(:, 1);                               % will load the complete first column
mydata(end, end);                           % will load the last row from the last column
mean(mydata(:, 3));                         % will calculate the average value across all rows from column 3
% Now we can treat the variable 'mydata' as a numerical matrix and apply all operations that we learned during the last two topics

% A limitation of 'readmatrix' is that any text in the data file is not loaded. But perhaps you want to use that text too.
% In this case, you need to treat the file as a 'table'. Therefore, use *readtable*:
mydata = readtable('__demodata_str.txt');   % will read the matrix, including any text, and add the contents in the variable 'mydata'. The contents of 'mydata' will now be updated!
mydata(:, 1);                               % will read all rows of column 1, but there is now also a header

% Although *readtable* is helpful for having access to header information, 
% it makes it slightly more complicated to work with the numerical contents of the file.
% This is because accessing the elements is done in a slightly different way than when accessing elements of a purely numerical matrix. 
% Using *readmatrix* is helpful in the sense that you can access the elements by treating the variable as a numerical matrix, 
% but it has the disadvantage of missing the header information and any other text contained in the file.
% 
% There is no correct or wrong way when choosing between *readtable* and *readmatrix*. 
% You should choose what works best with the data that you have, the operations you want to do, and with your own programming mindset. 


%% Access elements from a table
% We can create a new matrix that contains only columns 1 and 3 from our original 'mydata' matrix
mydata_small = [mydata(:, 1), mydata(:, 3)];      % works but it is not recommended: too long, prone to errors
mydata_small = mydata(:, [1 3]);                  % shorter, less prone to typing errors
% Even better:
target_cols = [1, 3, 4];                          % define the columns you want to choose
mydata_small = mydata(:, target_cols);            % then use the variable from line 78 to access the columns you wish
% The last operation may appear trivial, but it is not.
% Imagine you want to choose these specific columns at several instances of your script.
% If you use the command in line 75 or 76, you should go to each relevant line and change the numbers.
% If you use the commands in lines 78-79, you need to specify the columns only at one instance, and this will update all your lines (so: faster and less prone to errors)

% The approaches shown above are good if you want to keep header information.
% In newer versions of MATLAB you can do calculations with the numerical values of the table. 
% For instance, you can calculate the average of the data in column 2
mean(mydata(:, 2));                               % get the average of column 2
% This will return the average *and* the header

% If you do not want to have the header but only the numerical value, or if you are working with an older version of MATLAB...
% ...you can work around this. There are two ways:
mean(mydata{:, 2});                       % Use the curly brackets to choose the ^numerical^ values of your column (i.e. do not consider the header)
mean( mydata.intensity );                 % Choose the numerical values of the desired column by typing the variable name, followed by a dot and then by the respective header's name
% Obviously, if you want to apply the same operation  (e.g., mean) to several columns, the first way is faster.


%% Access specific rows from a table
mydata_small = mydata(1, :);                % it will choose all columns from row 1
mydata_small = mydata([1, 2, 3, 4], :);     % it will choose all columns from rows 1 to 4
mydata_small = mydata(1:4, :);              % as in the previous line, but shorter (note that, now, the row-input does not require square brackets)
mydata_small = mydata(10:16, [1, 4]);       % choose rows 10-16 from columns 1 and 4   

% Define target rows and target columns to make operations more efficient
target_rows = 2:2:size(mydata, 1);          % Choose the even rows (start from row=2 and, with a step-size of 2, go until you reach the maximal number of rows)
target_cols = [2, 4];                       % Choose columns 2 and 4
mydata_small = mydata(target_rows, target_cols);    % Using normal brackets will return also the headers
mydata_small = mydata{target_rows, target_cols};    % Using curly brackets will return only the numerical values
% NOTE: it can get really hard to visually notice the difference between the two previous lines!


%% Access specific columns from a table
% Sometimes your data file may have many columns. Let's load such a file, in Excel format:
debt = readtable('teina230_spreadsheet.xlsx');     
% The file teina230_spreadsheet has data about governmental debt of European countries as % of their GDP. 
% The data are presented for each quarter of each of the last few years. 
debt_EU = debt(1, :);               % Here is the debt across EU for each quarter since 2019
debt_EU = debt(1, 2);               % Here is the debt across EU for the 2nd quarter of 2019
debt_EU = debt( 1, [12, 14] );      % Here is the debt for the last 2 quarters of 2020
% This can now get messy because you have to manually count to find the columns you want
% Alternatively, you can type:
debt_EU = [ debt.x2020_Q3(1), debt.x2020_Q4(1) ];       % as we saw before, use the dot to choose the column, and specify in the bracket the number of rows from that column (row 1 reports the EU debt, ...)
debt_EU = debt{ 1, {'x2020_Q3', 'x2020_Q4' } };         % same as before but with a different format (curly brackets for numerical values, input is row=1 and columns as specified with the headers' names in the curly brackets)
% Both these options will give you the numerical values of the respective columns
% If you want to get also the headers, then the second option would be your way, but with normal (not curly) brackets
debt_EU = debt( 1, {'x2020_Q3', 'x2020_Q4' } );       % use normal brackets to get the headers too


%% Take home messages - summary
%
% 1. Load/read a MATLAB data file (*.mat) using the command 'load'
%       Ensure the file is in your data path
% 2. Read other data files (*.txt, *.xls, *.csv, ...) with 'readtable' or 'readmatrix'
%       The former will contain also header and text data, the latter will keep only numerical values
% 3. If you use 'readtable', access numerical values by:
%   - using curly brackets
%   - using the dot system (variablename.headername)
%   - using the name of the header as column inputs within curly brackets
% 4. Perform operations as we have seen before
%
%
% We are at a stage that you should start feeling familiar with basic operations. 
% For instance:
% Do you feel comfortable accessing rows and columns of a numerical matrix?  
% Do you feel comfortable using the comma (,) the semicolon (;) and the colon (:) when working with matrices?
% If not, contact me and let me know your specific questions/difficulties.


%% The end

