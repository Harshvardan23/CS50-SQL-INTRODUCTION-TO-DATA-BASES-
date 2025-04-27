select count(first_name) from players
    where bats = "R" and throws = "L"
        or bats = "L" and throws = "R" ;
