-- imports temp_theurapeutic into table called temp_therapeutics

DROP TABLE IF EXISTS temp_therapeutics;

SELECT 'create temp_therapeutics' as '';

CREATE TABLE temp_therapeutics(
    Id VARCHAR(24),
    Date VARCHAR(64),
    Study LONGTEXT,
    `Study Link` LONGTEXT,
    Journal VARCHAR(64),
    `Study Type` VARCHAR(64),
    `Therapeutic method(s) utilized/assessed` LONGTEXT,
    `Sample Size` VARCHAR(24),
    `Severity of Disease` LONGTEXT,
    `General Outcome/Conclusion Excerpt` LONGTEXT,
    `Primary Endpoint(s) of Study` LONGTEXT,
    `Clinical Improvement (Y/N)` VARCHAR(2),
    `Added on` VARCHAR(64)
);

CREATE TABLE 'start loading data' as '';

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/7_therapeutics_interventions_and_clinical_studies/What is the best method to combat the hypercoagulable state seen in COVID-19_.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/7_therapeutics_interventions_and_clinical_studies/What is the efficacy of novel therapeutics being tested currently_.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;
