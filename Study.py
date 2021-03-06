from enum import Enum
from datetime import datetime


class FilterType(Enum):
    SPECIFICATION = 1
    KEYWORDS = 2
    ALL = 3


class DateType(Enum):
    NOTGIVEN = 1
    ONLYLOWER = 2
    ONLYUPPER = 3
    BOTH = 4


class Study:
    def __init__(self, logger=None) -> None:
        self.filter_type = FilterType.ALL  # how the query will filter the data
        self.study_type = None  # the study_type column in the table
        self.date_lower_bound = None  # the lower bound of the datetime
        self.date_upper_bound = None  # the upper bound of the datetime
        self.keywords = []  # for filtering keywords in both abstract and title
        self.table = "Study"  # the table that the query will be created based on
        self.logger = logger  # the logger for this class

    def reset_study(self) -> None:
        """function that resets Study"""
        self.filter_type = FilterType.ALL
        self.study_type = None
        self.date_lower_bound = None
        self.date_upper_bound = None
        self.keywords = []

    def filter_type_update(self, new_filter_type) -> None:
        """function that updates the filter_type

        Args:
            param1: new_filter_type : a FilterType for filter type

        """
        self.filter_type = new_filter_type

    def study_type_update(self, new_study_type) -> None:
        """function that updates the study_type

        Args:
            param1: new_study_type : a string for study type

        """
        self.study_type = new_study_type

    def date_lower_update(self, new_date) -> None:
        """function that updates the date_lower_bound

        Args:
            param1: new_date : a string for date

        """
        self.date_lower_bound = datetime.strptime(new_date, "%Y-%m-%d").date()

    def date_upper_update(self, new_date) -> None:
        """function that updates the date_upper_bound

        Args:
            param1: new_date : a string for date

        """
        self.date_upper_bound = datetime.strptime(new_date, "%Y-%m-%d").date()

    def keywords_update(self, new_keywords) -> None:
        """function that updates the keywords

        Args:
            param1: new_keywords : a string for keywords

        """
        if new_keywords:
            # split the string using ',', then strip the space around each element,
            # then remove all the empty strings in the list
            self.keywords = list(
                filter(None, [k.strip() for k in new_keywords.split(",")])
            )
        else:
            print(
                "[ERROR] Invalid keywords format. Please seperate the keywords with a comma when entering multiple (e.x. Covid, reviews)."
            )
            self.logger.error("Invalid keywords")

    def create_query(self, limit) -> str:
        """function that creates and return a sql query

        Args:
            param1: limit : an int for the record limit for the query

        Returns:
            returns an empty string if any errors occurs, else return a stirng containing the query created
        """
        query = f"SELECT * FROM {self.table} "

        # filter with specified attributes
        if self.filter_type == FilterType.SPECIFICATION:
            date_type = DateType.NOTGIVEN
            first_keyword = True
            # study_type clause
            if self.study_type != None:
                query += f"WHERE study_type = '{self.study_type}' "
                first_keyword = False
            # date clause
            if self.date_lower_bound != None:
                date_type = DateType.ONLYLOWER

            if self.date_upper_bound != None:
                date_type = (
                    DateType.ONLYUPPER
                    if date_type == DateType.NOTGIVEN
                    else DateType.BOTH
                )
            # when filtering with only lower bound
            if not first_keyword and date_type != DateType.NOTGIVEN:
                query += "WHERE" if first_keyword else "AND"
            if date_type == DateType.ONLYLOWER:
                query += f" date >= '{self.date_lower_bound}' "
            # when filtering with only an upper bound
            elif date_type == DateType.ONLYUPPER:
                query += f" date <= '{self.date_upper_bound}' "
            # when filtering with a lower bound and an upper bound
            elif date_type == DateType.BOTH:
                # error check
                if self.date_lower_bound > self.date_upper_bound:
                    print(
                        "[ERROR] Date lower bound higher than date upper bound, please make sure the upper bound >= lower bound."
                    )
                    self.logger.error(
                        f"Invalid bounds. Lower: {self.date_lower_bound}, upper: {self.date_upper_bound}"
                    )
                    return ""
                query += f" (date BETWEEN '{self.date_lower_bound}' AND '{self.date_upper_bound}') "
        # filter by keywords
        elif self.filter_type == FilterType.KEYWORDS:
            if len(self.keywords) > 0:
                first_keyword = True
                for keyword in self.keywords:
                    query += "WHERE" if first_keyword else "OR"
                    if first_keyword:
                        first_keyword = False
                    query += (
                        f" title LIKE '%{keyword}%' OR abstract LIKE '%{keyword}%' "
                    )

        query += f"LIMIT {limit};"
        return query


def study_column_value() -> dict:
    """function that returns the columns and values for data insertion for the Study table

    Returns:
        returns a dict, key is the column name in string;
        value is a list, first element indicates whether or not this is an int column (0 is
        not, 1 is), second element is the inserting data
    """
    results = {}
    results["journal_id"] = [
        1,
        input(
            f"""
-----------------------------------------------------------------------------------------
Please enter the journal_id (INT), or press enter key to continue with the default value.
-----------------------------------------------------------------------------------------
"""
        ),
    ]

    results["study_link"] = [
        0,
        input(
            f"""
----------------------------------------------------------------------------------------------
Please enter the study_link (LONGTEXT), or press enter key to continue with the default value.
----------------------------------------------------------------------------------------------
"""
        ),
    ]

    results["doi"] = [
        0,
        input(
            f"""
---------------------------------------------------------------------------------------
Please enter the doi (LONGTEXT), or press enter key to continue with the default value.
---------------------------------------------------------------------------------------
"""
        ),
    ]

    results["title"] = [
        0,
        input(
            f"""
---------------------------------------------------------------------------------------------
Please enter the title (VARCHAR(255)), or press enter key to continue with the default value.
---------------------------------------------------------------------------------------------
"""
        ),
    ]

    results["abstract"] = [
        0,
        input(
            f"""
---------------------------------------------------------------------------------------------
Please enter the abstract  (LONGTEXT), or press enter key to continue with the default value.
---------------------------------------------------------------------------------------------
"""
        ),
    ]

    results["pubmed_id"] = [
        0,
        input(
            f"""
------------------------------------------------------------------------------------------------
Please enter the pubmed_id (VARCHAR(64)), or press enter key to continue with the default value.
------------------------------------------------------------------------------------------------
"""
        ),
    ]

    results["source"] = [
        0,
        input(
            f"""
---------------------------------------------------------------------------------------------
Please enter the source (VARCHAR(64)), or press enter key to continue with the default value.
---------------------------------------------------------------------------------------------
"""
        ),
    ]

    results["license"] = [
        0,
        input(
            f"""
----------------------------------------------------------------------------------------------
Please enter the license (VARCHAR(64)), or press enter key to continue with the default value.
----------------------------------------------------------------------------------------------
"""
        ),
    ]

    results["study_type"] = [
        0,
        input(
            f"""
-------------------------------------------------------------------------------------------------
Please enter the study_type (VARCHAR(64)), or press enter key to continue with the default value.
-------------------------------------------------------------------------------------------------
"""
        ),
    ]

    results["date"] = [
        0,
        input(
            f"""
-------------------------------------------------------------------------------------------
Please enter the date (VARCHAR(64)), or press enter key to continue with the default value.
-------------------------------------------------------------------------------------------
"""
        ),
    ]

    return results
