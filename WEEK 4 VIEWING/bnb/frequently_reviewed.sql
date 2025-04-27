create view frequently_reviewed as
select listings.id, property_type, host_name from listings
    join reviews on reviews.listing_id = listings.id
    group by listings.id
    order by count(listing_id) desc, property_type, host_name
    limit 100
;
