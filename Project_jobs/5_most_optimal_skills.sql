/* Question: What are the most optimal skills to learn (it is in high demand and high-paying)?
 Targeting skills that offer job security, financial benefits, possibly remote working
 */
WITH skills_demand AS (
    SELECT skills_dim.skill_id,
        skills,
        count(*) as skill_count
    FROM skills_dim
        INNER JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
        INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg is not NULL
        AND job_work_from_home = TRUE
    Group BY skills_dim.skill_id
),
average_salary AS (
    SELECT skills_dim.skill_id,
        skills,
        round(AVG(salary_year_avg), 0) as avg_salary
    FROM skills_dim
        INNER JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
        INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg is not NULL
        AND job_work_from_home = TRUE
    GROUP BY skills_dim.skill_id
)
SELECT skills_demand.skills,
    skills_demand.skill_id,
    skill_count,
    avg_salary
FROM skills_demand
    INNER join average_salary on average_salary.skill_id = skills_demand.skill_id
WHERE skill_count > 10
ORDER BY avg_salary DESC