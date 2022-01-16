
-- Creating tables for house prices 2015-2019
CREATE TABLE HOUSE_PRICE (
	REGION_NAME VARCHAR(40) NOT NULL,
	STATE_NAME VARCHAR(40) NOT NULL,
	STATE_AND_COUNTY VARCHAR(50) NOT NULL,
	REGION_CODE VARCHAR(10) NOT NULL,
	"2000" FLOAT NULL,
	"2001" FLOAT NULL,
	"2002" FLOAT NULL,
	"2003" FLOAT NULL,
	"2004" FLOAT NULL,
	"2005" FLOAT NULL,
	"2006" FLOAT NULL,
	"2007" FLOAT NULL,
	"2008" FLOAT NULL,
	"2009" FLOAT NULL,
	"2010" FLOAT NULL,
	"2011" FLOAT NULL,
	"2012" FLOAT NULL,
	"2013" FLOAT NULL,
	"2014" FLOAT NULL,
	"2015" FLOAT NULL,
	"2016" FLOAT NULL,
	"2017" FLOAT NULL,
	"2018" FLOAT NULL,
	"2019" FLOAT NULL,
	"2020" FLOAT NULL,
	PERCENT_PRICE_CHANGE FLOAT NULL);

-- Rename the column name percent_price_change to percent_price_change_2015_19
ALTER TABLE house_price
RENAME percent_price_change TO percent_price_change_2015_19

-- Creating tables for county to county 2015-2019 migration ins outs net gross
CREATE TABLE migration_in_outs_nets_gross ( 
    state_name_of_geography_a VARCHAR(40) NOT NULL, 
    county_name_of_geography_a VARCHAR(40) NOT NULL,
    state_and_county_of_geography_a VARCHAR(50) NOT NULL,
    state_us_island_area_foreign_region_of_geography_b VARCHAR(20) NOT NULL,   
    county_name_of_geography_b VARCHAR(40) NOT NULL,
    state_and_county_of_geography_b VARCHAR(50) NOT NULL,
    flow_from_geography_b_to_geography_a INT NULL,
    counterflow_from_geography_a_to_geography_b FLOAT NULL,
    net_migration_from_geography_b_to_geography_a1 FLOAT NULL,
    gross_migration_between_geography_a_and_geography_b1 FLOAT NULL)
	


--- Join tables "migration_in_outs_nets_gross" and "house_price" and create new table house_price_migration_in_out
SELECT 
	 B.state_name_of_geography_a
	,B.county_name_of_geography_a
	,B.state_and_county_of_geography_a
	,A.REGION_CODE AS REGION_CODE_geography_a
	,B.state_us_island_area_foreign_region_of_geography_b
	,B.county_name_of_geography_b
	,B.state_and_county_of_geography_b 
	,B.flow_from_geography_b_to_geography_a
	,B.counterflow_from_geography_a_to_geography_b
	,B.net_migration_from_geography_b_to_geography_a1
	,B.gross_migration_between_geography_a_and_geography_b1 
	,A."2000" ,A."2001" ,A."2002" ,A."2003" ,A."2004" ,A."2005"
	,A."2006" ,A."2007" ,A."2008" ,A."2009",A."2010" ,A."2011" 
	,A."2012",A."2013" ,A."2014" ,A."2015" ,A."2016",A."2017" 
	,A."2018",A."2019" ,A."2020" 
	,A.percent_price_change_2015_19
INTO house_price_migration_in_out
FROM house_price A 
INNER JOIN migration_in_outs_nets_gross B
	ON A.state_and_county = B.state_and_county_of_geography_a  


