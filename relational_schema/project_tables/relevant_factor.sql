DROP TABLE IF EXISTS `Relevant Factor`;

CREATE TABLE `Relevant Factor`(
    id INT NOT NULL AUTO_INCREMENT
    , study_id INT
    , title VARCHAR(255)
    , factors LONGTEXT
    , influential VARCHAR(2)
    , excerpt LONGTEXT
    , measure_of_evidence LONGTEXT
    , added_on VARCHAR(64)
    , question_type VARCHAR(255)
    , PRIMARY KEY (id)
    , FOREIGN KEY (study_id) REFERENCES Study(study_id)

);

INSERT INTO `Relevant Factor` (
    study_id
    , title  
    , factors 
    , influential
    , excerpt 
    , measure_of_evidence 
    , added_on
    , question_type 
) SELECT
    study_id
    , Study
    , Factors
    , Influential
    , Excerpt
    , `Measure of Evidence`
    , `Added on`
    , question_type
FROM temp_r_factors
INNER JOIN Study ON title=Study;

ALTER TABLE `Relevant Factor`
ADD FOREIGN KEY (question_type) REFERENCES Questions(question_type); 