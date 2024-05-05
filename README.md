# SQL-project---ver.-2
DISCORD nick Václav S.

# SQL-project
## **1. ZADÁNÍ PROJEKTU**

**Úvod do projektu**
<br> Na našem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jsme se dohodli, že se pokusíme odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové vydefinovali základní otázky, na které se pokusí odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.

Potřebují k tomu ode mne připravit robustní datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.

Jako dodatečný materiál jsem měl připravit i tabulku s HDP, GINI koeficientem a populací dalších evropských států za stejné období, jako primární přehled pro ČR.

**<br>Bylo zadáno pět výzkumných otázek:**
<br>1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?
<br>2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
<br>3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?
<br>4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?
<br>5. Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?

## **2. TVORBA TABULEK**

**<br>K zodpovězení těchto otázek jsem měl vytvořit dvě tabulky:**
<br>t_vaclav_setinek_project_SQL_primary_final
<br>t_vaclav_setinek_project_SQL_secondary_final
<br>Pro tvorbu těchto podkladů jsem vybral desetileté období od roku 2008 do roku 2019. K výpočtu průměrných mezd jsem použil calculation_code 200 pro přesnější výpočet.

<br>**Pro t_vaclav_setinek_project_SQL_primary_final jsem použil tyto zdrojové tabulky:**
<br>1. czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
<br>2. czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.
<br>3. czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
<br>4. czechia_price_category – Číselník kategorií potravin.

<br>**Pro t_vaclav_setinek_project_SQL_secondary_final jsem použil dvě pomocné tabulky, spojením těchto dvou tabulek jsem vytvořil t_vaclav_setinek_project_SQL_secondary_final:**
<br>t_vaclav_setinek_help_first
<br>t_vaclav_setinek_help_second
<br>Pro tvorbu těchto pomocných tabulek jsem použil tyto zdrojové tabulky:
<br>1. czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
<br>2. czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.
<br>3. countries - různé informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.
<br>4. economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.

## **3. ODPOVĚDI NA VÝZKUMNÉ OTÁZKY**
<br>**Otázka č.1: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?**
<br>Při meziročním porovnání, roky 2009 až 2018, lze říci, že mzdy rostou ve všech odvětvích. V roce 2013 ale je u většiny odvětví vidět pokles (při porovnání s rokem 2012). Pokud vezmeme průměr hodnot u porovnávaných let, nejlépe je na tom obor Ubytování, stravování a pohostinctví, průměr 5,15%. Nejnižší nárůst je v oboru Výroba a rozvod elektřiny, plynu, tepla a klimatizace, průměr za porovnávaná období je 1,87%.

<br>**Otázka č.2: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?**
<br>Když porovnáme roky 2009 a 2018, tak lze říci, že si lze koupit o cca 20% více u obou porovnávaných potravin (o 19% u Chleba konzumního kmínového a 21% u Mléka polotučného pasterovaného).

<br>**Otázka č.3: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?**
<br> Nejnižší meziroční nárůst ve sledovaném období je u Cukru krystalového -1,56%. Byl spočítán průměr meziročního nárůstu ve sledovaném období roky 2009 až 2018.

<br>**Otázka č.4: Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?**
<br>V porovnávaném období lze pozorovat nárůst cen potravin blížící se 10% v roce 2017 a to 9,98%. Když se podíváme na nárůst mezd ve stejném roce, tak tento nárůst byl 6,17%, rozdíl oproti cenám potravin je 3,81%.

<br>**Otázka č.5: Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?**
<br>V porovnávaném období byl výraznější nárůst HDP v roce 2017, tj. 5,17%. Tento rok došlo i k výraznějšímu nárůstu mezd o 6,19% a nárůstu cen potravin o 9,98%. V
 ostatních letech nemělo HDP výraznější vliv na změny ve mzdách a cenách potravin.
