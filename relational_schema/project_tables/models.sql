DROP TABLE IF EXISTS `Models and Open Questions`;

CREATE TABLE `Models and Open Questions`(
    title LONGTEXT NOT NULL
    , method LONGTEXT
    , result LONGTEXT
    , measure_of_evidence LONGTEXT
    , question_type VARCHAR(255)
    , added_on VARCHAR(64)
    , PRIMARY KEY (title)
    , FOREIGN KEY (title) REFERENCES Study(title)
);

INSERT INTO `Models and Open Questions`(
    title 
    , method 
    , result 
    , measure_of_evidence 
    , question_type 
    , added_on 
) SELECT
    Study
    , Method
    , Result
    , `Measure of Evidence`
    , question_type
    , `Added on` 
FROM temp_models;
