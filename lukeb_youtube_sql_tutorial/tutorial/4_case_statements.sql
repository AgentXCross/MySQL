SELECT
    job_title_short,
    job_location
FROM job_postings_fact
LIMIT 10;

/* Label new column
Anywhere -> Remote
New York, NY -> Local
Else -> Onsite
*/

SELECT 
    job_title_short,
    job_location,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location LIKE '%New York%' THEN 'Local'
        ELSE 'Onsite'
    END as relative_location
FROM job_postings_fact
LIMIT 25;

SELECT 
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location LIKE '%New York%' THEN 'Local'
        ELSE 'Onsite'
    END as relative_location,
    COUNT(job_id) AS num_jobs
FROM job_postings_fact
WHERE job_title_short LIKE '%Data Analyst%'
GROUP BY relative_location;