CREATE TABLE t_vaclav_setinek_project_sql_primary_final AS
(SELECT
	cp.value AS price_food,
	cp.category_code,
	cp2.value AS wage,
	cp2.value_type_code,
	cp2.unit_code,
	cp2.calculation_code,
	cp2.payroll_year,
	cpib.code,
	cpib.name AS branch,
	cpc.code AS foodstuff_code,
	cpc.name AS foodstuff,
	cpc.price_value,
	cpc.price_unit
FROM czechia_price cp 
JOIN czechia_payroll cp2 
	ON cp2.payroll_year  = YEAR(cp.date_from)
	AND cp2.value_type_code = 5958
	AND cp2.calculation_code = 200
JOIN czechia_payroll_industry_branch cpib 
	ON cp2.industry_branch_code  = cpib.code
JOIN czechia_price_category cpc 
	ON cpc.code = cp.category_code);