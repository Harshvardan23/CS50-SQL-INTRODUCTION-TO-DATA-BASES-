select name, sum(H) as "Total Hits" from teams
    Join performances on teams.id = performances.team_id
    where performances.year = "2001"
    Group by performances.team_id
    order by "Total Hits" Desc
    Limit 5
;
