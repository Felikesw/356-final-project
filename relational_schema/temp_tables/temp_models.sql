DROP TABLE IF EXISTS temp_models;

SELECT 'creating temp_models' as '';

CREATE TABLE temp_models (
    Id VARCHAR(24),
    Date VARCHAR(64),
    Study LONGTEXT,
    `Study Link` LONGTEXT,
    Journal LONGTEXT,
    Method LONGTEXT,
    Result LONGTEXT,
    `Measure of Evidence` LONGTEXT,
    `Added on` VARCHAR(64)
);

SELECT 'start loading data' as '';

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/4_models_and_open_questions/Are there studies about phenotypic change_.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/4_models_and_open_questions/Efforts to develop qualitative assessment frameworks.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/4_models_and_open_questions/How can we measure changes in COVID-19_s behavior in a human host as the virus evolves over time_.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/4_models_and_open_questions/Serial Interval (time between symptom onset in infector-infectee pair).csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/4_models_and_open_questions/Studies to monitor potential adaptations.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/4_models_and_open_questions/What do models for transmission predict_.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/4_models_and_open_questions/What is known about adaptations (mutations) of the virus_.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/4_models_and_open_questions/What regional genetic variations (mutations) exist.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;