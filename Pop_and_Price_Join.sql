SELECT * FROM house_price;
SELECT * FROM cleaned_in_outs;
-------------------------------------------------------------------------------
SELECT hp.state_and_county,
	hp."2015",
	hp."2019",
	hp.percent_price_change_2015_19
INTO test_table
FROM house_price AS hp
INNER JOIN cleaned_in_outs AS co
ON hp.state_and_county = co.State_and_County_of_Geography_A;