-- creates table study
DROP TABLE IF EXISTS Study;

CREATE TABLE Study(
    journal_name VARCHAR(255),
    study_link LONGTEXT,
    doi LONGTEXT,
    title VARCHAR(255),
    abstract LONGTEXT,
    pubmed_id VARCHAR(64),
    source VARCHAR(64),
    license VARCHAR(64),
    study_type VARCHAR(64),
    date VARCHAR(64),
    FOREIGN KEY (journal_name) REFERENCES Journal(journal_name),
    PRIMARY KEY (title)
);

INSERT INTO Study (
    journal_name
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
    journal
    , `Study Link`
    , doi 
    , Study_idx 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_population
INNER JOIN temp_metadata ON Study_idx=title_idx;

INSERT INTO Study (
    journal_name
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
    journal
    , `Study Link`
    , doi 
    , Study_idx 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_r_factors
INNER JOIN temp_metadata ON Study_idx=title_idx;

INSERT INTO Study (
    journal_name
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
    journal
    , `Study Link`
    , doi 
    , Study_idx 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_patient
INNER JOIN temp_metadata ON Study_idx=title_idx;

INSERT INTO Study (
    journal_name
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
    journal
    , `Study Link`
    , doi 
    , Study_idx 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_models
INNER JOIN temp_metadata ON Study_idx=title_idx;

INSERT INTO Study (
    journal_name
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
    journal
    , `Study Link`
    , doi 
    , Study_idx 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_materials
INNER JOIN temp_metadata ON Study_idx=title_idx;

INSERT INTO Study (
    journal_name
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
    journal
    , `Study Link`
    , doi 
    , Study_idx 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_diagnostics
INNER JOIN temp_metadata ON Study_idx=title_idx;

INSERT INTO Study (
    journal_name
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
    journal
    , `Study Link`
    , doi 
    , Study_idx 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_therapeutics
INNER JOIN temp_metadata ON Study_idx=title_idx;

INSERT INTO Study (
    journal_name
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
    journal
    , `Study Link`
    , doi 
    , Study_idx 
    , abstract 
    , pubmed_id 
    , source_x 
    , license 
    , `Study Type`
    , Date
FROM temp_risk_f
INNER JOIN temp_metadata ON Study_idx=title_idx;


