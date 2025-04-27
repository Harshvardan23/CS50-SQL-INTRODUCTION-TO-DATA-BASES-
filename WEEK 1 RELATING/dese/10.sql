Select name, per_pupil_expenditure from districts
    Join expenditures on districts.id = expenditures.district_id
    where type like "Public School%"
    order by per_pupil_expenditure desc
    limit 10
;
