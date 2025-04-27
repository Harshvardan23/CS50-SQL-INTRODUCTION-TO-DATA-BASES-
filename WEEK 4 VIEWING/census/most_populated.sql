CREATE VIEW "most_populated" AS
    SELECT district, sum(families), sum(households), sum(population), sum(male), sum(female) FROM "census"
    group by district
    order by sum(population) desc
;
