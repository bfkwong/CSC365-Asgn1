CREATE TABLE Team (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    shortName VARCHAR(255) NOT NULL,
    abbr VARCHAR(255) NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE Player (
    id INTEGER NOT NULL AUTO_INCREMENT,
    team_id INTEGER NOT NULL,
    shirt_num INTEGER NOT NULL,

    first VARCHAR(255) NOT NULL,
    last VARCHAR(255) NOT NULL,

    position VARCHAR(255) NOT NULL,

    height FLOAT NOT NULL,
    weight FLOAT NOT NULL,

    birth_country VARCHAR(255) NOT NULL,
    birthdate DATE NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (team_id) REFERENCES Team(id)
);

CREATE TABLE Game (
    id INTEGER NOT NULL AUTO_INCREMENT,
    date DATE NOT NULL,
    home_team_id INTEGER NOT NULL,
    away_team_id INTEGER NOT NULL,
    score_home VARCHAR(255) NOT NULL,
    score_away VARCHAR(255) NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (home_team_id) REFERENCES Team(id),
    FOREIGN KEY (away_team_id) REFERENCES Team(id)
);

CREATE TABLE Event (
    id INTEGER NOT NULL AUTO_INCREMENT,
    game_id INTEGER NOT NULL,
    type VARCHAR(255) NOT NULL,
    count VARCHAR(255) NOT NULL,
    player_id INTEGER NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (game_id) REFERENCES Game(id),
    FOREIGN KEY (player_id) REFERENCES Player(id)
);