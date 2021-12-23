# 356-final-project

# Client Setup:

## Environment Set Up
This project depends on python 3.7 and mysql connector python package

### Conda Quick Set Up

To quickly set up a suitable environment with conda:

```bash
conda env create -f env.yml
```

### Alternative Set Up

If you are not using conda, you can still run this project in an environment with Python 3.7 with mysql connector installed.

```bash
# px: Installing mysql connector python package
pip install mysql-connector-python
```

## Usage

To run the code for test cases

```bash
# TODO: make test cases
```

To get help with the command line option

```bash
python3 main.py --help
```

# Server set up

The database can be recreated through the following steps.

1. Under `relational_schema/temp_tables` run all the .sql files there with the exception of `temp_clean_up.sql`. This 
    file simply drops all temp tables for database cleaniness sake.
2. Under `relational_schema/project_tables` run `Journal.sql` first, followed by `Study.sql`. Then the rest may be ran
    in any order.
