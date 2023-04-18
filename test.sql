CREATE SCHEMA NBA;

CREATE TABLE `NBA`.`TEAM` (
 `team_id` INT NOT NULL AUTO_INCREMENT,
  `name`  VARCHAR(50) NOT NULL,
  `city` VARCHAR(25) NOT NULL,
  `arena` VARCHAR(45) NOT NULL,
  `manager` VARCHAR(45) NOT NULL,
  `w/l` VARCHAR(40) NOT NULL,
  `coach` VARCHAR(50) NOT NULL,
 PRIMARY KEY (`team_id`));

CREATE TABLE `NBA`.`COACHES` (
  `coach_id` INT NOT NULL AUTO_INCREMENT,
  `coach_name` VARCHAR(35) NOT NULL,
  `championships_acquired` VARCHAR(40) NOT NULL,
 PRIMARY KEY (`coach_id`));

CREATE TABLE `NBA`.`AWARDS` (
  `award_id` INT NOT NULL AUTO_INCREMENT,
  `final_mvp` VARCHAR(35) NOT NULL,
  `mvp` VARCHAR(35) NOT NULL,
  `most_three_points_made` INT NOT NULL,
  `player_of_the_month` VARCHAR(50) NOT NULL,
  `coach_of_the_year` VARCHAR(50) NOT NULL,
 PRIMARY KEY (`award_id`));

CREATE TABLE `NBA`.`GAME` (
  `game_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `opposing_team` VARCHAR(50) NOT NULL,
  `home_team` VARCHAR(50) NOT NULL,
  `score` INT NOT NULL,
  `referee` VARCHAR(50) NOT NULL,
 PRIMARY KEY (`game_id`));

CREATE TABLE `NBA`.`PLAYER_EFFICENCY` (
  `player_id` INT NOT NULL,
  `3p%` FLOAT(0, 2) NOT NULL,
  `game_id`  INT NOT NULL,
  `ft%` FLOAT(0, 2) NOT NULL,
  `effiicency_rating` INT NOT NULL,
  `fg%` FLOAT(0, 2) NOT NULL,
   FOREIGN KEY (`player_id`) REFERENCES Player(`player_id`));
CREATE TABLE `NBA`.`PLAYER` (
  `player_id` INT NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(50) NOT NULL,
   `team_id` INT NOT NULL,
   `draft_year ` INT NOT NULL,
   `salary ` INT NOT NULL,
   `height ` INT NOT NULL,
   `weight ` INT NOT NULL,
   `PPG ` FLOAT(3, 1) NOT NULL,
   `RPG ` FLOAT(3, 1) NOT NULL,
   `APG ` FLOAT(3, 1) NOT NULL,
   PRIMARY KEY (`player_id`),
   FOREIGN KEY (`team_id`) REFERENCES Team(`team_id`));

CREATE TABLE `NBA`.`PLAYERSTATS` (
  `player_id` INT NOT NULL,
  `game_id` INT NOT NULL,
  `points` INT NOT NULL,
  `assists` INT NOT NULL,
  `rebounds` INT NOT NULL,
  `blocks` INT NOT NULL,
  `steals` INT NOT NULL,
  `turnovers` INT NOT NULL,
   FOREIGN KEY (`game_id`) REFERENCES Player(`game_id`),
   FOREIGN KEY (`player_id`) REFERENCES Player(`player_id`));

CREATE TABLE `NBA`.`DIVISION` (
  `division_id` INT NOT NULL AUTO_INCREMENT,
  `division_name` VARCHAR(20) NOT NULL,
   PRIMARY KEY (`division_id`));
