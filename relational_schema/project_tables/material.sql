DROP TABLE IF EXISTS Materials;

CREATE TABLE Materials(
    title LONGTEXT
    , material  VARCHAR(64)
    , method LONGTEXT
    , viral_titer LONGTEXT
    , persistence LONGTEXT
    , conclusion LONGTEXT
    , measure_of_evidence LONGTEXT
    , added_on VARCHAR(64)
    , question_type VARCHAR(255)
    , PRIMARY KEY (title)
    , FOREIGN KEY (title) REFERENCES Study(title)
);

INSERT INTO Materials (
    title 
    , material
    , method 
    , viral_titer
    , persistence
    , conclusion
    , measure_of_evidence
    , added_on 
    , question_type
) SELECT
    Study
    , Material
    , Method
    , `Viral Titer`
    , Persistence 
    , Conclusion 
    , `Measure of Evidence`
    , `Added on`
    , question_type
FROM temp_materials;