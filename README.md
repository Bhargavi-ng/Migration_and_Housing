# Impact of Migration on Housing Prices
## Selected Topic
Purposes of the project is to gauge the impact of in-country population migration in the U.S. on house prices. We will identify population migration patters in the U.S. using various visualization. General hypothesis is population growth drives up real estate prices (and vice versa). 

### Underlying reason
We think population migration has wide ranging implications for the U.S population including economic, political, demographic and societal impact. Population migration could impact economic growth, cost of living, real estate prices, transportation, congressional redistricting, government budgets, demographic makeup, etc. In this analysis, we will show population migration patterns in the U.S. and how that has impacted housing prices.

### Description of the source of data

- The American Community Survey (ACS) done by the U.S. Census provides data on changes taking place in population and housing in the U.S. We are using county to county migration data from ACS during 2015-19. [County-to-County Migration Flows: 2015-2019 ACS](https://www.census.gov/data/tables/2019/demo/geographic-mobility/county-to-county-migration-2015-2019.html). 
	- The raw data is in this [text file](https://github.com/hishamdewan/Migration_and_Housing/blob/main/Resources/Net_Gross_US.txt)
- Estimated total population by county over 2010-19 from the US Census: [Total population by county 2010-19](https://www2.census.gov/programs-surveys/popest/datasets/2010-2019/counties/totals/co-est2019-alldata.csv)
	- The raw data is in this [csv file](https://github.com/hishamdewan/Migration_and_Housing/blob/main/Resources/County_population_totals_2010_2019_co-est2019-alldata.csv)
- Federal Housing Finance Agency (FHFA) House Price Index (HPI) is a broad measure of the movement of single-family house prices. The FHFA HPI is a weighted, repeat-sales index, meaning that it measures average price changes in repeat sales or refinancings on the same properties. [FHFA HPI data from US Federal Reserve](https://geofred.stlouisfed.org/map/?th=ylgn&cc=5&rc=false&im=fractile&sb&lng=-100.239&lat=41.558&zm=5&sl&sv&sti=942&rt=county&at=Not%20Seasonally%20Adjusted,%20Annual,%20Index%202000%3D100,%20no_period_desc&fq=Annual&dt=2020-01-01&am=Average&un=lin) 
- Interest rate data: [30-Year Fixed Rate Mortgage Average in the United States](https://fred.stlouisfed.org/series/MORTGAGE30US)
- "All-Transactions House Price Index for the United States" from Federal Housing Finance Agency (FHFA) is a broad measure of the movement of single-family house prices in the US. [All-Transactions House Price Index for the United States](https://fred.stlouisfed.org/series/USSTHPI)

### Questions we hope to answer with the data
- What areas are people leaving and where are they going?
- What is the scale of migration over time?
- Which counties saw highest and lowest % increase and decrease in migration? 
- When people move, are they staying in their current state or go to a different state?
- What is the impact of population change on residential real estate prices?
- How could you use population migration data and real estate prices to make home buying decision or planning your next move?
- What other factors drive real estate price (e.g. interest rates, income/wealth, property tax)?
- What are some other implications of population migration (e.g. overall cost of living, congressional redistricting)?

## Machine Learning Model
We will use two machine learning model for this analysis:

1) A linear regression model will regress percentage house price changes for counties in the US over 2015-19 against population change in those countries during the same period. The linear regression model tests the null hypothesis that population growth drives up real estate prices. The ML model will take data from the provisional database as noted below. We will assess the quality of the model using R squared metric. 

Process [House Price Index for all counties](https://github.com/hishamdewan/Migration_and_Housing/blob/main/Resources/GeoFRED_All-Transactions_House_Price_Index_by_County_Index.xlsx):

- Remove unnecessary columns for house prices between 1975-1999.
- Create columns for population change and real estate price change.
- Export a CSV file with cleaned house price data.

New CSV file after clean up can be found here [Cleaned data - House Price Index for all counties](https://github.com/hishamdewan/Migration_and_Housing/blob/main/Resources/house_price_df.csv).

Code for the above clean up can be found here [Jupyter Notebook - House Price Index Data Clean Up](https://github.com/hishamdewan/Migration_and_Housing/blob/main/House_Price.ipynb).

Process [County-to-County Migration Flows 2015-2019 ACS data](https://github.com/hishamdewan/Migration_and_Housing/blob/main/Resources/Net_Gross_US.txt) 
- Remove unnecessary columns in the migration data. 
- Create pivot table showing population change absolute migration by county and as % of total population. 

Linear regression model

- Establish a connection to the following database using SQLAlchemy.
- Create a scatter plot of percentage house price changes vs migration change 
- Create a model regresses percentage house price changes vs migration change in those countries during the same period.
- Evaluate the model using R Squared and other metrics.
  
  The Code for the above can be found here [Jupyter Notebook - Linear Regression for house price and migration](https://github.com/hishamdewan/Migration_and_Housing/blob/main/linear_regression_HPI_vs_pop.ipynb)

1) We will use a second linear regression model that will regress "All-Transactions House Price Index for the United States" on "30-Year Fixed Rate Mortgage Average in the United States" between 2000-2021. This model will tests the hypothesis that falling interest rates drives up housing prices in the U.S. We will assess the quality of the model using R squared and other metrics. 

## Database Integration
We created a provisional PostgreSQL database in AWS RDS that stands in for the final database. The database will static data such as the FHFA HPI for each county and population migration by county. Draft machine learning model is connected to the provisional database. 

The following is a screenshot of the entity relations diagram (ERD) we used for the analysis:

![ERD_PreliminaryDraft](/Resources/ERD_PreliminaryDraft.png)

The following is the link for the schema used in the database: [Database schema](https://raw.githubusercontent.com/hishamdewan/Migration_and_Housing/main/Resources/create_tables_sql)


## Communication Protocol
The group will communicate and keep each other posted using Slack channel for Group 3 and Zoom. 

- Link to [Group 3's Slack Channel](https://ucbvirtdatapt-puq6469.slack.com/archives/C02RWJSSP53)
- Link to Zoom call is in Slack channel. 
- Team members will work on 3 separate GitHub branches.


## Tech Used and Team Roles
- Data Sources: 
    - US Census migration data: [County-to-County Migration Flows: 2015-2019 ACS (census.gov)](https://www.census.gov/data/tables/2019/demo/geographic-mobility/county-to-county-migration-2015-2019.html)
    - Various real estate price indices (e.g. US FHA Price Index, Zillow home price index, US CPI specific for real estate, etc.) : [Search Results | FRED | St. Louis Fed (stlouisfed.org)](https://fred.stlouisfed.org/searchresults/?st=All-Transactions%20House%20Price%20Index&t=county&ob=sr&od=desc&types=gen;geot)

- Data Clean up: Jupyter Notebook, Python, Pandas Library
- Database: PostgresSQL, Amazon Relational Database Service
- Data Visualization: Tableau


### Team Members
1. Hisham Dewan
2. Shirley Liu
3. Zhen Fung
4. Bhargavi Nagarajappa
5. Teruki Ito
6. Merina Kansakar

### Team Roles for First Segement of the Project:
- Square Role: Hisham Dewan
- Triangle Role: Teruki Ito, Zhen Fung
- Circle Role: Shirley Liu, Merina Kansakar
- X Role: Bhargavi Nagarajappa

### Team Roles for Second Segement of the Project:
- Square Role: 
- Triangle Role:
- Circle Role: 
- X Role: 






