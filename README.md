# NYC_Licensed_Dogs_Analysis
**Topic:** Analysis of Active Dog Licenses in New York City, New York

[Google Slides Presentation](https://docs.google.com/presentation/d/1T5ktLkxGPgQKgACKow3VYsl-tQwlOcVyk1kZDvsj7yg/edit?usp=sharing)

[Tableau Story](https://public.tableau.com/views/NYCLicensedDogsAnalysis/NYCLicensedDogsStory?:language=en-US&:display_count=n&:origin=viz_share_link) Contains interactive images we will use for our presentation to answer some of our objective questions.

[Dashboard Storyboard](https://docs.google.com/presentation/d/1ZWdrP-9rqCWh0csM74Ab-9ThCyZBTmxM-Bc7ddR_8fY/edit?usp=sharing) Contains storyboard for the presentation dashboard, including which tools will be used and what interactive elements will be present.

### Table of Contents
- [1 Project Overview](#1-project-overview)
- [2 Data Sources](#2-data-sources)
- [3 Research Questions](#3-research-questions)
- [4 Machine Learning Model](#4-machine-learning-model)

## 1 Project Overview

All dog owners who reside in New York City are required by law to license their dogs. For our final capstone project, we chose to conduct an analysis of 2014-2016 active dog licenses in NYC. We chose this topic for a number of reasons including but not limited to: 

1. The data provided via Kaggle and NYC Open Data offer data for the 5 boroughs of New York City - a large sample size of the highly populated metropolis with residental income that ranges from below poverty to highly affluent

2. Opportunities to analyze multiple variables including animal breed, name, gender, birth month, owner's borough of residence, and zip code were available

3. Who doesn't love dogs???

## 2 Data Sources

The [`NYC_Dog_Licensing_Dataset`](https://www.kaggle.com/datasets/smithaachar/nyc-dog-licensing-clean?resource=download) is a 13.68MB csv with 122K rows and 15 columns derived from Kaggle. The original `NYC_Dog_Licensing_Dataset` is an [NYC Open Data](https://data.cityofnewyork.us/Health/NYC-Dog-Licensing-Dataset/nu7n-tubp) asset that contains all active dog licenses for NYC residents. The data is sourced from the [DOHMH Dog Licensing System](https://a816-healthpsi.nyc.gov/DogLicense), where owners can apply for and renew dog licenses. The data is available for various years, but we focused on data from 2014-2016 - similar to the data available on Kaggle. 

Each record represented in the dataset is a unique dog license that was active during the year. Each record was not necessarily a unique record, since a license that was renewed during the year resulted in a separate record of an active license period. However, each record stood as a unique license period for the dog over the course of the yearlong time frame.

Additionally, the `Income by Location` dataset is a 1.3MB csv file that contains census tract and total income data for the following NYC counties: 
- New York County (Manhattan)
- Kings County (Brooklyn)
- Bronx County (Bronx)
- Richmond County (Staten Island)
- Queens County (Queens)

This dataset was derived from the [US Census Bureau](https://www.census.gov/), contains 14k rows and 8 columns. 

## 3 Research Questions

The preliminary research questions that we are looking to answer are: 

* Is there a correlation between location (borough) and dog breed? 
* Can we predict dog breed or dog name for each neighborhood?
* Do more dogs tend to be adopted in more affluent boroughs/census tracts? 

## 4 Machine Learning Model

Using the NYC dog licensing data from kaggle, the data was preprocessed by first examining the total unique values for each category as well as the number of NaN values present in the dataset. Rows with NaN values were removed from the model, as there was sufficient data (>100,000 values) to work with. Dogs with names listed as "Unknown" or "Name not provided" were removed, as this was not useful for our model and only accounted for <1,000 instances. Dogs with their gender not listed were also removed, as this would add another category to the AnimalGender column, and did not account for that many instances.

Two columns were manually encoded: "AnimalGender" and "Borough"; this was done to keep track of which integer represented which category. The remaining object categories ("AnimalName", "BreedName", and "NTA") were encoded using the LabelEncoder module from sklearn.

The following columns were used as features: "AnimalName", "BreedName", "AnimalGender", "AnimalBirthMonth", "LicenseIssuedDate", and "LicenseExpiredDate". "Borough" was used as the target variable. The machine learning model utilized the RandomForest module. Data was split into testing and training data using train_test_split(). The intial model had an accuracy score of 33% for all five boroughs. Overall, the model had the highest precision for Manhattan at 40%, and thw lowest precision for Staten Island at 13%. This could be explained by there being more licensed dogs in Manhattan (42,607) versus Staten Island (11,155).

The five supervised machine learning models we tried were decision tree, random forest, easy ensemble AdaBoost, gradient boosted tree, and SVM. SVM was run in google collab notebooks because the processing power it needed to run exceeded what the system processor was capable of. All the models performed in a similar manner with a very low accuracy score. The gradient boosted tree had the highest accuracy score at 35%, but the random forest model integrated better with the explainerdashboard module, so that is why it was chosen for the dashboard.

Summary:

Decision Tree:
  - Average Accuracy: 27%
  - Average Precision: 28%
  - Average Recall: 27%

Random Forest:
  - Average Accuracy: 33%
  - Average Precision: 29%
  - Average Recall: 33%

Easy Ensemble:
  - Average Accuracy: 26%
  - Average Precision: 29%
  - Average Recall: 25%

Gradient Boosted Tree:
  - Average Accuracy: 34%
  - Average Precision: 30%
  - Average Recall: 34%

SVM:
  - Average Accuracy: 35%
  - Average Precision: 12%
  - Average Recall: 35%

This analysis shows that there is very little correlation between dog name, dog breed, dog age, registration date, and borough. Since the top five most popular dog names and dog breeds were very similar across all boroughs, the analysis might be improved by removing these data points.

## 5 Recommendations & Further Research

Future analysis include analyzing the dataset to see if there is an increase in dog registration over more current years. A larger year span might give us more insight to see if there is a correlation between dog name, breed, age, registration date, owner income, and borough. 
