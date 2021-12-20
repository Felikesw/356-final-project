import mysql.connector


def main():
    username = input("Enter Username: ")
    mydb = mysql.connector.connect(
        host="marmoset03.shoshin.uwaterloo.ca",
        user=username,
        password=getpass.getpass(),
        database=f"db356_{username}",
    )
    cursor = mydb.cursor()


if __name__ == "__main__":
    main()
