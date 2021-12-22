-- load in data under population
DROP TABLE IF EXISTS temp_population;

SELECT 'creating temp_population' as '';

CREATE TABLE temp_population (
    Id VARCHAR(24),
    Date VARCHAR(64),
    Study VARCHAR(255),
    `Study Link` LONGTEXT,
    Journal LONGTEXT,
    `Study Type` VARCHAR(64),
    `Addressed Population` LONGTEXT,
    Challenge LONGTEXT,
    Solution LONGTEXT,
    `Measure of Evidence` LONGTEXT,
    `Added on` VARCHAR(64)
);

SELECT 'start loading data' as '';

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/1_population/Measures to reach marginalized and disadvantaged populations.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/1_population/Methods to control the spread in communities.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/1_population/Modes of communicating with target high-risk populations.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/1_population/What are recommendations for combating_overcoming resource failures_.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/1_population/What are ways to create hospital infrastructure to prevent nosocomial outbreaks_.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

ALTER TABLE temp_population
ADD COLUMN question_type VARCHAR(255) DEFAULT "Population";

CREATE INDEX study_idx On temp_population (Study);
