import mysql.connector
import getpass
import logging
from Study import Study, FilterType
import time

DEFAULT_RECORD_LIMIT = 1000
# limit of how many records to return
RECORD_LIMIT = 1000


def main():
    # ask for user name
    username = input("Enter Username: ")
    # # connect to the db
    # mydb = mysql.connector.connect(
    #     host="marmoset03.shoshin.uwaterloo.ca",
    #     user=username,
    #     password=getpass.getpass(),
    #     database=f"db356_{username}",
    # )
    # cursor = mydb.cursor()

    initial_selection()
    # make a class for questions
    # make a class for risk factors


def initial_selection() -> None:
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
4. Input new data
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
        print(
            "\n[INFO] Some new and exciting features are being developed, come back later to check it out!"
        )

    elif option == 5:
        print("\n[INFO] Program exited successfully.\n")
        # terminate program
        quit()
    else:
        print("\n[ERROR] Invalid selection, please try again.")

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

    study = Study()
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

    elif option == 5:
        initial_selection()

    else:
        print("\n[ERROR] Invalid selection, please try again.")

    if create_query:
        query = study.create_query(RECORD_LIMIT)
        print(f"query: {query}")

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
        limit_update()

    print(f"\n[INFO] Updated limit: {RECORD_LIMIT} records.")


def modify_RECORD_LIMIT(new_limit):
    """function that modifies the global variable RECORD_LIMIT

    Args:
        param1: new_limit : an int for the new record limit

    """
    global RECORD_LIMIT
    RECORD_LIMIT = new_limit


if __name__ == "__main__":
    main()
