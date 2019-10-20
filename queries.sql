-------------------
------- # 1 -------
-------------------

SELECT last, first, Player.id, count(Player.id) as goals
FROM Player INNER JOIN Event ON Player.id = Event.player_id
    WHERE type="Goals scored"
    GROUP BY Player.id
    HAVING goals >= 3;

-------------------
------- # 2 -------
-------------------

SELECT DISTINCT shortName, name
FROM (
    SELECT team_id, Player.id, count(Player.id) as goals
    FROM Player INNER JOIN Event ON Player.id = Event.player_id
        WHERE type="Goals scored"
        GROUP BY Player.id
        HAVING goals >= 3
) as Player RIGHT JOIN Team ON Player.team_id = Team.id;

-------------------
------- # 3 -------
-------------------

(SELECT Team.id, Team.name
FROM (
    SELECT * FROM Game
    WHERE score_home > 3
) as Teams LEFT JOIN Team ON Teams.home_team_id = Team.id)
UNION
(SELECT Team.id, Team.name
FROM (
    SELECT * FROM Game
    WHERE score_away > 3
) as Teams LEFT JOIN Team ON Teams.away_team_id = Team.id);

-------------------
------- # 4 -------
-------------------

SELECT Winner FROM
    (SELECT Winner, COUNT(Winner) as Wins FROM (
        SELECT id,
            CASE
                WHEN score_home > score_away THEN score_home
                WHEN score_home < score_away THEN score_away
                ELSE "tie"
            END AS Winner
        FROM Game
    ) as Results GROUP BY Winner ORDER BY Wins DESC)
as Wins WHERE Winner <> "tie" GROUP BY Winner LIMIT 1;

-------------------
------- # 5 -------
-------------------

SELECT id, away_team_id as opponent FROM
(SELECT Winner FROM
    (SELECT Winner, COUNT(Winner) as Wins FROM (
        SELECT id,
            CASE
                WHEN score_home > score_away THEN score_home
                WHEN score_home < score_away THEN score_away
                ELSE "tie"
            END AS Winner
        FROM Game
    ) as Results GROUP BY Winner ORDER BY Wins DESC)
as Wins WHERE Winner <> "tie" GROUP BY Winner LIMIT 1) as Winner
JOIN
Game ON Winner.Winner = Game.home_team_id WHERE score_home < score_away
UNION
SELECT id, home_team_id as opponent  FROM
(SELECT Winner FROM
    (SELECT Winner, COUNT(Winner) as Wins FROM (
        SELECT id,
            CASE
                WHEN score_home > score_away THEN score_home
                WHEN score_home < score_away THEN score_away
                ELSE "tie"
            END AS Winner
        FROM Game
    ) as Results GROUP BY Winner ORDER BY Wins DESC)
as Wins WHERE Winner <> "tie" GROUP BY Winner LIMIT 1) as Winner
JOIN
Game ON Winner.Winner = Game.away_team_id WHERE score_home > score_away;
