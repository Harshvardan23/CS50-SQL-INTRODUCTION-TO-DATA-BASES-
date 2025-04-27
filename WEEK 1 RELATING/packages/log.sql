
-- *** The Lost Letter ***
Select * from scans
    where package_id =
    (select id from packages
        where from_address_id =
        (Select id from addresses
            where address = "900 Somerville Avenue"
            )
                and to_address_id =
                    (Select id from addresses
                    where address like "%Finn%"
                    )
        )
;

-- *** The Devious Delivery ***
select * from addresses
    where id =
    (select address_id from scans
    where package_id  =
    ( select id from packages
        where from_address_id is null
    )
    and action = "Drop"
    )
;
-- *** The Forgotten Gift ***

*** THIS IS FOR FINDING THE ADDRESS_ID OF THE RECEIPIENT ***

select * from addresses
    where address = "728 Maple Place"
;

*** THIS IS FOR FINDING THE ADDRESS_ID OF THE SENDER ***

select * from addresses
    where address = "109 Tileston Street"
;

*** NOW I HAVE THE SENDER AS WELL AS THE RECEIPIENT ID I CAN TRACK DOWN THEIR PACKAGE ID ***

Select * from packages
    where from_address_id =
    (select id from addresses
    where address = "109 Tileston Street"
    )
        and to_address_id =
        (select id from addresses
        where address = "728 Maple Place"
        )
;

*** TO FIND WHO HAS THE FORGOTTEN GIFT I WILL GO TO THE SCAN TABLE TO CHECK WHERE THE PACKAGE HAS BEEN DELIVERED OR SIMPLY GET THE ADDRESS_ID OF THE DELIVERED***

select * from scans
    where package_id =
    (Select id from packages
    where from_address_id =
    (select id from addresses
    where address = "109 Tileston Street"
    )
        and to_address_id =
        (select id from addresses
        where address = "728 Maple Place"
        )
    )
     and action = "Drop"
;


*** TO FINALLY FIND THE ADDRESS AND THE TYPE WHERE OUR PACKAGE HAS BEEN DELIVERED WE WILL USE THE ADDRESS ID FROM THE SCAN TABLE AND WILL PUT IN THE ADDRESS TABLE***


select * from addresses
    where ID =
    (select address_id from scans
    where package_id =
    (Select id from packages
    where from_address_id =
    (select id from addresses
    where address = "109 Tileston Street"
    )
        and to_address_id =
        (select id from addresses
        where address = "728 Maple Place"
        )
    )
     and action = "Drop"
     )
;

**** WE KNOW NEED TO KNOW WHICH DRIVER HAS BEEN APPOINTED TO DELIVER THE PACKAGE ****

Select * from drivers
    where id =
    (select driver_id from scans
    where package_id =
    (Select id from packages
    where from_address_id =
    (select id from addresses
    where address = "109 Tileston Street"
    )
        and to_address_id =
        (select id from addresses
        where address = "728 Maple Place"
        )
    )
     Order by timestamp Desc
    )
    limit 1
;
