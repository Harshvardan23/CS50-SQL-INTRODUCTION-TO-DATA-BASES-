create table Users
    (   "id" integer,
        "first_name" text,
        "last_name" text,
        "username" text Unique,
        "password" text,
        primary key ("id")
    )
;

create table Schools
    (   "id" integer,
        "name" text,
        "School_type" text,
        "location" text ,
        "founding_year" integer,
        primary key ("id")
    )
;

create table Industries
    (   "id" integer,
        "name" text,
        "industry" text,
        "location" text ,
        primary key ("id")
    )
;

create table UserConnections
    (   "user1_id" integer,
        "user2_id" integer,
        primary key ("user1_id","user2_id"),
        foreign key ("user1_id") references users ("id"),
        foreign key ("user2_id") references users ("id")
    )
;


create table UserSchools
    (   "user_id" integer,
        "school_id" integer,
        "start" date,
        "end" date,
        primary key ("user_id","school_id"),
        foreign key ("user_id") references users ("id"),
        foreign key ("school_id") references schools ("id")
    )
;

create table Usercompanies
    (   "user_id" integer,
        "company_id" integer,
        "start" date,
        "end" date,
        primary key ("user_id","company_id"),
        foreign key ("user_id") references users ("id"),
        foreign key ("company_id") references industries ("id")
    )
;
