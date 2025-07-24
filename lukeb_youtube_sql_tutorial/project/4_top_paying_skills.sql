/*
Question 4: Top Skills Based on Avg Salary for Data Analyst
*/

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
    AND jpf.job_title_short LIKE '%Data Analyst%'
), output_table AS (
    SELECT 
        skills, 
        COUNT(*) AS num_jobs_per_skill, 
        AVG(salary_year_avg) AS avg_salary_per_skill
    FROM complete_table
    GROUP BY skills
) SELECT *
FROM output_table
ORDER BY avg_salary_per_skill DESC;