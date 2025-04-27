create table Passengers
    (   "id" integer,
        "first_name" text,
        "last_name" text,
        "age" integer,
        primary key ("id")
    )
;

create table Airlines
    (   "id" integer,
        "name" text,
        "concourses" text,
        primary key ("id")
    )
;

create table Flights
    (   "id" integer,
        "flight_number" integer,
        "airline_id" integer,
        "departing_airport_code" datetime,
        "arrival_airport_code" datetime,
        "departing_datetime" datetime,
        "arival_datetime" datetime,
        primary key ("id"),
        foreign key("airline_id") references airlines ("id")
    )
;


create table CheckIns
    (   "id" integer,
        "datetime" datetime,
        "passenger_id" integer,
        "flight_id" integer,
        primary key ("id"),
        foreign key ("flight_id") references flights ("id"),
        foreign key ("passenger_id") references passengers_id ("id")
    )
;
