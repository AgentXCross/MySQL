#Temporary Tables

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favourite_movie varchar(100)	
);

#Method 1
INSERT INTO temp_table
VALUES('Alex', 'Freberg', 'Lord of the Rings');

SELECT * 
FROM temp_table;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k
