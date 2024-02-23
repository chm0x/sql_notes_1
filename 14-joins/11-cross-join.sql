--- CROSS JOIN 
/*
    A cross join will take the values from a certain table and connect 
    them with all the values from the tables we want to join it with. 

    -- Contrast from INNER JOIN, that only join the match. 
    -- CROSS JOIN Connects all the values, including the match. 
    -- The Cartesian product  of the values of two or more sets. 
    -- CROSS JOIN is particularly useful when the tables in a database 
    are not well connected. 

    In short: 
    Product of Matrix
    [1,2,3,4] * [1,2]
*/

DESC dept_manager;
DESC departments;

SELECT 
    dm.*, 
    d.*
FROM
    dept_manager AS dm
CROSS JOIN 
    departments AS d
ORDER BY dm.emp_no, d.dept_no;


-- OLD SYNTAX
SELECT 
    dm.*, d.*
FROM
    dept_manager AS dm, 
    departments AS d
ORDER BY dm.emp_no, d.dept_no;

-- ANOTHER WAY
SELECT 
    dm.*, d.*
FROM 
    dept_manager AS dm
JOIN
    departments AS d
ORDER BY dm.emp_no, d.dept_no;

-- different
SELECT 
    dm.*, d.*
FROM 
    departments AS d
CROSS JOIN
    dept_manager AS dm
WHERE 
    d.dept_no != dm.dept_no
ORDER BY dm.emp_no, d.dept_no;

-- We want to show more information about our department 
-- managers, like their namems or their hire date. 
SELECT 
    e.*, d.*
FROM 
    departments AS d
CROSS JOIN 
    dept_manager AS dm  
JOIN 
    employees AS e
ON
    dm.emp_no = e.emp_no
WHERE 
    d.dept_no != dm.dept_no
ORDER BY dm.emp_no, d.dept_no;