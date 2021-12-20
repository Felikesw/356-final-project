-- imports temp_theurapeutic into table called temp_therapeutics

DROP TABLE IF EXISTS temp_therapeutics;

SELECT 'create temp_therapeutics' as '';

CREATE TABLE temp_therapeutics(
    Date DATE,
    Study VARCHAR(240),
    `Study Link` VARCHAR(240),
    Journal VARCHAR(64),
    `Study Type` VARCHAR(64),
    `Therapeutic method(s) utilized/assessed` VARCHAR(600),
    `Sample Size` INT,
    `Severity of Disease` VARCHAR(500),
    `General Outcome/Conclusion Excerpt` VARCHAR(2000),
    `Primary Endpoint(s) of Study` VARCHAR(500),
    `Clinical Improvement (Y/N)` VARCHAR(2),
    `Added on` VARCHAR(64)
);

CREATE TABLE 'start loading data' as '';

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/What is the best method to combat the hypercoagulable state seen in COVID-19_.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
(Date, Study, `Study Link`, Journal, `Study Type`, `Therapeutic method(s) utilized/assessed`, 
`Sample Size`, `Severity of Disease`, `General Outcome/Conclusion Excerpt`,
`Primary Endpoint(s) of Study`, `Clinical Improvement (Y/N)`, `Added on`);

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/What is the efficacy of novel therapeutics being tested currently_.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
(Date, Study, `Study Link`, Journal, `Study Type`, `Therapeutic method(s) utilized/assessed`, 
`Sample Size`, `Severity of Disease`, `General Outcome/Conclusion Excerpt`,
`Primary Endpoint(s) of Study`, `Clinical Improvement (Y/N)`, `Added on`);