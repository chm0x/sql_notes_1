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


-- EXERCISE 1
/*
    return a list with all possible 
    combinations between managers from the 
    dept_manager table and department number 9.
*/
SELECT 
    m.*, 
    d.*
FROM 
    dept_manager AS m
CROSS JOIN
    departments AS d 
WHERE 
    d.dept_no = 'd009'
ORDER BY d.dept_no;

-- EXERCISE 2
/*
    Return a list with the first 10 employees 
    with all the departments they can be assigned to.
    (Don't use the Limit, use WHere clause)
*/
DESC employees;
DESC departments;

SELECT 
    e.*,
    d.*
FROM 
    employees AS e
CROSS JOIN 
    departments AS d
WHERE 
    e.emp_no < 10011
ORDER BY e.emp_no, d.dept_name;