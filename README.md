# NYC_Licensed_Dogs_Analysis
**Topic:** Analysis of Active Dog Licenses in New York City, New York

[Google Slides Presentation](https://docs.google.com/presentation/d/1T5ktLkxGPgQKgACKow3VYsl-tQwlOcVyk1kZDvsj7yg/edit?usp=sharing)

[Tableau Story](https://public.tableau.com/views/NYCLicensedDogsAnalysis/NYCLicensedDogsStory?:language=en-US&:display_count=n&:origin=viz_share_link) Contains interactive images we will use for our presentation to answer some of our objective questions.

[Dashboard Storyboard](https://docs.google.com/presentation/d/1ZWdrP-9rqCWh0csM74Ab-9ThCyZBTmxM-Bc7ddR_8fY/edit?usp=sharing) Contains storyboard for the presentation dashboard, including which tools will be used and what interactive elements will be present.

app/ folder contains flask app to run the dashboard. Navigate to this folder and type Flask run in the command line to launch the app.

### Table of Contents
- [1 Project Overview](#1-project-overview)
- [2 Data Sources](#2-data-sources)
- [3 Research Questions](#3-research-questions)
- [4 Machine Learning Model](#4-machine-learning-model)
- [5 Results and Visualizations](#5-results-and-visualizations)
- [6 Summary and Recommendations](#6-summary-and-recommendations)

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

The following columns were used as features: "AnimalName", "BreedName", "AnimalGender", "AnimalBirthMonth", "LicenseIssuedDate", and "LicenseExpiredDate". "Borough" was used as the target variable. The machine learning model utilized the RandomForest module. Data was split into testing and training data using train_test_split(). The intial model had an accuracy score of 33% for all five boroughs. Overall, the model had the highest precision for Manhattan at 40%, and the lowest precision for Staten Island at 13%. This could be explained by there being more licensed dogs in Manhattan (42,607) versus Staten Island (11,155).

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

## 5 Results and Visualizations

**Dog Population by Borough**

The image below derived from our Tableau Story shows that out of the 5 boroughs, Manhattan has the most licensed dogs at exactly 41,327 dogs, following that is Brooklyn at 28,950, then Queens at 24,154, Bronx at 12,328, and last is Staten Island at 10,865. 

<p align="center"><img src="https://github.com/WhitLib/NYC_Licensed_Dogs_Analysis/blob/main/Images/Dog_Population_by_Borough.png"></p>

Results derived from our SQL database support these findings and are depicted in the table below:

<img width="1164" alt="image" src="https://user-images.githubusercontent.com/95978097/172275204-3fd8177e-a5db-4c40-8010-722cecab8ecf.png">

Queens and Manhattan surpass the remaining three boroughs with greater than 41,000 dog adoptions between 2014 and 2016. Brooklyn possessed nearly half the amount of adoptions with the Bronx and Staten Island with the least amount of adoptions during this time. 

**Top 5 Dog Breeds per Borough**

Per our analysis, we are able to see below that the top 5 dog breeds per borough are Yorkshire Terriers,  Shih Tzus, Maltese, Labrador Retrievers,  and Chihuahuas. Out of those Yorkshire Terriers are the most popular dogs in every borough besides Staten Island where Shih Tzus are the most owned. 

![This is an image](https://github.com/WhitLib/NYC_Licensed_Dogs_Analysis/blob/main/Images/Top_5_Dog_Breeds.png)

Queries created via our SQL database support this visualization. Totals for the most popular dog breeds adopted within the 5 boroughs of NYC between 2014 and 2016 are shown in the table below: 

<p align="center"><img width="229" alt="image" src="https://user-images.githubusercontent.com/95978097/172276183-5fad8383-a674-4c82-a13e-ea175c3dcaec.png"></p>

Unlike the tableau visualization (that only depict actual breed names), however, the table actually derived from our SQL database shows 'Unknown' breeds to be the number one adopted dog breed across the 5 boroughs - followed by Yorkshire Terrier, Shih Tzu, Chihuahua, Labrador Retriever, and Maltese. 

Noteably, the most popular dog breeds tend to be smaller breeds - with the exception of Labrador Retrievers.

**Top 15 Dog Names and Top 3 Dog Names per Borough**

The first image below is a chart of the Top 15 Dog Names in NYC. Bella comes at number one with 1,360 dogs with that name, followed by Max at 1,285, and Charlie at 984. The following chart is those Top 3 Dog Names per Borough which shows that Bella is the number one picked name in Bronx, Brooklyn, and Staten Island. Charlie is the top name in Manhattan, and Max is the top name in Queens. 

![This is an image](https://github.com/WhitLib/NYC_Licensed_Dogs_Analysis/blob/main/Images/Top_15_Dog_Names.png)

![This is an image](https://github.com/WhitLib/NYC_Licensed_Dogs_Analysis/blob/main/Images/Top_3_Dog_Names_per_Borough.png)

Again, our SQL database query supported these findings with Bella being the most popular adopted dog name in the NYC boroughs followed by Max and Charlie.

<p align="center"><img width="194" alt="image" src="https://user-images.githubusercontent.com/95978097/172288915-e56c5a65-a9a3-48a6-8f39-36df16996a4e.png"></p>

**Average Household Income by Census Tract**

A majority of dog adoptions within the NYC boroughs belonged to residents within Manhattan, containing 8 of the highest dog adoptions numbers across the city. Most residents resided in census tract 44, with 1070 adoptions and an average household income of $68,379.33, followed by census tract 136 with 564 adoptions and an average household income of $78,764.78. The third most popular census tract was 157 with 447 adoptions and a household income of $78,358.33. The diagram showing the top 15 census tracts is displayed below:

<p align="center"><img width="363" alt="image" src="https://user-images.githubusercontent.com/95978097/172629448-7ec92168-12e4-4c34-9ad7-b7f45831f16a.png"></p>

Interestingly enough, the top census tracts of with the highest numbers of dog adoptions went to residents of the middle-class as opposed to more wealthy folks. 

## 6 Summary and Recommendations 

The following recommendations would be made for opportunities of future research: 

- [ ] Analyze Dog Licensing Data for the years leading up to the COVID-19 pandemic (2018-2019), as well as 2020.
- [ ] Consider analyzing a 5-year range that includes the years of shelter-in-place during the COVID-19 pandemic.
- [ ] Using the same ACS data, consider pulling census tract data from the 5 boroughs by county as opposed to a lump sum.
- [ ] Consider running a neural network classification as opposed to supervised machine learning.

Overall, the data that was analyzed for this project derived interesting results related to NYC adopted dog licenses in the 5 boroughs between 2014 and 2016. However, to improve the certainty of our results, we believe the above recommendations should be considered for further research.

While we were originally interested in exploring the predicted surge of dog adoptions during the COVID-19 pandemic, the parent dataset on NYC Open Data did not supply the boroughs associated with the resident (only the zip code) - and time did not permit us to do the additional analysis to research which zip codes belong with each census tract. However, the exploration of what we believe is a tremendous increase in dog adoptions at the beginning and throughout the COVID-19 pandemic. Exploring the latter part of 2021 would also be interesting to analyze as folks began to transition back into a hyrid - or in some cases, 100% in-person work settings.

Additionally, when we first collected the data, we pulled census tract and average household income data as a lumped dataset with all 5 counties that contain each of the 5 boroughs - Bronx, Kings, New York, Richmond, and Queens. Unbenounced to us, each of these 5 counties have repetitive census tract numbers. This made it challenging to determine with certainty, that the household income for each census tract in our data were accurate. 

Lastly, we would also consider running a neural network classification in the future rather than supervised machine learning. We believe that this approach could potentially be better at handling the classification of data. However, this would required that breed names and dog names be classified as 'Other'.
