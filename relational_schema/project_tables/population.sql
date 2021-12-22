DROP TABLE IF EXISTS Population;

CREATE TABLE Population(
    title VARCHAR(255)
    , addressed_population LONGTEXT
    , challenge LONGTEXT
    , solution LONGTEXT
    , measure_of_evidence LONGTEXT
    , added_on VARCHAR(64)
    , question_type VARCHAR(255)
    , PRIMARY KEY (title)
    , FOREIGN KEY (title) REFERENCES Study(title)
);

INSERT INTO Population (
    title 
    , addressed_population 
    , challenge 
    , solution 
    , measure_of_evidence 
    , added_on 
    , question_type
) SELECT
    Study
    , `Addressed Population`
    , Challenge
    , Solution
    , `Added on`
    , question_type
FROM temp_population;