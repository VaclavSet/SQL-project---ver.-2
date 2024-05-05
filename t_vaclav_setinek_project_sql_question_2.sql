SELECT
    foodstuff,
    2009 AS food_price_s,
    2018 AS food_price_e,
    ROUND((AVG(CASE WHEN payroll_year = 2009 THEN wage  END) / AVG(CASE WHEN payroll_year = 2009 THEN price_food  END))) AS count_s,
    ROUND((AVG(CASE WHEN payroll_year = 2018 THEN wage  END) / AVG(CASE WHEN payroll_year = 2018 THEN price_food  END))) AS count_e,
    ABS((ROUND((AVG(CASE WHEN payroll_year = 2009 THEN price_food  END) / AVG(CASE WHEN payroll_year = 2018 THEN price_food  END)),2) * 100) - 100) AS percentage
FROM t_vaclav_setinek_project_sql_primary_final
WHERE payroll_year IN (2009, 2018) AND foodstuff IN ("Chléb konzumní kmínový", "Mléko polotučné pasterované")
GROUP BY foodstuff;