select year, salary from salaries
    Join players on salaries.player_id = players.id
    where first_name = "Cal"
    and last_name = "Ripken"
    order by year Desc
;
