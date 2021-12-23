SELECT * FROM Journal WHERE journal_name is NULL;

SELECT * FROM Study WHERE title is NULL;

SELECT * FROM Population WHERE title is NULL OR Study_id is NULL;