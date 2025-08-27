-- Question: What are the most in-demand skills for data Engineer?
SELECT skills,
    count(*) as skill_count
FROM skills_dim
    INNER JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
    INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE job_postings_fact.job_title_short = 'Data Engineer'
Group BY skills
ORDER BY skill_count DESC
LIMIT 10;
/*
 So, the results show that for a Data Engineering role, most required skill is 'sql'
 followed by 'python', 'aws', and 'azure'
 
 [
 {
 "skills": "sql",
 "skill_count": "113375"
 },
 {
 "skills": "python",
 "skill_count": "108265"
 },
 {
 "skills": "aws",
 "skill_count": "62174"
 },
 {
 "skills": "azure",
 "skill_count": "60823"
 },
 {
 "skills": "spark",
 "skill_count": "53789"
 },
 {
 "skills": "java",
 "skill_count": "35642"
 },
 {
 "skills": "kafka",
 "skill_count": "29163"
 },
 {
 "skills": "hadoop",
 "skill_count": "28883"
 },
 {
 "skills": "scala",
 "skill_count": "28791"
 },
 {
 "skills": "databricks",
 "skill_count": "27532"
 }
 ]
 */