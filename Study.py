"""
TODO:
    double check the date time type
"""
from enum import Enum


class SearchType(Enum):
    SPECIFICATION = 1
    KEYWORDS = 2


class DateType(Enum):
    NOTGIVEN = 1
    ONLYLOWER = 2
    ONLYUPPER = 3
    BOTH = 4


class Study:
    def __init__(self) -> None:
        self.study_type = None  # the study_type column in the table
        self.date_lower_bound = None  # the lower bound of the datetime
        self.date_upper_bound = None  # the upper bound of the datetime
        self.keywords = []  # for searching keywords in both abstract and title
        self.table = "Study"  # the table that the query will be created based on

    def reset():
        """function that resets Study"""
        self.study_type = None
        self.date_lower_bound = None
        self.date_upper_bound = None
        self.keywords = []

    def study_type_update(new_study_type, self) -> None:
        """function that updates the study_type

        Args:
            param1: new_study_type : a string for study type

        """
        self.study_type = new_study_type

    def date_lower_update(new_date, self) -> None:
        """function that updates the date_lower_bound

        Args:
            param1: new_date : a string for date

        """
        self.date_lower_bound = new_date

    def date_upper_update(new_date, self) -> None:
        """function that updates the date_upper_bound

        Args:
            param1: new_date : a string for date

        """
        self.date_upper_bound = new_date

    def keywords_update(new_keywords, self) -> None:
        """function that updates the keywords

        Args:
            param1: new_keywords : a string for keywords

        """
        if new_keywords:
            # split the string using ',', then strip the space around each element
            self.keywords = [k.strip() for k in new_keywords.split(",")]
        else:
            print(
                "[ERROR] Invalid keywords format. Please seperate the keywords with a comma when entering multiple. e.x. Covid, reviews"
            )

    def create_query(search_type, limit, self):
        """function that creates and return a sql query

        Args:
            param1: search_type : a SearchType for determining how the query will be created
            param2: limit : an int for the record limit for the query

        Returns:
            returns null if any errors occurs, else return a stirng containing the query created
        """
        query = "SELECT * "

        # query with specified requirements
        if search_type == SearchType.SPECIFICATION:
            date_type = DateType.NOTGIVEN
            # study_type clause
            if self.study_type != None:
                qyery += f" WHERE study_type = '{self.study_type}' "
            # date clause
            if self.date_lower_bound != None:
                # error check
                if self.date_lower_bound > self.date_upper_bound:
                    print(
                        "[ERROR] Date lower bound higher than date upper bound, please make sure the upper bound >= lower bound."
                    )
                    return None
                date_type = DateType.ONLYLOWER

            if self.date_upper_bound != None:
                if self.date_lower_bound > self.date_upper_bound:
                    print(
                        "[ERROR] Date lower bound higher than date upper bound, please make sure the upper bound >= lower bound."
                    )
                    return None
                date_type = (
                    DateType.ONLYUPPER
                    if date_type == DateType.NOTGIVEN
                    else DateType.BOTH
                )
            # when filtering with only lower bound
            if date_type == DateType.ONLYLOWER:
                qyery += f" WHERE date >= '{self.date_lower_bound}' "
            # when filtering with only an upper bound
            elif date_type == DateType.ONLYUPPER:
                qyery += f" WHERE date <= '{self.date_upper_bound}' "
            # when filtering with a lower bound and an upper bound
            elif date_type == DateType.BOTH:
                qyery += f" WHERE date between '{self.date_lower_bound}' and '{self.date_upper_bound}' "
        # search by keywords
        elif search_type == SearchType.KEYWORDS:
            if len(self.keywords) > 0:
                first_keyword = True
                for keyword in self.keywords:
                    query += " WHERE " if first_keyword else " OR "
                    if first_keyword:
                        first_keyword = False
                    query += (
                        f" title LIKE '%{keyword}%' OR abstract LIKE '%{keyword}%' "
                    )

        query += f" FROM {self.table} LIMIT {limit}"
        return query
