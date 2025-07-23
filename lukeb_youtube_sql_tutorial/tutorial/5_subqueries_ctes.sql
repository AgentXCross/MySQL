-- Subqueries and CTE's

SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    ) AS jan_jobs;

WITH jan_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)
SELECT *
FROM jan_jobs;

-- Use a subquery to get the company_name from company_dim for jobs that don't require degrees
-- Linked on company_id between company_dim and job_postings_fact
SELECT name
FROM company_dim
WHERE company_id IN (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
);

--Same but with CTE
WITH no_degree_id AS (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
) 
SELECT DISTINCT c.name
FROM company_dim AS c
JOIN no_degree_id AS n ON c.company_id = n.company_id;

-- Find the company with the most job openings
-- Get the total numbers of job postings per company id (job_postings_fact)
-- Return total number of jobs with the company name
WITH num_jobs_per_company AS (
    SELECT company_id, COUNT(job_id) AS total_jobs_per_company
    FROM job_postings_fact
    GROUP BY company_id
) SELECT c.name AS company_name, n.total_jobs_per_company
FROM company_dim AS c
JOIN num_jobs_per_company AS n
ON c.company_id = n.company_id
ORDER BY n.total_jobs_per_company DESC;

/*
Find the count of the number of remote job postings per skill for Data Analysts
- Display top 5 skills
- Include skill_id, skill_name, and count of postings requiring the skill
*/

WITH remote_jobs AS (
    SELECT job_id
    FROM job_postings_fact
    WHERE job_work_from_home = true
    AND job_title_short = 'Data Analyst'
),
skill_id_name AS (
    SELECT sjd.job_id, sjd.skill_id, sd.skills
    FROM skills_job_dim as sjd
    LEFT JOIN skills_dim as sd
    ON sjd.skill_id = sd.skill_id
)
SELECT s.skills, s.skill_id, COUNT(r.job_id) AS remote_job_for_skill
FROM skill_id_name AS s
LEFT JOIN remote_jobs AS r
ON s.job_id = r.job_id
GROUP BY s.skills, s.skill_id
ORDER BY remote_job_for_skill DESC;


