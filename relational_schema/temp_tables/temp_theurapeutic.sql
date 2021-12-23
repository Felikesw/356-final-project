-- imports temp_theurapeutic into table called temp_therapeutics

DROP TABLE IF EXISTS temp_therapeutics;

SELECT 'create temp_therapeutics' as '';

CREATE TABLE temp_therapeutics(
    Id VARCHAR(24),
    Date VARCHAR(64),
    Study VARCHAR(255),
    `Study Link` LONGTEXT,
    Journal VARCHAR(255),
    `Study Type` VARCHAR(64),
    `Therapeutic method(s) utilized/assessed` LONGTEXT,
    `Sample Size` VARCHAR(255),
    `Severity of Disease` LONGTEXT,
    `General Outcome/Conclusion Excerpt` LONGTEXT,
    `Primary Endpoint(s) of Study` LONGTEXT,
    `Clinical Improvement (Y/N)` VARCHAR(2),
    `Added on` VARCHAR(64)
);

CREATE TABLE 'start loading data' as '';

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/7_therapeutics_interventions_and_clinical_studies/What is the best method to combat the hypercoagulable state seen in COVID-19_.csv"
INTO TABLE temp_therapeutics
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/7_therapeutics_interventions_and_clinical_studies/What is the efficacy of novel therapeutics being tested currently_.csv"
INTO TABLE temp_therapeutics
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
( Id,
    Date,
    Study,
    `Study Link` ,
    Journal,
    `Therapeutic method(s) utilized/assessed` ,
    `Sample Size`,
    `Severity of Disease` ,
    `General Outcome/Conclusion Excerpt` ,
    `Primary Endpoint(s) of Study` ,
    `Clinical Improvement (Y/N)`,
    `Study Type`,
    `Added on`);

ALTER TABLE temp_therapeutics
ADD COLUMN question_type VARCHAR(255) DEFAULT "Therapeutics Interventions and Clinical Studies";
