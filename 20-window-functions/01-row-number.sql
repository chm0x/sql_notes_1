-- ROW_NUMBER() <- A window function. 
-- ONE OF THE SYNTAX:
/*

    SELECT 
        ...,
        ROW_NUMBER() OVER() AS ...
    FROM   
        ...
    ;
*/
USE employees;

SELECT 
    emp_no, 
    salary,
    ROW_NUMBER() OVER () AS row_num
FROM    
    salaries
LIMIT 20;


SELECT 
    emp_no, 
    salary,
    ROW_NUMBER() OVER (PARTITION BY emp_no) AS row_num
FROM    
    salaries
LIMIT 50;


SELECT 
    emp_no, 
    salary,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM    
    salaries
LIMIT 20;


--- EXERCISE 1 
/*
    Write a query that upon execution, assigns a row 
    number to all managers we have information for 
    in the "employees" database (regardless of 
    their department).

    Let the numbering disregard the department the 
    managers have worked in. Also, let it start 
    from the value of 1. Assign that value to 
    the manager with the lowest employee number.
*/
SELECT 
    emp_no,
    dept_no,
    ROW_NUMBER() OVER (ORDER BY emp_no) AS row_num
FROM 
    dept_manager
LIMIT 20;

-- exercise 2
/*
    Write a query that upon execution, assigns a sequential 
    number for each employee number registered in the "employees" 
    table. 
    Partition the data by the employee's first name and order 
    it by their last name in ascending order (for each partition).
*/

SELECT 
    emp_no, 
    first_name,
    last_name,
    ROW_NUMBER() OVER (PARTITION BY first_name ORDER BY last_name ASC) AS row_num
FROM 
    employees
LIMIT 50;