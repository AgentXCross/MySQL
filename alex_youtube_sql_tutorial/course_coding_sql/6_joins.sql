#JOINS
#Combining tables that have a common column 

USE Parks_and_Recreation;

#Demographics and salary have the same employee_id column
SELECT *
FROM employee_demographics;

SELECT * 
FROM employee_salary;

#INNER JOIN
SELECT dem.employee_id, age, occupation #Join employee demographics and salary on id
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;


#OUTER JOIN
SELECT * #Join left table and right table, anything not matching in right table will become NULL
FROM employee_salary AS sal
LEFT OUTER JOIN employee_demographics AS dem
	ON dem.employee_id = sal.employee_id;
    
#SELF JOIN (Secret Santas)
SELECT EMP1.employee_id AS santa_id, EMP1.first_name AS santa_name,
EMP2.employee_id AS receiver_id, EMP2.first_name AS receiver_name
FROM employee_salary AS EMP1
JOIN employee_salary AS EMP2
	ON EMP1.employee_id + 1 = EMP2.employee_id; #Shifting the right table
    
#Joining multiple tables together
SELECT * #Join all three tables together based on employee_id and department_id
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	ON pd.department_id = sal.dept_id;
    
SELECT * 
FROM parks_departments;
