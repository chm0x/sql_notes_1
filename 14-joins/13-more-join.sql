-- JOIN more than 2 tables. 

/*
    When creating a query with multiples tables, you must back it with 
    STRONG INTUITION and a CRYSTAL-CLEAR idea of how you would like 
    the tables to be connected. 
*/

SELECT 
    e.first_name, 
    e.last_name, 
    e.hire_date,
    dm.from_date,
    d.dept_name
FROM
    employees AS e
JOIN
    dept_manager AS dm
ON
    e.emp_no = dm.emp_no
LEFT JOIN
    departments AS d
ON
    dm.dept_no = d.dept_no
LIMIT 10;

-- EXERCISE

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    t.from_date,
    d.dept_name
FROM 
    employees AS eW
JOIN
    titles AS t
ON
    e.emp_no = t.emp_no
JOIN
    current_dept_emp AS c
ON
    e.emp_no = c.emp_no
JOIN
    departments AS d
ON
    c.dept_no = d.dept_no
LIMIT 10;


-- 2 
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM 
    employees AS e
JOIN
    titles AS t
ON
    e.emp_no = t.emp_no
JOIN
    dept_manager AS m
ON
    e.emp_no = m.emp_no
JOIN
    departments AS d
ON
    m.dept_no = d.dept_no
WHERE 
    t.title = 'Manager'
ORDER BY e.emp_no;


-- SECOND OPTIONS
SELECT
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
    JOIN dept_manager m ON e.emp_no = m.emp_no
    JOIN departments d ON m.dept_no = d.dept_no
    JOIN titles t ON e.emp_no = t.emp_no
    AND m.from_date = t.from_date
ORDER BY
    e.emp_no;