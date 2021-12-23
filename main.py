import time
import getpass
import logging
import argparse
import mysql.connector
from Study import Study, FilterType, study_column_value

"""global variables"""
DEFAULT_RECORD_LIMIT = 1000  # default record limit
RECORD_LIMIT = DEFAULT_RECORD_LIMIT  # limit of how many records to return
WITH_DB = (
    False  # 0 to run script without connecting to the databse, 1 run with connection
)
"""database connection variables"""
CNX = None
CURSOR = None
"""logger"""
FILE_NAME = "debug.log"
logging.basicConfig(
    filename=FILE_NAME,
    level=logging.INFO,
    filemode="a+",
    format="%(message)s",
    # format="%(asctime)s [%(levelname)s] (line %(lineno)s %(funcName)s): %(message)s",
)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-db",
        action="store_true",
        help="Include this flag to run script with database connection",
    )
    args = parser.parse_args()

    global WITH_DB
    WITH_DB = args.db

    # reset log
    file = open(FILE_NAME, "w+")
    file.close()

    # ask for user name
    username = input("Enter Username: ")
    logging.info(f"username: {username}")
    if WITH_DB:
        establish_cnx(username)

    initial_selection()


def establish_cnx(username):
    """establish connection to the database

    Args:
        param1: username : a string for the username

    """
    global CNX
    CNX = mysql.connector.connect(
        host="marmoset03.shoshin.uwaterloo.ca",
        user=username,
        password=getpass.getpass(),
        database=f"db356_{username}",
    )
    global CURSOR
    CURSOR = CNX.cursor()


def initial_selection():
    """initial selection for the user: search for studies, search for risk factors, search for questions, add new data"""
    time.sleep(0.5)
    option = int(
        input(
            """
===========================================
Please select one of the following options: 
-------------------------------------------
1. Search for studies 
2. Search for risk factors
3. Search for questions
4. Insert new data
5. Exit
-------------------------------------------
"""
        )
    )

    if option == 1:
        study_selection()
    elif option == 2:
        print(
            "\n[INFO] Some new and exciting features are being developed, come back later to check it out!"
        )

    elif option == 3:
        print(
            "\n[INFO] Some new and exciting features are being developed, come back later to check it out!"
        )

    elif option == 4:
        insert_data()

    elif option == 5:
        print("\n[INFO] Program exited successfully.\n")
        logging.info(f"Program exited successfully.")

        # close the connections
        if WITH_DB:
            cursor.close()
            cnx.close()
        # terminate program
        quit()
    else:
        print("\n[ERROR] Invalid selection, please try again.")
        logging.error(f"Invalid selection.")

    initial_selection()


def study_selection():
    """select filter type for Study table:"""
    time.sleep(0.5)
    option = int(
        input(
            f"""
===========================================
Please select one of the following options: 
-------------------------------------------
(current limit: {RECORD_LIMIT} records)
1. Filter with specific attributes
2. Filter with keywords
3. Return all records up to record limit 
4. Change record limit 
5. Back
-------------------------------------------
"""
        )
    )

    study = Study(logger=logging)
    create_query = False
    query = ""

    if option == 1:
        study_type = input(
            f"""
-------------------------------------------------------------------------------------------------------------------------
Please enter the desired study_type value, or press enter to continue with the default value. (case and space sensitive): 
-------------------------------------------------------------------------------------------------------------------------
"""
        )
        if study_type != "":
            study.study_type_update(study_type.strip())

        date_lower_bound = input(
            f"""
-------------------------------------------------------------------------------------------------------------------------
Please enter the desired date lower bound value, or press enter to continue with the default value. (format: yyyy-mm-dd): 
-------------------------------------------------------------------------------------------------------------------------
"""
        )
        if date_lower_bound != "":
            study.date_lower_update(date_lower_bound.strip())

        date_upper_bound = input(
            f"""
-------------------------------------------------------------------------------------------------------------------------
Please enter the desired date upper bound value, or press enter to continue with the default value. (format: yyyy-mm-dd): 
-------------------------------------------------------------------------------------------------------------------------
"""
        )
        if date_upper_bound != "":
            study.date_upper_update(date_upper_bound.strip())

        study.filter_type_update(FilterType.SPECIFICATION)
        create_query = True

    elif option == 2:
        keywords = input(
            f"""
------------------------------------------------------------------------------------------------------------------------
Please enter the keywords for filtering the data, or press enter key to continue with the default value. 
Please seperate the keywords with a comma when entering multiple (e.x. Covid, reviews, news) (case and space sensitive): 
------------------------------------------------------------------------------------------------------------------------
"""
        )
        if keywords != "":
            study.keywords_update(keywords)

        study.filter_type_update(FilterType.KEYWORDS)
        create_query = True

    elif option == 3:
        create_query = True

    elif option == 4:
        limit_update()

    elif option != 5:
        print("\n[ERROR] Invalid selection, please try again.")
        logging.error(f"Invalid selection.")

    if create_query:
        query = study.create_query(RECORD_LIMIT)

        logging.info(query)
        if WITH_DB:
            CURSOR.execute(query)
            logging.info("-------------START OF DATA-------------")
            for row in CURSOR:
                logging.info(row)
            logging.info("--------------END OF DATA--------------")

    if option != 5:
        study_selection()


def limit_update():
    """update the record limit"""
    time.sleep(0.5)
    option = int(
        input(
            f"""
===========================================
Please select one of the following options: 
-------------------------------------------
(current limit: {RECORD_LIMIT} records)
1. New limit
2. Restore default ({DEFAULT_RECORD_LIMIT} records)
3. Back
-------------------------------------------
"""
        )
    )

    if option == 1:
        new_limit = int(
            input(
                f"""
-------------------------------------------
Please enter the new positive integer limit: 
-------------------------------------------
"""
            )
        )
        # maybe error check
        modify_RECORD_LIMIT(new_limit)
    elif option == 2:
        modify_RECORD_LIMIT(DEFAULT_RECORD_LIMIT)
    elif option == 3:
        return
    else:
        print("\n[ERROR] Invalid selection, please try again.")
        logging.error(f"Invalid selection.")
        limit_update()

    print(f"\n[INFO] Updated limit: {RECORD_LIMIT} records.")
    logging.info(f"Updated limit: {RECORD_LIMIT} records.")


def modify_RECORD_LIMIT(new_limit):
    """function that modifies the global variable RECORD_LIMIT

    Args:
        param1: new_limit : an int for the new record limit

    """
    global RECORD_LIMIT
    RECORD_LIMIT = new_limit


def insert_data():
    """function that insert data into a data table"""
    time.sleep(0.5)
    data_table = ""
    values = {}
    option = int(
        input(
            f"""
==========================================
Please select one of the following tables: 
------------------------------------------
1. Study
2. Back
------------------------------------------
"""
        )
    )

    if option == 1:
        data_table = "Study"
        values = study_column_value()

    if option != 2 and data_table != "" and len(values) > 0:
        query = f"INSERT INTO {data_table}"
        columns = ""
        data = ""
        first_pair = True
        for key in values:
            value = values[key]
            if first_pair:
                first_pair = False
            else:
                columns += ", "
                data += ", "

            columns += key
            if value[1] == "":
                data += "NULL"
            else:
                if value[0]:
                    data += value[1]
                else:
                    data += f"'{value[1]}'"
        query += f"({columns}) VALUES ({data});"

        logging.info(query)
        if WITH_DB:
            CURSOR.execute(query)
            logging.info("-------------START OF DATA-------------")
            for row in CURSOR:
                logging.info(row)
            logging.info("--------------END OF DATA--------------")


if __name__ == "__main__":
    main()
