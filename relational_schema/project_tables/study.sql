-- creates table study
DROP TABLE IF EXISTS Study;

CREATE TABLE Study(
    study_id INT NOT NULL AUTO_INCREMENT,
    journal_id INT,
    study_link LONGTEXT,
    doi LONGTEXT,
    title VARCHAR(255),
    abstract LONGTEXT,
    pubmed_id VARCHAR(64),
    source VARCHAR(64),
    license VARCHAR(64),
    study_type VARCHAR(64),
    date VARCHAR(64),
    FOREIGN KEY (journal_id) REFERENCES Journal(journal_id),
    PRIMARY KEY (study_id)
);

INSERT INTO Study (
    journal_id
    , study_link
    , doi
    , title
    , abstract
    , pubmed_id
    , source
    , license
    , study_type
    , date
) SELECT
    journal_id
    , `Study Link`
    , doi 
    , Study 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_population p
INNER JOIN temp_metadata t ON p.Study=t.title
INNER JOIN Journal j ON j.journal_name=t.journal;

INSERT INTO Study (
    journal_id
    , study_link
    , doi
    , title
    , abstract
    , pubmed_id
    , source
    , license
    , study_type
    , date
) SELECT
    journal_id
    , `Study Link`
    , doi 
    , Study 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_r_factors p
INNER JOIN temp_metadata t ON p.Study=t.title
INNER JOIN Journal j ON j.journal_name=t.journal;

INSERT INTO Study (
    journal_id
    , study_link
    , doi
    , title
    , abstract
    , pubmed_id
    , source
    , license
    , study_type
    , date
) SELECT
    journal_id
    , `Study Link`
    , doi 
    , Study 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_patient p
INNER JOIN temp_metadata t ON p.Study=t.title
INNER JOIN Journal j ON j.journal_name=t.journal;

INSERT INTO Study (
    journal_id
    , study_link
    , doi
    , title
    , abstract
    , pubmed_id
    , source
    , license
    , study_type
    , date
) SELECT
    journal_id
    , `Study Link`
    , doi 
    , Study 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_models p
INNER JOIN temp_metadata t ON p.Study=t.title
INNER JOIN Journal j ON j.journal_name=t.journal;

INSERT INTO Study (
    journal_id
    , study_link
    , doi
    , title
    , abstract
    , pubmed_id
    , source
    , license
    , study_type
    , date
) SELECT
    journal_id
    , `Study Link`
    , doi 
    , Study 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_materials p
INNER JOIN temp_metadata t ON p.Study=t.title
INNER JOIN Journal j ON j.journal_name=t.journal;

INSERT INTO Study (
    journal_id
    , study_link
    , doi
    , title
    , abstract
    , pubmed_id
    , source
    , license
    , study_type
    , date
) SELECT
    journal_id
    , `Study Link`
    , doi 
    , Study 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_diagnostics p
INNER JOIN temp_metadata t ON p.Study=t.title
INNER JOIN Journal j ON j.journal_name=t.journal;

INSERT INTO Study (
    journal_id
    , study_link
    , doi
    , title
    , abstract
    , pubmed_id
    , source
    , license
    , study_type
    , date
) SELECT
    journal_id
    , `Study Link`
    , doi 
    , Study 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_therapeutics p
INNER JOIN temp_metadata t ON p.Study=t.title
INNER JOIN Journal j ON j.journal_name=t.journal;

INSERT INTO Study (
    journal_id
    , study_link
    , doi
    , title
    , abstract
    , pubmed_id
    , source
    , license
    , study_type
    , date
) SELECT
    journal_id
    , `Study Link`
    , doi 
    , Study 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_risk_f p
INNER JOIN temp_metadata t ON p.Study=t.title
INNER JOIN Journal j ON j.journal_name=t.journal;


