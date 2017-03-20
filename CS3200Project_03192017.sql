CREATE DATABASE IF NOT EXISTS northeasternsports;
USE northeasternsports;

DROP TABLE IF EXISTS schedule;
CREATE TABLE schedule (
  schedule_id  INT         AUTO_INCREMENT,
  home_team    VARCHAR(45) NOT NULL,
  away_team    VARCHAR(45) NOT NULL,
  date         DATE        NOT NULL,
  score        INT         NOT NULL,
  winning_team VARCHAR(45) DEFAULT 'TBD',
  losing_team  VARCHAR(45) DEFAULT 'TBD',
  CONSTRAINT schedule_pk PRIMARY KEY (schedule_id)
);

DROP TABLE IF EXISTS teams;
CREATE TABLE teams (
  team_id   INT AUTO_INCREMENT,
  team_name VARCHAR(45) NOT NULL,
  gender    VARCHAR(45) NOT NULL,
  schedule  INT         NOT NULL,
  CONSTRAINT teams_pk PRIMARY KEY (team_id),
  CONSTRAINT teams_fk_schedule FOREIGN KEY (schedule)
  REFERENCES schedule (schedule_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS coaches;
CREATE TABLE coaches (
  coaches_id INT AUTO_INCREMENT,
  name       VARCHAR(45) NOT NULL,
  rank       VARCHAR(45) NOT NULL,
  team       INT         NOT NULL,
  CONSTRAINT coaches_pk PRIMARY KEY (coaches_id),
  CONSTRAINT coaches_fk_team FOREIGN KEY (team)
  REFERENCES teams (team_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE IF EXISTS players;
CREATE TABLE players (
  player_id   INT AUTO_INCREMENT,
  player_name VARCHAR(45) NOT NULL,
  year        YEAR        NOT NULL,
  team        INT         NOT NULL,
  gender      VARCHAR(45) NOT NULL,
  position    VARCHAR(45) NOT NULL,
  number      INT         NOT NULL,
  height      INT         NOT NULL,
  weight      INT         NOT NULL,
  origin      VARCHAR(45) NOT NULL,
  CONSTRAINT players_pk PRIMARY KEY (player_id),
  CONSTRAINT players_fk_team FOREIGN KEY (team)
  REFERENCES teams (team_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);






