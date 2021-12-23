DROP TABLE IF EXISTS Population;

CREATE TABLE Population(
    id INT NOT NULL AUTO_INCREMENT
    , study_id INT
    , title VARCHAR(255)
    , addressed_population LONGTEXT
    , challenge LONGTEXT
    , solution LONGTEXT
    , measure_of_evidence LONGTEXT
    , added_on VARCHAR(64)
    , question_type VARCHAR(255)
    , PRIMARY KEY (id)
    , FOREIGN KEY (study_id) REFERENCES Study(study_id)
);

INSERT INTO Population (
    study_id
    , title 
    , addressed_population 
    , challenge 
    , solution 
    , measure_of_evidence 
    , added_on 
    , question_type
) SELECT
    study_id
    , Study
    , `Addressed Population`
    , Challenge
    , Solution
    , `Measure of Evidence`
    , `Added on`
    , question_type
FROM temp_population
INNER JOIN Study ON title=Study;