-- SQL VIEWS
/*
    A virtual table whose contents are obtained from an existing 
    table or tables, called *base tables*.

    - Think of a view object as a view into the base table. 
    - The view itself does not contain any real data; the data is 
    physically stored in the base table. 
    - The view simply shows the data contained in the base table.

    SYNTAX:
        CREATE [OR REPLACE] VIEW view_name AS
        SELECT 
            column_1, column_2, ..., column_n
        FROM
            table_name;

    REASON:
        - Saves a lot of coding time. 
        - Occupies no extra memory.
        - Acts as a dynamic table because it instantly reflrects data 
        and structural  changes in the base table.
*/
SELECT * FROM dept_emp LIMIT 10;

SET 
 @@session.sql_mode='STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';


SELECT  
    emp_no,
    from_date,
    to_date,
    COUNT(emp_no) AS Num
FROM 
    dept_emp
GROUP BY emp_no
HAVING Num > 1;

-- Visualize only the period encompassing
-- the last contract of each employee. 
CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
SELECT  
    emp_no, 
    MAX(from_date) AS from_date,
    MAX(to_date) AS to_date
FROM
    dept_emp
GROUP BY emp_no
LIMIT 25;



-- Get views
SELECT * FROM employees.v_dept_emp_latest_date;


-- Exercise
CREATE OR REPLACE VIEW v_average_salary_from_all_managers AS
SELECT ROUND(AVG(s.salary),2) AS average_salary_from_managers
FROM salaries s
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
);

SELECT * FROM employees.v_average_salary_from_all_managers;


SELECT ROUND(AVG(s.salary),2) AS average_salary
FROM salaries s
JOIN
    dept_manager m ON s.emp_no = m.emp_no;