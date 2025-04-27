select districts.name, expenditures.per_pupil_expenditure, staff_evaluations.exemplary from districts
    Join expenditures on districts.id = expenditures.district_id
    Join staff_evaluations on districts.id = staff_evaluations.district_id
    where districts.type = "Public School District"
    and per_pupil_expenditure >=
    (select avg(per_pupil_expenditure) from expenditures
    )
    and exemplary >=
    (select avg(exemplary) from staff_evaluations
    )
    Order by exemplary desc, per_pupil_expenditure desc
;
