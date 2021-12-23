DROP TABLE IF EXISTS Author;

CREATE TABLE Author(
  author_id INT NOT NULL AUTO_INCREMENT,
  author_name VARCHAR(255),
  contributing_study_id INT,
  PRIMARY KEY (author_id),
  FOREIGN KEY (contributing_study_id) REFERENCES Study(study_id)
);

INSERT INTO Author(contributing_study_id, author_name)
SELECT
  s.study_id,
  SUBSTRING_INDEX(SUBSTRING_INDEX(m.authors, ';', numbers.n), ';', -1) author_name
FROM
  (SELECT 1 n union all
   SELECT 2 union all SELECT 3 union all
   SELECT 4 union all SELECT 5) numbers 
  INNER JOIN temp_metadata m
    ON CHAR_LENGTH(m.authors)
     -CHAR_LENGTH(REPLACE(m.authors, ';', ''))>=numbers.n-1
  INNER JOIN Study s 
    ON s.title=m.title
ORDER BY
  study_id, n;

CREATE TABLE new_authors AS(
  SELECT
    * 
    , row_number() OVER(PARTITION BY author_name, contributing_study_id ORDER BY author_id desc) AS rn
  FROM Author
);

Delete FROM new_authors WHERE rn > 1;

DROP TABLE Author;
RENAME TABLE new_authors TO Author;

