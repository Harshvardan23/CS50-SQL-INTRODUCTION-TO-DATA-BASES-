create table Ingredients
    (   "id" integer,
        "name" text,
        "price_per_unit" real,
        "unit" integer,
        primary key ("id")
    )
;

create table Donuts
    (   "id" integer,
        "name" text,
        "is_gluten_free" boolean,
        "price" real,
        primary key ("id")
    )
;

create table Donut_Ingredients
    (   "donut_id" integer,
        "ingredient_id" integer,
        primary key ("donut_id", "ingredient_id"),
        foreign key ("donut_id") references donuts ("id"),
        foreign key ("ingredient_id") references Ingredients ("id")
    )
;

create table Customers
    (   "id" integer,
        "first_name" text,
        "last_name" text,
        primary key ("id")
    )
;

create table Orders
    (   "id" integer,
        "customer_id" integer,
        primary key ("id"),
        foreign key ("customer_id") references customers ("id")
    )
;

create table Order_Donuts
    (   "order_id" integer,
        "donut_id" integer,
        "quantity" integer,
        primary key ("order_id", "donut_id"),
        foreign key ("order_id") references orders ("id"),
        foreign key ("donut_id") references donuts ("id")
    )
;
