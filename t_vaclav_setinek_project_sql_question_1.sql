-- aiw = Average increase wage
SELECT *,
    ROUND((aiw_2010 + aiw_2011 + aiw_2012 + aiw_2013 + aiw_2014 + aiw_2015 + aiw_2016 + aiw_2017 + aiw_2018) / 9, 2) AS average_of_aiws
FROM (
SELECT
    branch,
    ROUND(((AVG(CASE WHEN payroll_year = 2010 THEN wage END) - AVG(CASE WHEN payroll_year = 2009 THEN wage END)) / AVG(CASE WHEN payroll_year = 2009 THEN wage END)) * 100, 2) AS aiw_2010,
    ROUND(((AVG(CASE WHEN payroll_year = 2011 THEN wage END) - AVG(CASE WHEN payroll_year = 2010 THEN wage END)) / AVG(CASE WHEN payroll_year = 2010 THEN wage END)) * 100, 2) AS aiw_2011,
    ROUND(((AVG(CASE WHEN payroll_year = 2012 THEN wage END) - AVG(CASE WHEN payroll_year = 2011 THEN wage END)) / AVG(CASE WHEN payroll_year = 2011 THEN wage END)) * 100, 2) AS aiw_2012,
    ROUND(((AVG(CASE WHEN payroll_year = 2013 THEN wage END) - AVG(CASE WHEN payroll_year = 2012 THEN wage END)) / AVG(CASE WHEN payroll_year = 2012 THEN wage END)) * 100, 2) AS aiw_2013,
    ROUND(((AVG(CASE WHEN payroll_year = 2014 THEN wage END) - AVG(CASE WHEN payroll_year = 2013 THEN wage END)) / AVG(CASE WHEN payroll_year = 2013 THEN wage END)) * 100, 2) AS aiw_2014,
    ROUND(((AVG(CASE WHEN payroll_year = 2015 THEN wage END) - AVG(CASE WHEN payroll_year = 2014 THEN wage END)) / AVG(CASE WHEN payroll_year = 2014 THEN wage END)) * 100, 2) AS aiw_2015,
    ROUND(((AVG(CASE WHEN payroll_year = 2016 THEN wage END) - AVG(CASE WHEN payroll_year = 2015 THEN wage END)) / AVG(CASE WHEN payroll_year = 2015 THEN wage END)) * 100, 2) AS aiw_2016,
    ROUND(((AVG(CASE WHEN payroll_year = 2017 THEN wage END) - AVG(CASE WHEN payroll_year = 2016 THEN wage END)) / AVG(CASE WHEN payroll_year = 2016 THEN wage END)) * 100, 2) AS aiw_2017,
    ROUND(((AVG(CASE WHEN payroll_year = 2018 THEN wage END) - AVG(CASE WHEN payroll_year = 2017 THEN wage END)) / AVG(CASE WHEN payroll_year = 2017 THEN wage END)) * 100, 2) AS aiw_2018
FROM t_vaclav_setinek_project_sql_primary_final
WHERE payroll_year BETWEEN 2009 AND 2018
GROUP BY branch
) AS subquery;
