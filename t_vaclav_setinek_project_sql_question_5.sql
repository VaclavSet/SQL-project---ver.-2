SELECT
    calendar_year,
    price_food,
    wage,
    ROUND(GDP),
    ROUND((wage - LAG(wage, 1) OVER (ORDER BY calendar_year)) / NULLIF(LAG(wage) OVER (ORDER BY calendar_year), 0) * 100,2) AS percentage_wage,
    ROUND((price_food - LAG(price_food, 1) OVER (ORDER BY calendar_year)) / NULLIF(LAG(price_food) OVER (ORDER BY calendar_year), 0) * 100, 2) AS percentage_price_food,
    ROUND((GDP - LAG(GDP, 1) OVER (ORDER BY calendar_year)) / NULLIF(LAG(GDP) OVER (ORDER BY calendar_year), 0) * 100, 2) AS percentage_GDP
FROM t_vaclav_setinek_project_sql_secondary_final tvspssf 
WHERE country = 'Czech Republic' AND wage IS NOT NULL AND price_food IS NOT NULL
ORDER BY calendar_year;