-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament;

-- Tables

-- Table for players
CREATE TABLE players(id SERIAL PRIMARY KEY, player_name TEXT);

-- Table for matches
CREATE TABLE matches(id SERIAL PRIMARY KEY,
					 winner_id INT REFERENCES players(id),
					 loser_id INT REFERENCES players(id));

-- View

-- Standings: count number of matches and wins for each player
CREATE VIEW view_standings AS
	SELECT players.id, players.player_name,
		   (SELECT COUNT(matches.winner_id) FROM matches
		   			WHERE players.id = matches.winner_id) AS wins,
		   (SELECT COUNT(matches.id) FROM matches
		   			WHERE players.id = matches.winner_id
		   			OR players.id = matches.loser_id) AS games FROM players
   	ORDER BY wins DESC, games DESC;


