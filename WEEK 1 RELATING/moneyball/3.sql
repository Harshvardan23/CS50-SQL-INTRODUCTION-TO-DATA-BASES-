Select year, H from players
    Join performances on players.id = performances.player_id
    where first_name = "Ken"
    and last_name = "Griffey"
    and birth_year = "1969"
    Order by year Desc
;
