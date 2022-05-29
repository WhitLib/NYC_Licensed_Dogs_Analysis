# NYC_Licensed_Dogs_Analysis
**Topic:** Analysis of Active Dog Licenses in New York City, new York

[Google Slides Presentation](https://docs.google.com/presentation/d/1T5ktLkxGPgQKgACKow3VYsl-tQwlOcVyk1kZDvsj7yg/edit?usp=sharing)

[Tableau Story](https://public.tableau.com/views/NYCLicensedDogsAnalysis/NYCLicensedDogsStory?:language=en-US&:display_count=n&:origin=viz_share_link) Contains interactive images we will use for our presentation and to answer some of our objective questions.

### Table of Contents
- [1 Project Overview](#1-project-overview)
  - [1.1 Communication Protocols](#11-communication-protocols)
- [2 Data Sources](#2-data-sources)
- [3 Research Questions](#3-research-questions)

## 1 Project Overview

All dog owners who reside in New York City are required by law to license their dogs. For our final capstone project, we chose to conduct an analysis of 2014-2016 active dog licenses in NYC. We chose this topic for a number of reasons including but not limited to: 

1. The data provided via Kaggle and NYC Open Data offer data for the 5 boroughs of New York City - a large sample size of the highly populated metropolis with residental income that ranges from below poverty to highly affluent

2. Opportunities to analyze multiple variables including animal breed, name, gender, birth month, owner's borough of residence, and zip code were available

3. Who doesn't love dogs???

### 1.1 Communication Protocols

To collaborate and discuss our roles and responsibilities, objectives and progress, our team has an ongoing check-in every **Saturday** evening. When we are not meeting and require quick interactions, we communicate via a team Slack channel.

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
