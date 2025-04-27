from cs50 import SQL


db = SQL("sqlite:///dont-panic.db")

password = input("Enter a password: ")

print(password)


db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    password
)

solution = db. execute("select password from users where username = ?", 'admin')
print(solution)
