select schools.name, per_pupil_expenditure, graduated from districts
    Join expenditures on districts.id = expenditures.district_id
    Join schools on districts.id = schools.district_id
    Join graduation_rates on schools.id = graduation_rates.school_id
    Order by per_pupil_expenditure desc, schools.name
;
