create view june_vacancies as
    select listings.id, property_type, host_name, count(availabilities.date) from listings
    join availabilities on availabilities.listing_id = listings.id
    where date like "2023-06-%"
    group by listings.id
;
