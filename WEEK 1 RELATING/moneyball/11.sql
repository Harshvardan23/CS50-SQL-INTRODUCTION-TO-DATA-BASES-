SELECT "first_name", "last_name", "salary"/ "H" AS "dollars per hit" from "performances"
    JOIN "players" on "players"."id" = "performances"."player_id"
    JOIN "salaries" ON "salaries"."player_id" = "players"."id"
    and "performances"."year" = "salaries"."year"
    where "performances"."year" = 2001 and "H" > 0
    order bY "dollars per hit", "first_name", "last_name"
    limit 10
;

