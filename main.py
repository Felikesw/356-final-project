import mysql.connector
import getpass
import logging


def main():
    # ask for user name
    username = input("Enter Username: ")
    # connect to the db
    mydb = mysql.connector.connect(
        host="marmoset03.shoshin.uwaterloo.ca",
        user=username,
        password=getpass.getpass(),
        database=f"db356_{username}",
    )
    cursor = mydb.cursor()

    # limit of how many records to return
    record_limit = 1000

    # show options for user to choose from: add new data, serach for studies, search for questions, search for risk factors
    # make a class for questions
    # make a class for risk factors


if __name__ == "__main__":
    main()
