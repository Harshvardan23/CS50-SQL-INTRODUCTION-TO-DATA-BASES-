select name, pupils from districts
    Join expenditures on districts.id = expenditures.district_id
;
