-- creates table questions
DROP TABLE IF EXISTS Questions;

CREATE TABLE Questions(
    question_type VARCHAR(255) NOT NULL,
    PRIMARY KEY (question_type)
);

INSERT INTO Questions (question_type)
    VALUES  ("Population"),
            ("Relevant Factors"),
            ("Patient Descriptions"),
            ("Models and Open Questions"),
            ("Materials"),
            ("Diagnostics"),
            ("Therapeutics Interventions and Clinical Studies");