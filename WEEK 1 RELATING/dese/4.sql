select city, count(type) from schools
    where type = "Public School"
    group by city
    order by count(type) desc, city
    limit 10
;
