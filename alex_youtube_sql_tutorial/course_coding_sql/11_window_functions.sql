#Window Functions
USE Parks_and_Recreation;

SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

#Something similar using a window function
SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id;
    
#Rolling sum
SELECT dem.first_name, dem.last_name, gender, SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id;
    
#Rank and partition
SELECT dem.employee_id, dem.first_name, dem.last_name, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) as row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id;
    
SELECT dem.employee_id, dem.first_name, dem.last_name, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) as row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as dense_rank_num
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal 
	ON dem.employee_id = sal.employee_id;
    


