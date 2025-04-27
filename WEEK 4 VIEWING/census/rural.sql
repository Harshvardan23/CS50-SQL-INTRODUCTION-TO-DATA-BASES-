CREATE VIEW "rural" AS
    SELECT * FROM "census"
    where locality like "%Rural%"
;
