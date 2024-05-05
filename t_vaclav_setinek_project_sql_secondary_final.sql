CREATE TABLE t_vaclav_setinek_project_sql_secondary_final AS
(SELECT 
	tvshs.*,
   	ROUND(
    CASE
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2009 THEN t_2009.avg_wage
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2010 THEN t_2010.avg_wage
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2011 THEN t_2011.avg_wage
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2012 THEN t_2012.avg_wage
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2013 THEN t_2013.avg_wage
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2014 THEN t_2014.avg_wage
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2015 THEN t_2015.avg_wage
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2016 THEN t_2016.avg_wage
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2017 THEN t_2017.avg_wage
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2018 THEN t_2018.avg_wage
        ELSE NULL
    END) AS wage,
    CASE
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2009 THEN t_2009.avg_price_food
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2010 THEN t_2010.avg_price_food
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2011 THEN t_2011.avg_price_food
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2012 THEN t_2012.avg_price_food
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2013 THEN t_2013.avg_price_food
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2014 THEN t_2014.avg_price_food
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2015 THEN t_2015.avg_price_food
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2016 THEN t_2016.avg_price_food
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2017 THEN t_2017.avg_price_food
        WHEN tvshs.country = 'Czech republic' AND tvshs.calendar_year = 2018 THEN t_2018.avg_price_food
        ELSE NULL
    END AS price_food
FROM 
    t_vaclav_setinek_help_second tvshs 
LEFT JOIN 
    t_vaclav_setinek_help_first t_2009 ON tvshs.calendar_year = t_2009.calendar_year AND tvshs.calendar_year = 2009
LEFT JOIN 
    t_vaclav_setinek_help_first t_2010 ON tvshs.calendar_year = t_2010.calendar_year AND tvshs.calendar_year = 2010
LEFT JOIN 
    t_vaclav_setinek_help_first t_2011 ON tvshs.calendar_year = t_2011.calendar_year AND tvshs.calendar_year = 2011
LEFT JOIN 
    t_vaclav_setinek_help_first t_2012 ON tvshs.calendar_year = t_2012.calendar_year AND tvshs.calendar_year = 2012
LEFT JOIN 
    t_vaclav_setinek_help_first t_2013 ON tvshs.calendar_year = t_2013.calendar_year AND tvshs.calendar_year = 2013
LEFT JOIN 
    t_vaclav_setinek_help_first t_2014 ON tvshs.calendar_year = t_2014.calendar_year AND tvshs.calendar_year = 2014
LEFT JOIN 
    t_vaclav_setinek_help_first t_2015 ON tvshs.calendar_year = t_2015.calendar_year AND tvshs.calendar_year = 2015
LEFT JOIN 
    t_vaclav_setinek_help_first t_2016 ON tvshs.calendar_year = t_2016.calendar_year AND tvshs.calendar_year = 2016
LEFT JOIN 
    t_vaclav_setinek_help_first t_2017 ON tvshs.calendar_year = t_2017.calendar_year AND tvshs.calendar_year = 2017
LEFT JOIN 
    t_vaclav_setinek_help_first t_2018 ON tvshs.calendar_year = t_2018.calendar_year AND tvshs.calendar_year = 2018
GROUP BY calendar_year, country
ORDER BY 
    calendar_year);