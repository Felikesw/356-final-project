-- load in data under reisk factors
DROP TABLE IF EXISTS temp_risk_f;

SELECT 'creating temp_risk_f' as '';

CREATE TABLE temp_risk_f (
    Id VARCHAR(24),
    Date VARCHAR(64),
    Study LONGTEXT,
    `Study Link` LONGTEXT,
    Journal LONGTEXT,
    Severe VARCHAR(24),
    `Severe lower bound` DOUBLE PRECISION(3,6),
    `Severe upper bound` DOUBLE PRECISION(3,6),
    `Severe p-value` DOUBLE PRECISION(3,6),
    `Severe significant` VARCHAR(64), 
    `Severe adjusted` VARCHAR(64), 
    `Severe Calculated` VARCHAR(64), 

    Fatality VARCHAR(24),
    `Fatality lower bound` DOUBLE PRECISION(3,6),
    `Fatality upper bound` DOUBLE PRECISION(3,6),
    `Fatality p-value` DOUBLE PRECISION(3,6),
    `Fatality significant` VARCHAR(64), 
    `Fatality adjusted` VARCHAR(64), 
    `Fatality Calculated` VARCHAR(64), 

    `Multivariate Adjustment` LONGTEXT, 
    `Study Type` VARCHAR(64),
    `Sample Size` VARCHAR(24),
    `Study Population` LONGTEXT,
    `Added on` VARCHAR(64),
    `Critical only` VARCHAR(2),
    `Discharged_or_death` VARCHAR(24)

);

SELECT 'start loading data' as '';

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Age.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Asthma.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Autoimmune disorders.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Cancer.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Cardio- and cerebrovascular disease.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Cerebrovascular disease.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Chronic digestive disorders.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Chronic kidney disease.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Chronic liver disease.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Chronic respiratory diseases.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Dementia.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Diabetes.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Drinking.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Endocrine diseases.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Ethnicity_ Hispanic vs. non-Hispanic.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Heart Disease.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Heart Failure.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Hypertension.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Immune system disorders.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Male gender.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Neurological disorders.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Overweight or obese.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Race_ Asian vs. White.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Race_ Black vs. White.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Race_ Other vs. White.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Respiratory system diseases.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/8_risk_factors/Smoking Status.csv"
INTO TABLE temp_risk_f
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

CREATE INDEX study_idx On temp_risk_f (Study);