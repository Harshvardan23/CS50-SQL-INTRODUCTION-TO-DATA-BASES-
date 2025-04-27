select name from schools
    where ID in
    (select school_id from graduation_rates
    where graduated = "100"
    )
;
