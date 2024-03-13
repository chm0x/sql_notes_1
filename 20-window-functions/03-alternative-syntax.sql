-- ALTERNATIVE SYNTAX

SELECT 
    emp_no,
    salary,
    ROW_NUMBER() OVER w AS row_num
FROM
    salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)
LIMIT 20;


-- EXERCISE 
/*
    Write a query that provides row numbers for all workers 
    from the "employees" table, partitioning the data by 
    their first names and ordering each partition by their 
    employee number in ascending order.
*/

SELECT 
    e.emp_no,
    e.first_name,
    ROW_NUMBER() OVER w_row AS row_num
FROM 
    employees e
WINDOW w_row AS (PARTITION BY e.first_name ORDER BY e.emp_no ASC)
LIMIT 50;