DROP TABLE IF EXISTS temp_r_factors;

SELECT 'create temp_r_factors' as '';

CREATE TABLE temp_r_factors(
    Id VARCHAR(24),
    Date VARCHAR(64),
    Study VARCHAR(255),
    `Study Link` LONGTEXT,
    Journal LONGTEXT,
    `Study Type` VARCHAR(64),
    Factors LONGTEXT,
    Influential VARCHAR(2),
    Excerpt LONGTEXT,
    `Measure of Evidence` LONGTEXT,
    `Added on` VARCHAR(64)
);

SELECT 'start loading data' as '';

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/2_relevant_factors/Effectiveness of a multifactorial strategy to prevent secondary transmission.csv"
INTO TABLE temp_r_factors
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/2_relevant_factors/Effectiveness of case isolation_isolation of exposed individuals to prevent secondary transmission.csv"
INTO TABLE temp_r_factors
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/2_relevant_factors/Effectiveness of workplace distancing to prevent secondary transmission.csv"
INTO TABLE temp_r_factors
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/2_relevant_factors/Effectiveness of community contact reduction.csv"
INTO TABLE temp_r_factors
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/2_relevant_factors/Effectiveness of inter_inner travel restriction.csv"
INTO TABLE temp_r_factors
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/2_relevant_factors/Effectiveness of school distancing.csv"
INTO TABLE temp_r_factors
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/2_relevant_factors/How does temperature and humidity affect the transmission of 2019-nCoV_.csv"
INTO TABLE temp_r_factors
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/2_relevant_factors/Methods to understand and regulate the spread in communities.csv"
INTO TABLE temp_r_factors
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/2_relevant_factors/Seasonality of transmission.csv"
INTO TABLE temp_r_factors
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/2_relevant_factors/What is the likelihood of significant changes in transmissibility in changing seasons_.csv"
INTO TABLE temp_r_factors
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

ALTER TABLE temp_r_factors
ADD COLUMN question_type VARCHAR(255) DEFAULT "Relevant Factors";
