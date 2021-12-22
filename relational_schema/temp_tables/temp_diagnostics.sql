-- load in data under diagnostics
DROP TABLE IF EXISTS temp_diagnostics;

SELECT 'creating temp_diagnostics' as '';

CREATE TABLE temp_diagnostics (
    Id VARCHAR(24),
    Date VARCHAR(64),
    Study VARCHAR(255),
    `Study Link` LONGTEXT,
    Journal LONGTEXT,
    `Study Type` VARCHAR(64),
    `Detection Method` VARCHAR(255),
    `Sample Size` VARCHAR(64),
    `Measure of Testing Accuracy` LONGTEXT,
    `Speed of assay` VARCHAR(255),
    `FDA Approval` VARCHAR(64),
    `Added on` VARCHAR(64)
);

SELECT 'start loading data' as '';

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/6_diagnostics/Development of a point-of-care test and rapid bed-side tests.csv"
INTO TABLE temp_diagnostics
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
(Id, Date, Study, `Study Link`,
    Journal, `Detection Method`, `Sample Size`,
    `Measure of Testing Accuracy`, `Speed of assay`, `FDA Approval`,
    `Study Type`, `Added on`);

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/6_diagnostics/Diagnosing SARS-COV-2 with Nucleic-acid based tech.csv"
INTO TABLE temp_diagnostics
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/6_diagnostics/Diagnosing SARS-COV-2 with antibodies.csv"
INTO TABLE temp_diagnostics
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

ALTER TABLE temp_diagnostics
ADD COLUMN question_type VARCHAR(255) DEFAULT "Diagnostics";

CREATE INDEX study_idx On temp_diagnostics (Study);
