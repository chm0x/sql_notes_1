-- CASE STATEMENT 
/*
    Syntax:
        SELECT 
            column_name(s)
            CASE condition_field
                WHEN condition_field_value_1 THEN result_1
                WHEN condition_field_value_2 THEN result_2
                ...
                ELSE
                ...
            END AS column_name
        FROM 
            table_name;
*/

-- EXAMPLE
SELECT
    emp_no,
    first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'Male'
        ELSE
            'Female'
    END AS gender
FROM 
    employees 
LIMIT 15;

SELECT 
    emp_no,
    first_name,
    last_name,
    CASE gender
        WHEN 'M' THEN 'Male'
        ELSE 
            'Female'
    END AS gender
FROM 
    employees
LIMIT 15;

-------
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE 
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 
            'Employee'
    END AS is_manager
FROM 
    employees e
LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE 
    e.emp_no > 109990
LIMIT 15;


SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE  
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 
            'Employee'
    END AS is_manager
FROM 
    employees e
LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE 
    e.emp_no > 109990
LIMIT 15;


-- USING IF
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    IF(gender='M', 'Male', 'Female') AS gender
FROM 
    employees e
LIMIT 15;



---------------------
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE 
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more than $30,000'
        WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'Salary was raised by more than $20,000 but less than $30,000'
        ELSE 
            'Salary was raised by less than $20,000'
    END AS salary_increase
FROM
    employees e
JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no
LIMIT 15;


------ EXERCISE 1

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE 
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE
            'Regular Employee'
    END AS is_manager
FROM
    employees e
LEFT JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
WHERE 
    e.emp_no > 109990
LIMIT 20;


---- EXERCISE 2

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE 
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Higher than 30000'
        ELSE 
            'Nop'
    END AS salary_raise
FROM
    employees e
JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY s.emp_no
LIMIT 25;


-- EXERCISE 3
/*
    Extract the employee number, first name, and last name of the first 100 employees, 
    and add a fourth column, called “current_employee” saying 
    “Is still employed” if the employee is still working in the company, 
    or “Not an employee anymore” if they aren’t.
*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE 
        WHEN dp_emp.to_date > DATE_FORMAT(SYSDATE(), '%Y-%m-%d') THEN 'Still employeed'
        ELSE
            'Not an employee anymore'
    END AS current_employee
FROM 
    employees e
JOIN
    dept_emp dp_emp ON e.emp_no = dp_emp.emp_no
LIMIT 100;

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE 
        WHEN MAX(dp_emp.to_date) > DATE_FORMAT(SYSDATE(), '%Y-%m-%d') THEN 'Still employeed'
        ELSE
            'Not an employee anymore'
    END AS current_employee
FROM 
    employees e
JOIN
    dept_emp dp_emp ON e.emp_no = dp_emp.emp_no
GROUP BY dp_emp.emp_no
LIMIT 100;
