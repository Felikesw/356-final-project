-- creates table journal
DROP TABLE IF EXISTS Journal;

CREATE TABLE Journal(
    journal_id INT NOT NULL AUTO_INCREMENT
    , journal_name LONGTEXT NOT NULL
    , PRIMARY KEY (journal_id)
);

-- populate
INSERT INTO Journal (journal_name)
SELECT journal FROM temp_metadata_3 GROUP BY journal;