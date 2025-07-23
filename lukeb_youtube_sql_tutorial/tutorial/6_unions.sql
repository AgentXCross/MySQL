SELECT *
FROM jan_jobs
UNION
SELECT *
FROM feb_jobs
UNION
SELECT *
FROM mar_jobs;

-- Union removes duplicates Union all does not
-- Union stacks the rows

SELECT 
    job_title_short,
    company_id,
    job_location
FROM jan_jobs
UNION ALL
SELECT
    job_title_short,
    company_id,
    job_location
FROM feb_jobs
UNION ALL
SELECT 
    job_title_short,
    company_id,
    job_location
FROM mar_jobs;

-- Practice Problem 8
/*
Find job postings from the first quarter with salary greater than 70K
    Combine job postings table from first quarter of 2023 (Jan-March)
    Get job postings with annual avg salary > 70K
*/

SELECT *
FROM jan_jobs
ORDER BY job_posted_date DESC
LIMIT 5;

WITH first_quarter AS (
    SELECT 
        job_id, 
        job_title_short, 
        job_title,
        job_location,
        job_posted_date,
        job_country,
        salary_year_avg
    FROM jan_jobs
    UNION ALL
    SELECT 
        job_id, 
        job_title_short, 
        job_title,
        job_location,
        job_posted_date,
        job_country,
        salary_year_avg
    FROM feb_jobs
    UNION ALL 
    SELECT 
        job_id, 
        job_title_short, 
        job_title,
        job_location,
        job_posted_date,
        job_country,
        salary_year_avg
    FROM mar_jobs
)
SELECT *
FROM first_quarter
WHERE salary_year_avg >= 70000
ORDER BY salary_year_avg DESC;