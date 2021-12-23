DROP TABLE IF EXISTS `Therapeutics Interventions and Clinical Studies`;

CREATE TABLE `Therapeutics Interventions and Clinical Studies`(
    id INT NOT NULL AUTO_INCREMENT
    , study_id INT
    , title VARCHAR(255)
    , therapeutic_method LONGTEXT
    , sample_size VARCHAR(255)
    , severity_of_disease LONGTEXT
    , conclusion LONGTEXT
    , endpoint_of_study LONGTEXT
    , clinical_improvement VARCHAR(2)
    , added_on VARCHAR(64)
    , question_type VARCHAR(255)
    , PRIMARY KEY (id)
    , FOREIGN KEY (study_id) REFERENCES Study(study_id)
);

INSERT INTO `Therapeutics Interventions and Clinical Studies` (
    study_id
    , title 
    , therapeutic_method
    , sample_size
    , severity_of_disease
    , conclusion 
    , endpoint_of_study 
    , clinical_improvement
    , added_on 
    , question_type
) SELECT
    study_id
    , Study
    , `Therapeutic method(s) utilized/assessed`
    , `Sample Size`
    , `Severity of Disease` 
    , `General Outcome/Conclusion Excerpt` 
    , `Primary Endpoint(s) of Study`
    , `Clinical Improvement (Y/N)`
    , `Added on`
    , question_type
FROM temp_therapeutics
INNER JOIN Study ON title=Study;