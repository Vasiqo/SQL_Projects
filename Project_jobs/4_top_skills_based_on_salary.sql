--Question: What are the top skills based on salary?
SELECT skills,
    round(AVG(salary_year_avg), 0) as avg_salary
FROM skills_dim
    INNER JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_title_short = 'Data Scientist'
    AND salary_year_avg is not NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 10
    /* What the results says?
     The results says that Data Scientist roles that requires skills like 'asana', 'airtable', and 'redhat'
     gives more salary on average. So, knowing these skills will get high salary Data Scientist jobs.
     
     [
     {
     "skills": "asana",
     "avg_salary": "215477.375000000000"
     },
     {
     "skills": "airtable",
     "avg_salary": "201142.857142857143"
     },
     {
     "skills": "redhat",
     "avg_salary": "189500.000000000000"
     },
     {
     "skills": "watson",
     "avg_salary": "187417.142857142857"
     },
     {
     "skills": "elixir",
     "avg_salary": "170823.562500000000"
     },
     {
     "skills": "lua",
     "avg_salary": "170500.000000000000"
     },
     {
     "skills": "slack",
     "avg_salary": "168218.764705882353"
     },
     {
     "skills": "solidity",
     "avg_salary": "166979.900000000000"
     },
     {
     "skills": "ruby on rails",
     "avg_salary": "166500.000000000000"
     },
     {
     "skills": "rshiny",
     "avg_salary": "166436.205882352941"
     }
     ]
     */