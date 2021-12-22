-- creates table journal
DROP TABLE IF EXISTS Journal;

CREATE TABLE Journal(
    journal_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (journal_name)
);

-- populate
INSERT INTO Journal (journal_name)
SELECT journal FROM temp_metadata GROUP BY journal;