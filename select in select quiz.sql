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

#3 - Select the code that shows the countries with a less than a third of the population of the countries around it
SELECT name, region
FROM bbc x
WHERE population < ALL (SELECT population/3 FROM bbc y WHERE x.region = y.region AND x.name != y.name)

#4 - Select the result that would be obtained from the following code:
SELECT name FROM bbc
 WHERE population >
       (SELECT population
          FROM bbc
         WHERE name='United Kingdom')
   AND region IN
       (SELECT region
          FROM bbc
         WHERE name = 'United Kingdom')
-- The code would show countries with population > UK and in the same region as UK
|Table D|
_________
|France |
|Germany|
|Russia |
|Turkey |

#5 - Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).
SELECT name
FROM bbc
WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')

-- OR
SELECT name
FROM bbc
WHERE gdp > ALL (SELECT gdp FROM bbc WHERE region = 'Africa')


#6 - Select the code that shows the countries with population smaller than Russia but bigger than Denmark
SELECT name
FROM bbc
WHERE population < (SELECT population FROM bbc WHERE name = 'Russia')
AND population > (SELECT population FROM bbc WHERE name = 'Denmark')

#7 - Select the result that would be obtained from the following code:
SELECT name FROM bbc
WHERE population > ALL
		(SELECT MAX(population)
		FROM bbc
		WHERE region = 'Europe')
AND region = 'South Asia'
-- The code would show countries in South Asia with population more than largest country in Europe
|Table C	|
_____________
|Bangladesh	|
|India		|
|Pakistan	|












