-- Modern and Old Syntax. 

-- OLD JOIN SYNTAX
/*
    - Using WHERE is more time-consuming.
*/
SELECT
    m.dept_no, m.emp_no, d.dept_name
FROM 
    dept_manager_dup m, 
    departments_duplicate d
WHERE 
    m.dept_no = d.dept_no 
ORDER BY m.dept_no;

-- EXERCISE
SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name, 
    dm.dept_no,
    e.hire_date
FROM 
    employees AS e,
    dept_manager AS dm
WHERE 
    e.emp_no = dm.emp_no;