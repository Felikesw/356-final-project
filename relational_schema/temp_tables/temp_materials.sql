DROP TABLE IF EXISTS temp_materials;

SELECT 'creating temp_materials' as '';

CREATE TABLE temp_materials (
    Id VARCHAR(24),
    Date VARCHAR(64),
    Study LONGTEXT,
    `Study Link` LONGTEXT,
    Journal LONGTEXT,
    `Study Type` VARCHAR(64),
    Material VARCHAR(64),
    Method LONGTEXT,
    `Viral Titer` LONGTEXT,
    Persistence LONGTEXT,
    Conclusion LONGTEXT,
    `Measure of Evidence` LONGTEXT,
    `Added on` VARCHAR(64)
);

SELECT 'start loading data' as '';

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/5_materials/Adhesion to hydrophilic_phobic surfaces.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/5_materials/Coronavirus susceptibility to heat light and radiation.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/5_materials/How long can other HCoV strains remain viable on common surfaces_.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/5_materials/Persistence of virus on surfaces of different materials.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/5_materials/Susceptibility to environmental cleaning agents.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/5_materials/What do we know about viral shedding in blood_.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/5_materials/What do we know about viral shedding in stool_.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/5_materials/What do we know about viral shedding in the nasopharynx_.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;

LOAD DATA INFILE "/var/lib/mysql-files/06-COVID/target_tables/5_materials/What do we know about viral shedding in urine_.csv"
INTO TABLE temp_population
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;
