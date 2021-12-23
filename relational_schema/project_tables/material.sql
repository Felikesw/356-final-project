DROP TABLE IF EXISTS Materials;

CREATE TABLE Materials(
    id INT NOT NULL AUTO_INCREMENT
    , study_id INT
    , title VARCHAR(255)
    , material  VARCHAR(64)
    , method LONGTEXT
    , viral_titer LONGTEXT
    , persistence LONGTEXT
    , conclusion LONGTEXT
    , measure_of_evidence LONGTEXT
    , added_on VARCHAR(64)
    , question_type VARCHAR(255)
    , PRIMARY KEY (id)
    , FOREIGN KEY (study_id) REFERENCES Study(study_id)
);

INSERT INTO Materials (
    study_id
    , title  
    , material
    , method 
    , viral_titer
    , persistence
    , conclusion
    , measure_of_evidence
    , added_on 
    , question_type
) SELECT
    study_id
    , Study
    , Material
    , Method
    , `Viral Titer`
    , Persistence 
    , Conclusion 
    , `Measure of Evidence`
    , `Added on`
    , question_type
FROM temp_materials
INNER JOIN Study ON title=Study;