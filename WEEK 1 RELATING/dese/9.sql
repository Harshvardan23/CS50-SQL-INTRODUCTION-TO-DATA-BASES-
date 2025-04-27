select name from districts
    join expenditures on districts.id = expenditures.district_id
    order by pupils
    limit 1
;
