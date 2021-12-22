DROP TABLE IF EXISTS Author;

CREATE TABLE Author(
    author_name VARCHAR(255),
    contributing_study VARCHAR(255),
    PRIMARY KEY (author_name, contributing_study),
    FOREIGN KEY (contributing_study) REFERENCES Study(title)
);

INSERT INTO Author (author_name, contributing_study)
SELECT
  SUBSTRING_INDEX(SUBSTRING_INDEX(temp_author.authors, ',', numbers.n), ',', -1) author_name
  , contributing_study
FROM
  numbers INNER JOIN temp_author
  ON CHAR_LENGTH(temp_author.name)
     -CHAR_LENGTH(REPLACE(temp_author.name, ',', ''))>=numbers.n-1
ORDER BY
  id, n
