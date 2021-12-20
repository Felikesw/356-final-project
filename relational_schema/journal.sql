-- run temp/temp_metadata.sql first
-- populates the journal table
DROP TABLE IF EXISTS Journal;

SELECT 'Create Journal' as '';

CREATE TABLE Journal (
    journal_id INT PRIMARY KEY,
    journal_name VARCHAR(64) NOT NULL
);