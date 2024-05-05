-- aip = Annual increase price
SELECT *,
    ROUND((aip_2010 + aip_2011 + aip_2012 + aip_2013 + aip_2014 + aip_2015 + aip_2016 + aip_2017 + aip_2018) / 9, 2) AS average_of_aips
FROM (
	SELECT
    foodstuff,
    ROUND(((AVG(CASE WHEN payroll_year = 2010 THEN price_food END) - AVG(CASE WHEN payroll_year = 2009 THEN price_food END)) / AVG(CASE WHEN payroll_year = 2009 THEN price_food END)) * 100, 2) AS aip_2010,
    ROUND(((AVG(CASE WHEN payroll_year = 2011 THEN price_food END) - AVG(CASE WHEN payroll_year = 2010 THEN price_food END)) / AVG(CASE WHEN payroll_year = 2010 THEN price_food END)) * 100, 2) AS aip_2011,
    ROUND(((AVG(CASE WHEN payroll_year = 2012 THEN price_food END) - AVG(CASE WHEN payroll_year = 2011 THEN price_food END)) / AVG(CASE WHEN payroll_year = 2011 THEN price_food END)) * 100, 2) AS aip_2012,
    ROUND(((AVG(CASE WHEN payroll_year = 2013 THEN price_food END) - AVG(CASE WHEN payroll_year = 2012 THEN price_food END)) / AVG(CASE WHEN payroll_year = 2012 THEN price_food END)) * 100, 2) AS aip_2013,
    ROUND(((AVG(CASE WHEN payroll_year = 2014 THEN price_food END) - AVG(CASE WHEN payroll_year = 2013 THEN price_food END)) / AVG(CASE WHEN payroll_year = 2013 THEN price_food END)) * 100, 2) AS aip_2014,
    ROUND(((AVG(CASE WHEN payroll_year = 2015 THEN price_food END) - AVG(CASE WHEN payroll_year = 2014 THEN price_food END)) / AVG(CASE WHEN payroll_year = 2014 THEN price_food END)) * 100, 2) AS aip_2015,
    ROUND(((AVG(CASE WHEN payroll_year = 2016 THEN price_food END) - AVG(CASE WHEN payroll_year = 2015 THEN price_food END)) / AVG(CASE WHEN payroll_year = 2015 THEN price_food END)) * 100, 2) AS aip_2016,
    ROUND(((AVG(CASE WHEN payroll_year = 2017 THEN price_food END) - AVG(CASE WHEN payroll_year = 2016 THEN price_food END)) / AVG(CASE WHEN payroll_year = 2016 THEN price_food END)) * 100, 2) AS aip_2017,
    ROUND(((AVG(CASE WHEN payroll_year = 2018 THEN price_food END) - AVG(CASE WHEN payroll_year = 2017 THEN price_food END)) / AVG(CASE WHEN payroll_year = 2017 THEN price_food END)) * 100, 2) AS aip_2018
FROM t_vaclav_setinek_project_sql_primary_final
WHERE payroll_year BETWEEN 2009 AND 2018
GROUP BY foodstuff DESC
) AS subquery;