create view available as
    select listings.id, property_type, host_name, availabilities.date from listings
        join availabilities on listings.id = availabilities.listing_id
        where available = "TRUE"
;
