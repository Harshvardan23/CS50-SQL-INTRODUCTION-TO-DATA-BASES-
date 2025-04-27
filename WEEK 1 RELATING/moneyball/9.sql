select name, round(avg(salary),2) as "Average Salary" from teams
    Join salaries on teams.id = salaries.team_id
    where salaries.year = "2001"
    group by salaries.team_id
    order by "Average Salary" Asc
    Limit 5
;
