DROP TABLE IF EXISTS `Patient Description`;

CREATE TABLE `Patient Description`(
    title LONGTEXT
    , sample_size VARCHAR(64)
    , age VARCHAR(24)
    , sample_obtained VARCHAR(64)
    , asymptomatic_transmission DOUBLE PRECISION(3,6)
    , characteristic_related_question VARCHAR(64)
    , excerpt LONGTEXT
    , added_on VARCHAR(64)
    , question_type VARCHAR(255)
    , PRIMARY KEY (title)
    , FOREIGN KEY (title) REFERENCES Study(title)
);

INSERT INTO `Patient Description` (
    title LONGTEXT
    , sample_size 
    , age 
    , sample_obtained
    , asymptomatic_transmission
    , characteristic_related_question
    , excerpt
    , added_on
    , question_type
) SELECT
    Study
    , `Sample Size`
    , Age 
    , `Sample Obtained`
    , `Asymptomatic Transmission`
    , `Characteristic`
    , Excerpt
    , `Added on`
    , question_type
FROM temp_patient;