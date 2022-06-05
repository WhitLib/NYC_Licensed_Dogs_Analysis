-- Drop unnecessary/erroneous tables
DROP TABLE avg_hi_by_censustract_boroughs;

-- Create a table of cleaned NYC dog data with only required columns
CREATE TABLE NYC_dog_data(
UID INT NOT NULL PRIMARY KEY,
Borough VARCHAR(30) NOT NULL,
Gender VARCHAR(2) NOT NULL,
BirthMonth INT NOT NULL,
BreedName VARCHAR(100) NOT NULL,
CensusTract FLOAT
);


-- View the data
SELECT * FROM NYC_dog_data;

-- Create a table of dog populations in each of the 5 NYC boroughs
CREATE TABLE borough_dog_pop (
borough VARCHAR(30) NOT NULL PRIMARY KEY,
dog_population INTEGER NOT NULL
);

-- View the data
SELECT * FROM borough_dog_pop;

-- Create a table of dog genders in each borough
CREATE TABLE borough_dog_genders (
UID INT NOT NULL PRIMARY KEY,
Borough VARCHAR(30) NOT NULL,
Gender VARCHAR(2) NOT NULL
);

-- View the data
SELECT * FROM borough_dog_genders;

-- Find the number of male and female dogs in each borough
-- and create a new table to hold the data
SELECT borough, gender, COUNT(gender)
INTO dog_gender_totals
FROM borough_dog_genders
GROUP BY borough, gender
ORDER BY borough, gender asc;

-- View the data
SELECT * FROM dog_gender_totals;

-- Find the number of male dogs adopted in Brooklyn
-- SELECT * FROM borough_dog_genders
-- WHERE borough = 'Brooklyn' AND
-- gender ='M'

-- Find the number of female dogs adopted in Brooklyn (alternative method)
-- SELECT COUNT (gender) FROM borough_dog_genders
-- WHERE borough = 'Brooklyn' AND
-- gender ='F'

-- Create a table of dog genders within each NYC borough
CREATE TABLE borough_breed_names (
UID INT NOT NULL PRIMARY KEY,
Borough VARCHAR(30) NOT NULL,
BreedName VARCHAR(100) NOT NULL
);
-- View the data
SELECT * FROM borough_breed_names;


-- Find type and number of dog breeds in each borough  
SELECT borough, breedname, COUNT(breedname)
-- INTO breed_name_totals
FROM borough_breed_names 
GROUP BY breedname, borough
ORDER BY borough, count desc;

-- View the data
SELECT * FROM breed_name_totals;

-- Create a table of dog birth months 
CREATE TABLE borough_birth_months (
UID INT NOT NULL PRIMARY KEY,
Borough VARCHAR(30) NOT NULL,
BirthMonth INT NOT NULL
);
-- View the data
SELECT * FROM borough_birth_months;

-- Create a query to determine which months most adopted dogs were born
SELECT borough, birthmonth, COUNT(birthmonth)
-- INTO birth_month_totals
FROM borough_birth_months
GROUP BY birthmonth, borough
ORDER BY borough, birthmonth asc;

-- View the data
SELECT * FROM birth_month_totals;


-- Create a table of average income by year for 2014-2016
CREATE TABLE income_by_year_by_census_tract (
Tract FLOAT NOT NULL PRIMARY KEY,
AvgHI_2014 FLOAT,
AvgHI_2015 FLOAT,
AvgHi_2016 FLOAT,
AverageHI FLOAT
);

-- View the data
SELECT * FROM income_by_year_by_census_tract;

-- Create a table that joins nyc_dog_data to income_by_year_by_census_tract
SELECT *
INTO joined_income_dog_data
FROM nyc_dog_data
INNER JOIN income_by_year_by_census_tract
ON income_by_year_by_census_tract.Tract=nyc_dog_data.CensusTract
ORDER BY censustract


-- View the data
SELECT * FROM joined_income_dog_data;


-- Create queries of the number of adoptions, the minimum and maximum household income per borough
SELECT COUNT(UID),MIN(averagehi), MAX(averagehi)
FROM joined_income_dog_data 
WHERE borough = 'Bronx'

SELECT COUNT(UID),MIN(averagehi), MAX(averagehi)
FROM joined_income_dog_data 
WHERE borough = 'Brooklyn'

SELECT COUNT(UID),MIN(averagehi), MAX(averagehi)
FROM joined_income_dog_data 
WHERE borough = 'Manhattan'

SELECT COUNT(UID),MIN(averagehi), MAX(averagehi)
FROM joined_income_dog_data 
WHERE borough = 'Queens'

SELECT COUNT(UID),MIN(averagehi), MAX(averagehi)
FROM joined_income_dog_data 
WHERE borough = 'Staten Island'