   -- Pomocná tabulka k Secondary t_vaclav_setinek_help_first
CREATE TABLE t_vaclav_setinek_help_first AS
(SELECT
	cp.payroll_year AS calendar_year,
	'Czech Republic' AS country,
	round(AVG(cp2.value),2) AS avg_price_food,
	round(AVG(cp.value),2) AS avg_wage
FROM czechia_payroll cp
JOIN czechia_price cp2 
	ON cp.payroll_year  = YEAR(cp2.date_from)
	AND cp.value_type_code = 5958
	AND cp.calculation_code = 200
JOIN czechia_price_category cpc ON cp2.category_code = cpc.code
WHERE cp.payroll_year BETWEEN 2009 AND 2018
GROUP BY cp.payroll_year);   
   

-- Pomocná tabulka k Secondary t_vaclav_setinek_help_second
CREATE TABLE t_vaclav_setinek_help_second AS
(SELECT
	'Czech Republic' AS cr_id,
	e.year  AS calendar_year,
	c.country,
	e.GDP,
	e.population, 
	e.gini
FROM countries c 
JOIN economies e 
	ON e.country = c.country
AND c.continent = "Europe"
WHERE year BETWEEN  2009 AND 2018
GROUP BY YEAR, country);