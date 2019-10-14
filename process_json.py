import json


def main():

    with open("games_info.json", "r") as game:
        game_txt = game.read()
        game_json = json.loads(game_txt)

    with open("games.sql", "w") as game:
        for x in game_json:
            txt = (
                "INSERT INTO Game (id, date, home_team_id, away_team_id, score_home, score_away) "
                + "VALUES ({id}, '{date}', {home_team_id}, {away_team_id}, '{score_home}', '{score_away}');"
            ).format(
                id=x["game_id"],
                date=x["date"],
                home_team_id=x["home_team_id"],
                away_team_id=x["away_team_id"],
                score_home=x["score_home"],
                score_away=x["score_away"],
            )
            game.write(txt + "\n\n")

    with open("events_info.json", "r") as event:
        event_txt = event.read()
        event_json = json.loads(event_txt)

    with open("events.sql", "w") as game:
        for x in event_json:
            txt = (
                "INSERT INTO Event (id, game_id, type, count, player_id) "
                + "VALUES ({id}, {game_id}, '{type}', '{count}', {player_id});"
            ).format(
                id=x["id"],
                game_id=x["game_id"],
                type=x["type"],
                count=x["count"],
                player_id=x["player_id"],
            )
            game.write(txt + "\n\n")


if __name__ == "__main__":
    main()
