CREATE TABLE Player (
    id INTEGER NOT NULL AUTO_INCREMENT,
    team_id INTEGER NOT NULL,
    shirt_num INTEGER NOT NULL,

    first STRING NOT NULL,
    last STRING NOT NULL,

    position STRING NOT NULL,

    height FLOAT NOT NULL,
    weight FLOAT NOT NULL,

    birth_country STRING NOT NULL,
    birthdate DATE NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (team_id) REFERENCES Team(id)
);

CREATE TABLE Game (
    id INTEGER NOT NULL AUTO_INCREMENT,
    date DATE NOT NULL,
    home_team_id INTEGER NOT NULL,
    away_team_id INTEGER NOT NULL,
    score_home STRING NOT NULL,
    score_away STRING NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (home_team_id) REFERENCES Team(id),
    FOREIGN KEY (away_team_id) REFERENCES Team(id)
);

CREATE TABLE Event (
    id INTEGER NOT NULL AUTO_INCREMENT,
    game_id INTEGER NOT NULL,
    type STRING NOT NULL,
    count STRING NOT NULL,
    player_id INTEGER NOT NULL,

    PRIMARY KEY (id),

    FOREIGN KEY (game_id) REFERENCES Game(id),
    FOREIGN KEY (player_id) REFERENCES Player(id)
);

CREATE TABLE Team (
    id INTEGER NOT NULL AUTO_INCREMENT,
    name STRING NOT NULL,
    shortName STRING NOT NULL,
    abbr STRING NOT NULL,

    PRIMARY KEY (id)
);