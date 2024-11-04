%%% Introduction to programming with MATLAB
%%% Topic #3 - Reading files
%%% Objectives: Practice various ways to read files
%%% 
%%% Dimitris Voudouris, November 2024
%%% Practice


%% Exercise 1

% a. Load the file with the debt and then create four different variables, 
% each with the debt data for each of the following four countries:
% Denmark (row 6), Finland (row 28), Sweden (row 29), Norway (row 30)

% b. Create a numerical matrix that includes the data of these four countries.
% Choose a reasonable name for this matrix


%% Exercise 2

% a. Load the file with the waste 
% Column 1 shows the country
% Column 2 shows the abbreviation of that country
% Column 3 shows the amount of waste per kg per citizen per day

% b. Use three different ways to calculate the average waste across all countries


%% Exercise 3

% a. Load the file 'road.csv'
% It contains road accidents in six European countries over the last years. 
% Source: https://data.oecd.org/transport/road-accidents.htm
% Column 1 is the country abbreviation
% Column 6 is the year
% Column 7 is the reported number of accidents

% b. Calculate the total number of accidents in GERmany between 1970 and 2020 (rows 629-679)

% c. Calculate the average number of accidents in SWEden between 1970 and 2020 (rows 477-527)

% d. Calculate the median number of accidents in ESTonia between 1970 and 2020 (rows 889-939)

% NOTE: choosing the rows manually is absolutely fine. 
% We will see more efficient ways to do this in future topics. 


%% Exercise 4

% Using the same file...
% a. Create a 51 x 2 matrix named SWEEST that contains the number of accidents for SWEden (SWE) and ESTonia (EST)
% (each column should be a country, each row a year)
% Rows for Sweden: 477-527
% Rows for Estonia: 889-939

% b. Add a third column in this matrix that has the difference in the number of
% accidents between these two countries for each year (positive should mean that Sweden has more accidents than Estonia in that given year)

% c. It would be great to also know the year of each row...
% Add a fourth column that has the year number for each row

% d. But it will look better if the year is column 1...
% Adjust the matrix so that the year is in column 1, Sweden data is in column 2, 
% Estonia data is in column 3 and the difference is now in column 4 (we have done such re-arrangements in the past)

% e. Calculate the maximal and minimal values of the calculated differences

% f. Find the year when the maximal and minimal differences occur


%% Exercise 5

% Using the same file...
% a. Calculate the average number of accidents over all years for the following countries, in a separate variable for each country
% Create a column vector named 'averages' that contains the six average values
% Germany, rows:    629-679
% Greece, rows:     991-1041
% Sweden, rows:     477-527
% Estonia, rows:    889-939
% Spain, rows:      1189-1238

% b. Calculate the standard deviation of the number of accidents for each country, again in separate variables for each country
% Create a column vector named 'SDs' that contains the six values

% c. Create six variables that each contains one of the five country codes found in column 1 of your data matrix. 
% Create a column vector named 'countries' that has the five names

% d. Create a 6 x 3 table named "av_SD" 
% Note that we have *not* talked about how to create a table --your task is to find this out
% Column 1 has the country label (that you created in part c)
% Column 2 has the 5 average values (part a)
% Column 3 has the 5 standard deviations (part b)

% e. Sort the new table so that the country with the most
% accidents appears first and the one with the fewest appears last.


%% END OF EXERCISES
