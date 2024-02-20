-- INNER JOIN 
/*
    Syntax:

        SELECT 
            table_1.column_name(s), table_2.column_name(s)
        FROM 
            table_1
        INNER JOIN | JOIN
            table_2 
        ON 
            table_1.column_name = table_2.column_name;
*/

SELECT * FROM dept_manager_dup ORDER BY dept_no;

SELECT * FROM departments_duplicate ORDER BY dept_no;

DESC dept_manager_dup;
DESC departments_duplicate;

-- INNER JOIN
SELECT
    m.dept_no,
    m.emp_no,
    d.dept_name
FROM
    dept_manager_dup AS m
INNER JOIN departments_duplicate AS d 
ON 
    m.dept_no = d.dept_no
ORDER BY m.dept_no;


--------------------------------------------------------------------

show tables;
-- emp_no, birth_date, first, last name, gender, hire_date
desc employees;
-- emp_no, dept_no, from_date, to_date
desc dept_manager;

DESC dept_emp;
DESC departments;




SELECT * FROM employees LIMIT 5;
SELECT * FROM dept_manager LIMIT 3;
SELECT * FROM dept_emp LIMIT 3;
SELECT * FROM departments LIMIT 3;

SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name, 
    dm.dept_no,
    e.hire_date
FROM employees AS e 
INNER JOIN  dept_manager AS dm
ON e.emp_no = dm.emp_no;

SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name, 
    dm.dept_no,
    e.hire_date,
    dep.dept_name
FROM employees AS e 
INNER JOIN  dept_manager AS dm
ON e.emp_no = dm.emp_no
INNER JOIN departments AS dep
ON dm.dept_no = dep.dept_no;