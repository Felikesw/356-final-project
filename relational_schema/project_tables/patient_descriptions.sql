DROP TABLE IF EXISTS `Patient Description`;

CREATE TABLE `Patient Description`(
    id INT NOT NULL AUTO_INCREMENT
    , study_id INT
    , title VARCHAR(255)
    , sample_size VARCHAR(64)
    , age VARCHAR(255)
    , sample_obtained VARCHAR(64)
    , asymptomatic_transmission  VARCHAR(64)
    , characteristic_related_question VARCHAR(64)
    , excerpt LONGTEXT
    , added_on VARCHAR(64)
    , question_type VARCHAR(255)
    , PRIMARY KEY (id)
    , FOREIGN KEY (study_id) REFERENCES Study(study_id)
);

INSERT INTO `Patient Description` (
    study_id
    , title 
    , sample_size 
    , age 
    , sample_obtained
    , asymptomatic_transmission
    , characteristic_related_question
    , excerpt
    , added_on
    , question_type
) SELECT
    study_id
    , Study
    , `Sample Size`
    , Age 
    , `Sample Obtained`
    , `Asymptomatic Transmission`
    , `Characteristic`
    , Excerpt
    , `Added on`
    , question_type
FROM temp_patient
INNER JOIN Study ON title=Study;

ALTER TABLE `Patient Description`
ADD FOREIGN KEY (question_type) REFERENCES Questions(question_type); 