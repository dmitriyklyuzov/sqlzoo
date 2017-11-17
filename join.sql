#1 - show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player
FROM goal
WHERE teamid = 'GER'

#2 - From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match. Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table. Show id, stadium, team1, team2 for just game 1012

SELECT id, stadium, team1, team2
FROM game
WHERE id = '1012'

#3 -The FROM clause says to merge data from the goal table with that from the game table. The ON says how to figure out which rows in game go with which rows in goal - the id from goal must match matchid from game. (If we wanted to be more clear/specific we could say ON (game.id=goal.matchid)
-- The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored.
-- Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player,teamid, stadium, mdate
FROM game JOIN goal ON (game.id=goal.matchid)
WHERE goal.teamid = 'GER'

#4 - Use the same JOIN as in the previous question. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE goal.player LIKE 'Mario%'

#5 - The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON teamid = id
WHERE gtime<=10

