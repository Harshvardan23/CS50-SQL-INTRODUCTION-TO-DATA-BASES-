select distinct(teams.name) from players
    join performances on players.id = performances.player_id
    join teams on performances.team_id = teams.id
    where first_name = "Satchel"
    and last_name = "Paige"
;
