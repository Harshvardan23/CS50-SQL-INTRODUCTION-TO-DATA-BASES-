SELECT "first_name", "last_name" FROM (
    SELECT "first_name", "last_name", "id" FROM (SELECT "first_name", "last_name", "players"."id" as "id" from "performances"
    JOIN "players" ON "players"."id" = "performances"."player_id"
    JOIN "salaries" ON "salaries"."player_id" = "players"."id"
    and "performances"."year" = "salaries"."year"
    where "performances"."year" = 2001 and  "H" > 0
    ORDER BY "salary"/"H"
    LIMIT 10)

        INTERSECT

SELECT "first_name", "last_name", "id" FROM (select "first_name", "last_name", "players"."id" as "id" from "performances"
    Join "players" on "players"."id" = "performances"."player_id"
    Join "salaries" on "salaries"."player_id" = "players"."id"
    and "performances"."year" = "salaries"."year"
    where "performances"."year" = 2001 and  "RBI" > 0
    ORDER BY "salary"/"RBI"
    LIMIT 10))
    ORDER BY "id"
;
