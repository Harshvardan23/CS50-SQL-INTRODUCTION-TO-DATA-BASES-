Select salary from salaries
    Join teams on salaries.team_id = teams.id
    Join performances on salaries.player_id = performances.player_id
    where salaries.year = "2001"
    Order by performances.HR desc
    Limit 1
;
