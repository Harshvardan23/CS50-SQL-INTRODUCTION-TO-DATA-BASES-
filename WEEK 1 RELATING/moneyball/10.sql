select first_name, last_name, salary, HR, performances.year from players
    Join performances on players.id = performances.player_id
    Join salaries on players.id = salaries.player_id
    and performances.year = salaries.year
    Order by performances.player_id, salaries.year desc, HR desc, salary desc
;

