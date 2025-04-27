CREATE VIEW by_district AS
    SELECT district, sum(families) as families, sum(households), sum(population), sum(male), sum(female) FROM census
    group by district
;
