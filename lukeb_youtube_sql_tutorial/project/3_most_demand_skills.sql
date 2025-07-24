/*
Question 3: Find the most in demand skills
*/

WITH complete_table AS (
    SELECT 
        jpf.job_id, sjd.skill_id, sd.skills
    FROM
        job_postings_fact AS jpf
    LEFT JOIN
        skills_job_dim AS sjd
    ON 
        jpf.job_id = sjd.job_id
    LEFT JOIN
        skills_dim AS sd
    ON
        sjd.skill_id = sd.skill_id
)
SELECT skills, COUNT(*) AS num_jobs
FROM complete_table
WHERE skills IS NOT NULL
GROUP BY skills
ORDER BY num_jobs DESC;

-- Fun: Window function to rank jobs based on avg salary then find the highest for each skill
WITH complete_table AS (
    SELECT 
        jpf.job_id, jpf.salary_year_avg, sjd.skill_id, sd.skills
    FROM
        job_postings_fact AS jpf
    LEFT JOIN
        skills_job_dim AS sjd
    ON 
        jpf.job_id = sjd.job_id
    LEFT JOIN
        skills_dim AS sd
    ON
        sjd.skill_id = sd.skill_id
    WHERE jpf.salary_year_avg IS NOT NULL
), ranked_within_skill AS (
    SELECT 
        *,
        ROW_NUMBER() OVER(PARTITION BY skills ORDER by salary_year_avg DESC) AS rank
    FROM complete_table
)
SELECT *
FROM ranked_within_skill
WHERE rank = 1
ORDER BY salary_year_avg DESC;

SELECT *
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 1;
