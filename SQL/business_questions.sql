-- =====================================================
-- BUSINESS QUESTIONS & SQL ANALYSIS
-- Telangana Tourism Analytics Project
-- =====================================================


-- =====================================================
-- Question 1:
-- List down the top district that have the highest number of domestic visitors overall(2016-2019)?
-- Insight : Get an overview of district that are doing well.
-- =====================================================

SELECT district,sum(visitors) as Total_visitors FROM domestic_visitors
group by district
order by Total_visitors desc
limit 10;


-- =====================================================
-- Question 2:
-- List down the top 3/bottom 3 district based on compounded annual growth rate (CAGR) of visitor between (2016-2019) ?
-- Insight : Districts that are growing/declining
-- =====================================================

For Domestic Top:                                                  For Foreign top:
             SELECT * FROM cagr_domestic                                   SELECT * FROM cagr_foreign
             order by domestic_CAGR DESC                                   order by foreign_CAGR DESC
             limit 3;                                                      limit 3;                                                                         
                                                                            
For Domestic bottom:                                                  For Foreign bottom:
             SELECT * FROM cagr_domestic                                   SELECT * FROM cagr_foreign
             order by domestic_CAGR ASC                                    order by foreign_CAGR ASC
             limit 3;                                                      limit 3;                                                                                       




-- =====================================================
-- Question 3:
-- what are peak and low season months for Hyderabad based on the data from 2016 to 2019 for Hyderabad district ?
-- Insight : Government can plan well for the peak seasons and boost low season by introducing new events.
-- =====================================================

SELECT district,month,sum(visitors) as Total_visitors FROM domestic_visitors
where district="Hyderabad"
group by district,month
order by Total_visitors desc;

NOTE : I used domestic_visitors table you can use foreign_visitors table or total_visitors table.


-- =====================================================
-- Question 4:
-- show top & bottom 3 district with high domestic to foreign tourist ratio ?
-- Insight : Government can learn from top district and replication the same to to bottom district which can improve the 
             the foreign visitors as foreign visitors will being more revenue .
-- =====================================================

For Top:
       CALL tour.top_3_ratio_domestic_to_foreign();


For Bottom:
       CALL bottom_3_ratio_domestic_to_foreign();
  


-- =====================================================
-- Question 5:
-- List the top & bottom 5 district based on "population to tourist footfall ration" in year 2019?
-- Insight : find the bottom district and create a plan to accomodate more tourists.
-- =====================================================

CALL touist_to_population_footfall_ratio(
    2019,
    5,
    'DESC'
);


NOTE : ratio = Total visitors / Total residents population in the given year , for total residents population used table is 
       telangana_33_district_population which contain  2011 Census download for Statistical year book provided by telangana state  .


-- =====================================================
-- Question 6:
-- what will be project number and average revenue of domestic & foreign tourists in Hyderabad in 2025
   based on the growth rate from previous year ?
-- Insight :Better estiate of incoming tourists count and revenue so that governmen can plan the infrastructure better .
-- =====================================================

NOTE :   foreign_tourist avg per person spend is 5,600 and for domestic_tourist avg per person spend is 1,200     

CALL estimate_domistic_visitors_growth(
    'Hyderabad',
    2025
);


CALL estimate_foreign_visitors_growth(
    'Hyderabad',
     2025
);



-- =====================================================
-- Question 6:
-- Estimate foreign visitor growth
-- for Hyderabad in 2025
-- =====================================================


CALL estimate_foreign_visitors_growth(
    'Hyderabad',
    2025
);























