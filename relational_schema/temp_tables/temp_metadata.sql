-- imports metadata.csv into table called temp_metadata

DROP TABLE IF EXISTS temp_metadata;

SELECT 'create temp_metadata' as '';

CREATE TABLE temp_metadata (
    cord_uid VARCHAR(64),
    sha LONGTEXT,
    source_x VARCHAR(64),
    title LONGTEXT,
    doi LONGTEXT,
    pmcid VARCHAR(64),
    pubmed_id VARCHAR(64),
    license VARCHAR(64),
    abstract LONGTEXT,
    publish_time VARCHAR(64),
    authors LONGTEXT,
    journal LONGTEXT,
    mag_id LONGTEXT,
    who_covidence_id LONGTEXT,
    arxiv_id LONGTEXT,
    pdf_json_files LONGTEXT,
    pmc_json_files LONGTEXT,
    url LONGTEXT,
    s2_id LONGTEXT
);

LOAD DATA INFILE "/var/lib/mysql-files/Group53/new_metadata.csv"
INTO TABLE temp_metadata
FIELDS TERMINATED BY "," ENCLOSED BY '"'
LINES TERMINATED BY "\n"
IGNORE 1 LINES;