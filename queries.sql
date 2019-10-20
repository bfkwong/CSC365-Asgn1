SELECT last, first, Player.id, count(Player.id) as goals
FROM Player INNER JOIN Event ON Player.id = Event.player_id
    WHERE type="Goals scored"
    GROUP BY Player.id
    HAVING goals >= 3;

SELECT DISTINCT shortName, name
FROM (
    SELECT team_id, Player.id, count(Player.id) as goals
    FROM Player INNER JOIN Event ON Player.id = Event.player_id
        WHERE type="Goals scored"
        GROUP BY Player.id
        HAVING goals >= 3
) as Player RIGHT JOIN Team ON Player.team_id = Team.id;

SELECT *
FROM (
    SELECT * FROM Game
        WHERE score_home > 3 OR score_away > 3
) as Teams LEFT JOIN Team ON Teams.home_team_id = Team.id;