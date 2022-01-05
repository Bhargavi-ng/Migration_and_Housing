# Impact of Migration on Housing Prices
## Selected Topic
Purposes of the project is to gauge the impact of in-country population migration in the U.S. on house prices. General hypothesis is population growth drives up real estate prices (and vice versa). 

### Underlying reason
We think population migration has wide ranging implications for the U.S population including economic, political, demographic and societal impact. Population migration could impact economic growth, cost of living, real estate prices, transportation, congressional redistricting, government budgets, demographic makeup, etc. In this analysis, we will show population migration patterns in the U.S. and how that has impacted housing prices.

### Description of the source of data

- The American Community Survey (ACS) done by the U.S. Census provides data on changes taking place in population and housing in the U.S. We are using county to county migration data from ACS during 2015-19. [County-to-County Migration Flows: 2015-2019 ACS](https://www.census.gov/data/tables/2019/demo/geographic-mobility/county-to-county-migration-2015-2019.html)
- Estimated total population by county over 2010-19 from the US Census: [Total population by county 2010-19](https://www2.census.gov/programs-surveys/popest/datasets/2010-2019/counties/totals/co-est2019-alldata.csv)
- Federal Housing Finance Agency (FHFA) House Price Index (HPI) is a broad measure of the movement of single-family house prices. The FHFA HPI is a weighted, repeat-sales index, meaning that it measures average price changes in repeat sales or refinancings on the same properties. [FHFA HPI data from US Federal Reserve](https://geofred.stlouisfed.org/map/?th=ylgn&cc=5&rc=false&im=fractile&sb&lng=-100.239&lat=41.558&zm=5&sl&sv&sti=942&rt=county&at=Not%20Seasonally%20Adjusted,%20Annual,%20Index%202000%3D100,%20no_period_desc&fq=Annual&dt=2020-01-01&am=Average&un=lin) 
- Interest rate data: [30-Year Fixed Rate Mortgage Average in the United States](https://fred.stlouisfed.org/series/MORTGAGE30US)

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
For this analysis, we will use linear regression machine learning (ML) model. The linear regression model will regress percentage house price changes for counties in the US over 2015-19 against population change in those countries during the same period. The linear regression model tests the null hypothesis that population growth drives up real estate prices. The ML model will take data from the provisional database as noted below. We will assess Accuracy, Precision, and Sensitivity of the model. 


## Database Integration
We created a provisional PostgreSQL database in AWS RDS that stands in for the final database. The database will static data such as the FHFA HPI for each county and population migration by county. Draft machine learning model is connected to the provisional database. 

The following is a screenshot of the schema we used for the analysis:

The following is a screenshot of mock data in the database:


## Communication Protocol
The group will communicate and keep each other posted using Slack channel for Group 3 and Zoom. 

- Link to [Group 3's Slack Channel](https://ucbvirtdatapt-puq6469.slack.com/archives/C02RWJSSP53)
- Link to Zoom call is in Slack channel. 
- Team members will work on 3 separate GitHub branches.


## Tech Used and Team Roles
