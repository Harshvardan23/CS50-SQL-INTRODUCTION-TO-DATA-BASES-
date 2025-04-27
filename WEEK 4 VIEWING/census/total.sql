CREATE VIEW "total" AS
    SELECT sum(families), sum(households) as households, sum(population), sum(male), sum(female) FROM "census"
;
