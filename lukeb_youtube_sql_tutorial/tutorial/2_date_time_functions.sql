SELECT job_posted_date
FROM job_postings_fact
LIMIT 10;

-- Type Casting
SELECT 
    '2023-02-19'::DATE,
    '123'::INT,
    'true'::BOOLEAN,
    '3.14'::REAL;

SELECT job_title_short AS title,
job_location AS location,
job_posted_date::DATE AS date
FROM job_postings_fact
LIMIT 20;

SELECT job_title_short AS title,
job_location AS location,
job_posted_date AS date_time
FROM job_postings_fact
LIMIT 20;

-- Date_Time data is in UTC, convert to EST
SELECT job_title_short AS title,
job_location AS location,
job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time_est
FROM job_postings_fact;


-- Extracting a specific field from the date
SELECT 
    job_title_short AS title,
    job_location AS location,
    EXTRACT (MONTH FROM job_posted_date) AS month
FROM job_postings_fact
ORDER BY RANDOM()
LIMIT 20;

-- Number of jobs per month
SELECT
    EXTRACT (MONTH FROM job_posted_date) AS month,
    COUNT(job_id) AS job_posted_count
FROM job_postings_fact
WHERE job_title_short = 'Data Scientist'
GROUP BY month
ORDER BY month ASC;


