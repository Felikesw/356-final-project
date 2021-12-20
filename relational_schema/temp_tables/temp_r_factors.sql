DROP TABLE IF EXISTS temp_r_factors;

SELECT 'create temp_r_factors' as '';

CREATE TABLE temp_therapeutics(
    Date DATE,
    Study VARCHAR(240),
    `Study Link` VARCHAR(240),
    Journal VARCHAR(64),
    `Study Type` VARCHAR(64),
    Factors VARCHAR(64),
    Influential VARCHAR(2),
    Excerpt VARCHAR(500)
    `Measure of Evidence` VARCHAR(120),
    `Added on` VARCHAR(64)
);

CREATE TABLE 'start loading data' as '';

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/Effectiveness of a multifactorial strategy to prevent secondary transmission.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
(Date, Study, `Study Link`, Journal, `Study Type`, Factors, Influential, Excerpt,
`Measure of Evidence`, `Added on`);

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/Effectiveness of case isolation_isolation of exposed individuals to prevent secondary transmission.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
(Date, Study, `Study Link`, Journal, `Study Type`, Factors, Influential, Excerpt,
`Measure of Evidence`, `Added on`);

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/Effectiveness of workplace distancing to prevent secondary transmission.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
(Date, Study, `Study Link`, Journal, `Study Type`, Factors, Influential, Excerpt,
`Measure of Evidence`, `Added on`);

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/Effectiveness of community contact reduction.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
(Date, Study, `Study Link`, Journal, `Study Type`, Factors, Influential, Excerpt,
`Measure of Evidence`, `Added on`);

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/Effectiveness of inter_inner travel restriction.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
(Date, Study, `Study Link`, Journal, `Study Type`, Factors, Influential, Excerpt,
`Measure of Evidence`, `Added on`);

CREATE TABLE 'loading 1/2' as '';

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/Effectiveness of school distancing.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
(Date, Study, `Study Link`, Journal, `Study Type`, Factors, Influential, Excerpt,
`Measure of Evidence`, `Added on`);

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/How does temperature and humidity affect the transmission of 2019-nCoV_.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
(Date, Study, `Study Link`, Journal, `Study Type`, Factors, Influential, Excerpt,
`Measure of Evidence`, `Added on`);

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/Methods to understand and regulate the spread in communities.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
(Date, Study, `Study Link`, Journal, `Study Type`, Factors, Influential, Excerpt,
`Measure of Evidence`, `Added on`);

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/Seasonality of transmission.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
(Date, Study, `Study Link`, Journal, `Study Type`, Factors, Influential, Excerpt,
`Measure of Evidence`, `Added on`);

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/What is the likelihood of significant changes in transmissibility in changing seasons_.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES
(Date, Study, `Study Link`, Journal, `Study Type`, Factors, Influential, Excerpt,
`Measure of Evidence`, `Added on`);


