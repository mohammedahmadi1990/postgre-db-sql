-- Create github DB
CREATE DATABASE github_db;

-- connect to DB
\c github_db;

-- Create github_data
CREATE TABLE github (
  topic TEXT,
  user_name TEXT,
  repo_name TEXT,
  repo_link TEXT,
  star_count INTEGER
);

-- Copy data from the CSV file
COPY github FROM 'd:\github_data.csv' WITH (FORMAT csv, HEADER true);

-- Verify data copied: 21337 records
SELECT * FROM github;


-- Q1
SELECT * 
FROM github;

-- Q2
SELECT DISTINCT topic
FROM github;

-- Q3
SELECT repo_name, star_count 
FROM github
ORDER BY star_count DESC;

-- Q4
SELECT DISTINCT topic
FROM github
ORDER BY topic ASC;

-- Q5
SELECT repo_name
FROM github
WHERE star_count > 2000;


-- Q6
SELECT repo_name
FROM github
WHERE star_count > 3000 AND topic = '3d';

-- Q7
SELECT repo_name
FROM github
WHERE (topic = 'aws' OR topic = 'azure' OR topic = 'chrome') AND star_count < 1000;

-- Q8
SELECT user_name, repo_name, repo_link
FROM github
WHERE repo_link LIKE '%ext%';

-- Q9
SELECT *
FROM github
WHERE topic = 'chrome' AND star_count > 5000;

-- Q10
SELECT user_name, repo_name
FROM github
WHERE star_count BETWEEN 1000 AND 15000;

-- Q11
SELECT DISTINCT user_name
FROM github
WHERE star_count > 15000
ORDER BY user_name ASC;

-- Q12
SELECT DISTINCT user_name
FROM github
WHERE user_name LIKE 'Add%' OR user_name LIKE '%on';


-- Q13
SELECT DISTINCT topic
FROM github
WHERE star_count > 100000
ORDER BY topic ASC;


-- Q14
SELECT topic
FROM github
WHERE star_count IS NULL;


-- Q15
SELECT topic, user_name, star_count
FROM github
WHERE topic LIKE 'a%' AND star_count BETWEEN 100000 AND 200000;

