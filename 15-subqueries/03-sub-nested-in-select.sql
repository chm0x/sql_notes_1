-- Subqueries nested in SELECT and FROM.
-- Visual Example 
SELECT * FROM 
    ( 
        SELECT e.* FROM employees e 
        LIMIT 50
    ) 
AS another_table;


/*
    Assign employee number 110022 as a manager 
    to all employees from 10001 to 10020, and employee
    number 110039 as a manager to all employees 
    from 10021 to 10040
*/

SELECT subset_a.* FROM 
(
    SELECT 
        e.emp_no AS employee_ID,
        MIN(de.dept_no) AS department_code,
        (
            SELECT emp_no FROM dept_manager
            WHERE emp_no = 110022
        ) AS manager_ID
    FROM 
        employees e
    JOIN
        dept_emp de ON e.emp_no = de.emp_no
    WHERE e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
) AS subset_a
UNION 
SELECT subset_b.* FROM 
(
    SELECT 
        e.emp_no AS employee_ID,
        MIN(de.dept_no) AS department_code,
        (
            SELECT emp_no FROM dept_manager
            WHERE emp_no = 110039
        ) AS manager_ID
    FROM 
        employees e
    JOIN
        dept_emp de ON e.emp_no = de.emp_no
    WHERE e.emp_no Between 10021 and 10040
    GROUP BY e.emp_no
    ORDER BY e.emp_no
) AS subset_b;