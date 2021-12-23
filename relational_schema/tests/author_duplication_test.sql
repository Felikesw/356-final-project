-- looking for duplicates
WITH cte as (
    SELECT
    * 
    , row_number() OVER (PARTITION BY author_name, 
                                    contributing_study_id 
                        ORDER BY author_id DESC) AS rn
  FROM Author
)SELECT * FROM cte WHERE rn > 1;

-- should there be duplicates make a new_authors table, delete them, and set that as the authors table
CREATE TABLE new_authors AS(
  SELECT
    * 
    , row_number() OVER(PARTITION BY author_name, contributing_study_id ORDER BY author_id desc) AS rn
  FROM Author
);

Delete FROM new_authors WHERE rn > 1;

DROP TABLE Author;
RENAME TABLE new_authors TO Author;