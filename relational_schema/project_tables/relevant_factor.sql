DROP TABLE IF EXISTS `Relevant Factor`;

CREATE TABLE `Relevant Factor`(
    title VARCHAR(255)
    , factors LONGTEXT
    , influential VARCHAR(2)
    , excerpt LONGTEXT
    , measure_of_evidence LONGTEXT
    , added_on VARCHAR(64)
    , question_type VARCHAR(255)
    , PRIMARY KEY (title)
    , FOREIGN KEY (title) REFERENCES Study(title)

);

INSERT INTO `Relevant Factor` (
    title 
    , factors 
    , influential
    , excerpt 
    , measure_of_evidence 
    , added_on
    , question_type 
) SELECT
    Study
    ,Factors
    , Influential
    , Excerpt
    , `Measure of Evidence`
    , `Added on`
    , question_type
FROM temp_r_factors;