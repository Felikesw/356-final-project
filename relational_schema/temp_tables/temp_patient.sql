DROP TABLE IF EXISTS temp_patient;

SELECT 'creating temp_patient' as '';

CREATE TABLE temp_patient (
    Id VARCHAR(24),
    Date VARCHAR(64),
    Study VARCHAR(255),
    `Study Link` LONGTEXT,
    Journal LONGTEXT,
    `Study Type`VARCHAR(64),
    `Sample Size` VARCHAR(64),
    Age VARCHAR(255),
    `Sample Obtained` VARCHAR(64),
    `Asymptomatic Transmission` VARCHAR(64),
    `Characteristic` VARCHAR(64),
    Excerpt LONGTEXT,
    `Added on` VARCHAR(64)
);

SELECT 'start loading data' as '';

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/3_patient_descriptions/Can the virus be transmitted asymptomatically or during the incubation period_.csv"
INTO TABLE temp_patient
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/3_patient_descriptions/How does viral load relate to disease presentations and likelihood of a positive diagnostic test_.csv"
INTO TABLE temp_patient
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/3_patient_descriptions/Incubation period across different age groups.csv"
INTO TABLE temp_patient
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/3_patient_descriptions/Length of viral shedding after illness onset.csv"
INTO TABLE temp_patient
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/3_patient_descriptions/Proportion of all positive COVID19 patients who were asymptomatic.csv"
INTO TABLE temp_patient
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/3_patient_descriptions/Proportion of pediatric COVID19 patients who were asymptomatic.csv"
INTO TABLE temp_patient
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

ALTER TABLE temp_patient
ADD COLUMN question_type VARCHAR(255) DEFAULT "Patient Descriptions";

CREATE INDEX study_idx On temp_patient (Study);
