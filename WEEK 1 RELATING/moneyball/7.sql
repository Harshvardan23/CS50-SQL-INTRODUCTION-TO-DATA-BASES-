Select first_name, last_name from players
    Join salaries on players.id = salaries.player_id
    Order by salary Desc
    Limit 1
;

