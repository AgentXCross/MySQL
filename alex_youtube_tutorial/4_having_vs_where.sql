#HAVING vs WHERE
#HAVING comes following grouping to filter groups, WHERE filters before grouping

USE Parks_and_Recreation;

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40; #Only shows the groups where the average age is greater than 50

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP by occupation
HAVING AVG(salary) > 75000; #Manager occupation average salaries greater than 75000