DROP TABLE IF EXISTS Diagnostic;

CREATE TABLE Diagnostic(
    title VARCHAR(255)
    , detection_method  VARCHAR(255)
    , sample_size VARCHAR(64)
    , measure_of_testing_accuracy LONGTEXT
    , speed_of_assay VARCHAR(255)
    , fda_approval VARCHAR(64)
    , added_on VARCHAR(64)
    , question_type VARCHAR(255)
    , PRIMARY KEY (title)
    , FOREIGN KEY (title) REFERENCES Study(title)
);

INSERT INTO Diagnostic (
    title 
    , detection_method
    , sample_size
    , measure_of_testing_accuracy
    , speed_of_assay
    , fda_approval
    , added_on 
    , question_type
) SELECT
    Study
    , `Detection Method`
    , `Sample Size` 
    , `Measure of Testing Accuracy` 
    , `Speed of assay`
    , `FDA Approval` 
    , `Added on`
    , question_type
FROM temp_diagnostics;