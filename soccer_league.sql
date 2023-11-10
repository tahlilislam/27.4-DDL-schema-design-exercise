DROP DATABASE if EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    founded DATE,
    city VARCHAR(255)
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    team_id INTEGER REFERENCES teams(id),
    position VARCHAR(50),
    date_of_birth DATE
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams(id),
    away_team_id INTEGER REFERENCES teams(id),
    match_date DATE NOT NULL,
    season_id INTEGER -- This will reference a season table, to be defined later
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches(id),
    scoring_player_id INTEGER REFERENCES players(id),
    time_scored TIME
);

CREATE TABLE match_referees (
    match_id INTEGER REFERENCES matches(id),
    referee_id INTEGER REFERENCES referees(id),
    PRIMARY KEY (match_id, referee_id)
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE
);

CREATE TABLE standings (
    team_id INTEGER REFERENCES teams(id),
    season_id INTEGER REFERENCES seasons(id),
    points INTEGER DEFAULT 0,
    goals_for INTEGER DEFAULT 0,
    goals_against INTEGER DEFAULT 0,
    wins INTEGER DEFAULT 0,
    losses INTEGER DEFAULT 0,
    draws INTEGER DEFAULT 0,
    PRIMARY KEY (team_id, season_id)
);
