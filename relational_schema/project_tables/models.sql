DROP TABLE IF EXISTS `Models and Open Questions`;

CREATE TABLE `Models and Open Questions`(
    id INT NOT NULL AUTO_INCREMENT
    , study_id INT
    , title VARCHAR(255) NOT NULL
    , method LONGTEXT
    , result LONGTEXT
    , measure_of_evidence LONGTEXT
    , question_type VARCHAR(255)
    , added_on VARCHAR(64)
    , PRIMARY KEY (id)
    , FOREIGN KEY (study_id) REFERENCES Study(study_id)
);

INSERT INTO `Models and Open Questions`(
    study_id
    , title 
    , method 
    , result 
    , measure_of_evidence 
    , question_type 
    , added_on 
) SELECT
    study_id
    , Study
    , Method
    , Result
    , `Measure of Evidence`
    , question_type
    , `Added on` 
FROM temp_models
INNER JOIN Study ON title=Study;
