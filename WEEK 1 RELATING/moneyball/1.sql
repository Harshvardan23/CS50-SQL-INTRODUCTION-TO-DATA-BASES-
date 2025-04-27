select Round(avg(salary),2) as "Avergae salary", year from salaries
    Group by year
    order by year Desc
;
