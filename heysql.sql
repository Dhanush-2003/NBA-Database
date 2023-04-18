DROP SCHEMA IF EXISTS NBA;
CREATE SCHEMA IF NOT EXISTS NBA;
DROP SCHEMA IF EXISTS NBA;
CREATE DATABASE IF NOT EXISTS NBA;
USE NBA;

CREATE TABLE `NBA`.`Team` (
 `team_id` INT NOT NULL AUTO_INCREMENT,
  `name`  VARCHAR(50) NOT NULL,
  `city` VARCHAR(25) NOT NULL,
  `arena` VARCHAR(45) NOT NULL,
  `president` VARCHAR(45) NOT NULL,
  `record` VARCHAR(40) NOT NULL,
  `coach` VARCHAR(45) NOT NULL,
 PRIMARY KEY (`team_id`));
 
CREATE TABLE `NBA`.`Coaches` (
   `coach_id` INT NOT NULL AUTO_INCREMENT,
   `coach_name` VARCHAR(35) NOT NULL,
   `team_name` VARCHAR(40) NOT NULL,
   `team_id` INT NOT NULL,
   PRIMARY KEY (`coach_id`),
   FOREIGN KEY (`team_id`) REFERENCES `Team` (`team_id`)
);

CREATE TABLE `NBA`.`Awards` (
  `award_id` INT NOT NULL AUTO_INCREMENT,
  `final_mvp` VARCHAR(35) NOT NULL,
  `mvp` VARCHAR(35) NOT NULL,
  `most_three_points_made` VARCHAR(35) NOT NULL,
  `player_of_the_month` VARCHAR(50) NOT NULL,
  `coach_of_the_year` VARCHAR(50) NOT NULL,
 PRIMARY KEY (`award_id`));

