-- Table 'bbc'
-- Columns 'name', 'region', 'area', 'population', 'gdp'

#1 Select the code that shows the name, region and population of the smallest country in each region
SELECT name, region, population
FROM bbc x
WHERE population <= ALL (SELECT population FROM bbc y WHERE x.region = y.region AND population>0)

#2 - Select the code that shows the countries belonging to regions with all population over 50000
SELECT name, region, population
FROM bbc x
WHERE 50000 < ALL (SELECT population FROM bbc y WHERE y.population > 0 AND x.region = y.region)