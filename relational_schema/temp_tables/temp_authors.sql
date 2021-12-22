DROP TABLE IF EXISTS temp_author;

CREATE TABLE temp_author(
    authors VARCHAR(255),
    contributing_study VARCHAR(255)
);

INSERT INTO temp_author (authors, contributing_study)
SELECT 
    REGEXP_SUBSTR((["'])(?:(?=(\\?))\2.)*?\1)
    , title
FROM temp_metadata