CREATE TABLE `NBA`.`Game` (
  `game_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `home_team` VARCHAR(50) NOT NULL,
  `opposing_team` VARCHAR(50) NOT NULL,
  `score` VARCHAR(50) NOT NULL,
 PRIMARY KEY (`game_id`));

CREATE TABLE `NBA`.`Player` (
   `player_id` INT NOT NULL AUTO_INCREMENT,   
   `name` VARCHAR(50) NOT NULL,   
   `team_id` INT NOT NULL,   
   `draft_year` INT NOT NULL,   
   `salary` INT NOT NULL,   
   `height` INT NOT NULL,   
   `weight` INT NOT NULL,   
   `PPG` FLOAT NOT NULL,   
   `RPG` FLOAT NOT NULL,   
   `APG` FLOAT NOT NULL,   
   PRIMARY KEY (`player_id`),   
   FOREIGN KEY (`team_id`) REFERENCES Team(`team_id`) 
);

CREATE TABLE `NBA`.`Player_EFFICENCY` (
   `player_id` INT NOT NULL, 
   `three_point_percentage` FLOAT(4, 2) NOT NULL, 
   `game_id` INT NOT NULL, 
   `free_throw_percentage` FLOAT(4, 2) NOT NULL, 
   `field_goal_percentage` FLOAT(4, 2) NOT NULL, 
   FOREIGN KEY (`player_id`) REFERENCES Player(`player_id`)
);

CREATE TABLE `NBA`.`PlayerStats` (
   `player_id` INT NOT NULL,
   `game_id` INT NOT NULL,
   `points` INT NOT NULL,
   `assists` INT NOT NULL,
   `rebounds` INT NOT NULL,
   `blocks` INT NOT NULL,
   `steals` INT NOT NULL,
   `turnovers` INT NOT NULL,
   FOREIGN KEY (`game_id`) REFERENCES Game(`game_id`),
   FOREIGN KEY (`player_id`) REFERENCES Player(`player_id`),
   INDEX `idx_game_id` (`game_id`)
);


CREATE TABLE `NBA`.`Division` (
  `division_id` INT NOT NULL AUTO_INCREMENT,
  `division_name` VARCHAR(20) NOT NULL,
   PRIMARY KEY (`division_id`));

INSERT INTO Team (name, city, arena, president, record, coach)
VALUES ('Toronto Raptors', 'Toronto', 'Scotiabank Arena', 'Masai Ujiri', '28-31', 'Nick Nurse');

INSERT INTO Coaches (coach_id, coach_name, team_name, team_id) 
VALUES (1, 'Nick Nurse', 'Toronto Raptors',1); 

INSERT INTO Team (team_id, name, city, arena, president, record, coach)
VALUES (2, 'San Antonio Spurs', 'San Antonio', 'AT&T Center', 'Gregg Popovich', '14-44', 'Gregg Popovich');

INSERT INTO Coaches (coach_id, coach_name, team_name, team_id) 
VALUES (2, 'Gregg Popovich', 'San Antonio Spurs',2); 

INSERT INTO Awards (award_id, final_mvp, mvp, most_three_points_made, player_of_the_month, coach_of_the_year) 
VALUES (1, 'Kawhi Leonard', 'Steph Curry', 'Norman Powell', 'Steph Curry', 'Nick Nurse'); 

INSERT INTO Awards (award_id, final_mvp, mvp, most_three_points_made, player_of_the_month, coach_of_the_year) 
VALUES (2, 'Kawhi Leonard', 'Tim Duncan', 'Josh Richardson', 'Steph Curry', 'Gregg Popovich'); 

INSERT INTO Game (game_id, date, home_team, opposing_team, score)
VALUES (1, '2023-02-14', 'Toronto Raptors', 'Orlando Magic', '123-113');

INSERT INTO Game (game_id, date, home_team, opposing_team, score)
VALUES (2, '2023-02-13', 'Cleveland Cavaliers', 'San Antonio Spurs', '117-109');

INSERT INTO Player (player_id, name, team_id, draft_year, salary, height, weight, PPG, RPG, APG)
VALUES (1, 'Scottie Barnes', 1, 2021, 7644600, 81, 225, 15.6, 7.1, 4.9);

INSERT INTO Player (player_id, name, team_id, draft_year, salary, height, weight, PPG, RPG, APG)
VALUES (2, 'Keldon Johnson', 2, 2019, 3873025, 77, 220, 21.9, 4.7, 2.7);

INSERT INTO Player_EFFICENCY(player_id, three_point_percentage, game_id, free_throw_percentage, field_goal_percentage)
VALUES (1, 0.0, 1, 71.4, 40.0); 

INSERT INTO Player_EFFICENCY(player_id, three_point_percentage, game_id, free_throw_percentage, field_goal_percentage)
VALUES (2, 66.7, 2, 63.7, 61.5); 

INSERT INTO PlayerStats(player_id, game_id, points, assists, rebounds, blocks, steals, turnovers)
VALUES (1, 1, 17.0, 6.0, 6.0, 2.0, 1.0, 1.0);

INSERT INTO PlayerStats(player_id, game_id, points, assists, rebounds, blocks, steals, turnovers)
VALUES (2, 2, 25.0, 4.0, 2.0, 0.0, 1.0, 4.0);

INSERT INTO Division (division_id, division_name)
VALUES (1, 'Eastern Conference');

INSERT INTO Division (division_id, division_name)
VALUES (2, 'Western Conference');


SELECT * FROM Team;
SELECT * FROM Coaches;
SELECT * FROM Awards;
SELECT * FROM Game;
SELECT * FROM Player;
SELECT * FROM Player_EFFICENCY;
SELECT * FROM PlayerStats;
SELECT * FROM Division;


CREATE VIEW `PlayerStatsByGame` AS
SELECT DISTINCT  
    P.player_id, 
    P.name AS player_name, 
    PS.points, 
    PS.assists, 
    PS.rebounds, 
    PS.blocks, 
    PS.steals, 
    PS.turnovers
FROM 
    Player AS P
    JOIN PlayerStats AS PS ON P.player_id = PS.player_id
ORDER BY 
    P.name;
    
    
    
    CREATE VIEW `TeamStatsByGame` AS
SELECT DISTINCT  
    G.game_id, 
    G.date, 
    G.home_team, 
    G.opposing_team, 
    SUM(PS.points) AS points, 
    SUM(PS.rebounds) AS rebounds, 
    SUM(PS.assists) AS assists, 
    SUM(PS.blocks) AS blocks, 
    SUM(PS.steals) AS steals, 
    SUM(PS.turnovers) AS turnovers
FROM 
    Game AS G
    JOIN PlayerStats AS PS ON G.game_id = PS.game_id
GROUP BY 
    G.game_id;
    
    
    CREATE VIEW `MVPCandidates` AS
SELECT DISTINCT 
    P.player_id, 
    P.name, 
    SUM(PS.points) + SUM(PS.rebounds) + SUM(PS.assists) + SUM(PS.steals) + SUM(PS.blocks) AS total_stats
FROM 
    Player AS P
    JOIN PlayerStats AS PS ON P.player_id = PS.player_id
GROUP BY 
    P.player_id, 
    P.name
ORDER BY 
    total_stats DESC
LIMIT 5;

CREATE VIEW player_stats_and_teams AS 
SELECT ps.player_id, ps.game_id, ps.points, ps.assists, ps.rebounds, ps.blocks, ps.steals, ps.turnovers, t.city
FROM PlayerStats ps
JOIN Game g ON g.game_id = ps.game_id
JOIN Team t ON t.team_id = t.team_id
ORDER BY ps.game_id, ps.player_id;