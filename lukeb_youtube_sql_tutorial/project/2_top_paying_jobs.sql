/*
Question 2: What skills are required for top paying analyst job?
- Use top 10 highest paying jobs from first query
- Add the skills required for the roles
*/


WITH top_10_remote AS(
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        company_dim.name
    FROM 
        job_postings_fact
    LEFT JOIN
        company_dim
    ON
        job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
), skillid_to_skill AS (
    SELECT
        sjd.job_id, 
        sjd.skill_id,
        sd.skills
    FROM 
        skills_job_dim AS sjd
    LEFT JOIN
        skills_dim AS sd
    ON 
        sjd.skill_id = sd.skill_id
)
SELECT *
FROM top_10_remote
INNER JOIN skillid_to_skill
ON top_10_remote.job_id = skillid_to_skill.job_id;
