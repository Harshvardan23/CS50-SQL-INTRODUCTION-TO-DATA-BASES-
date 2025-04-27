create database linkedin;
use linkedin;


create table Users
    (   "id" int auto_increment primary key,
        "first_name" varchar(255) not null,
        "last_name" varchar(255) not null,
        "username" varchar(255) unique not null,
        "password" char(128),
        primary key ("id")
    )
;


create table Schools
    (   "id" int auto_increment,
        "name" varchar(255) not null,
        "School_type" enum("primary", "secondary", "higher education") not null,
        "location" varchar(255) not null,
        "founding_year" date,
        primary key ("id")
    )
;


create table companies
    (   "id" int auto_increment,
        "name" varchar(255) not null,
        "industry" enum("technology", "education", "business") not null,
        "location" varchar(255) not null,
        primary key ("id")
    )
;


create connections
    (   "user1_id" int,
        "user2_id" int,
        primary key ("user1_id","user2_id"),
        foreign key ("user1_id") references users ("id"),
        foreign key ("user2_id") references users ("id")
    )
;


create table UserSchools
    (   "user_id" int,
        "school_id" int,
        "start_date" date,
        "end_date" date,
        "degree" varchar(255),
        primary key ("user_id","school_id"),
        foreign key ("user_id") references users(user_id),
        foreign key ("school_id") references schools(school_id)
    )
;


create table UserCompanies
    (   "user_id" int,
        "company_id" int,
        "start_date" date,
        "end_date" date,
        primary key ("user_id","company_id"),
        foreign key ("user_id") references users(user_id),
        foreign key ("company_id") references companies(company_id)
    )
;
