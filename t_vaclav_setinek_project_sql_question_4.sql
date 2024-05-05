SELECT 
    payroll_year AS year,
    ROUND(AVG(wage)) AS avg_wage,
    ROUND(AVG(price_food), 2) AS avg_food,
    ROUND(((AVG(wage) - LAG(AVG(wage), 1) OVER (ORDER BY payroll_year)) / LAG(AVG(wage), 1) OVER (ORDER BY payroll_year)) * 100, 2) AS wage_increase_percentage,
    ROUND(((AVG(price_food) - LAG(AVG(price_food), 1) OVER (ORDER BY payroll_year)) / LAG(AVG(price_food), 1) OVER (ORDER BY payroll_year)) * 100, 2) AS food_increase_percentage
FROM t_vaclav_setinek_project_sql_primary_final
WHERE payroll_year BETWEEN 2009 AND 2018
GROUP BY payroll_year;