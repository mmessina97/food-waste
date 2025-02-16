-- Ranking in desc order of the countries that wasted more food in 2022
SELECT 
	f.Entity, 
	MAX(g.GDP) AS MaxGDP, 
	MAX(f.Total) AS MaxTotal
FROM food_waste_per_capita AS f
INNER JOIN gdp_per_capita_worldbank AS g 
ON f.Entity = g.Entity AND f.Year = g.Year 
WHERE f.Year = 2022
GROUP BY f.Entity
ORDER BY MaxTotal DESC;


-- Query for highest Retail food waste in desc order
SELECT 
	f.Entity, 
	MAX(g.GDP) AS MaxGDP, 
	MAX(f.Retail) AS MaxRetail 
FROM food_waste_per_capita AS f
INNER JOIN gdp_per_capita_worldbank AS g 
ON f.Entity = g.Entity AND f.Year = g.Year 
GROUP BY f.Entity
ORDER BY MaxRetail DESC;

-- Query for highest Out of Home food waste in desc order
SELECT 
	f.Entity, 
	MAX(g.GDP) AS MaxGDP, 
	MAX(f.Out) AS MaxOut
FROM food_waste_per_capita AS f
INNER JOIN gdp_per_capita_worldbank AS g 
ON f.Entity = g.Entity AND f.Year = g.Year 
GROUP BY f.Entity
ORDER BY MaxOut DESC;

-- Query for highest House food waste in desc order
SELECT 
	f.Entity, 
	MAX(g.GDP) AS MaxGDP, 
	MAX(f.Households) AS MaxHouseholds
FROM food_waste_per_capita AS f
INNER JOIN gdp_per_capita_worldbank AS g 
ON f.Entity = g.Entity AND f.Year = g.Year  
GROUP BY f.Entity
ORDER BY MaxHouseholds DESC;


-- Query for all food waste types
SELECT 
	f.Entity, 
	MAX(f.Year) Year, 
	MAX(g.GDP) AS GDP, 
	MAX(a.AVGY) AS AverageYearsofSchooling,  
	MAX(f.Households) AS HomeFoodWaste, 
	MAX(f.Retail) AS RetailFoodWaste, 
	MAX(f.Out) AS OutFoodWaste, 
	MAX(f.Total) AS TotalWaste
FROM food_waste_per_capita AS f
INNER JOIN gdp_per_capita_worldbank AS g 
ON f.Entity = g.Entity AND f.Year = g.Year
INNER JOIN average_years_of_schooling AS a
ON a.Entity = g.Entity AND a.Year = g.Year
WHERE f.Year > 2018
GROUP BY f.Entity;
