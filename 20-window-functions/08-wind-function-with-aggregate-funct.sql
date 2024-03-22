-- AGGREGATE FUNCTIONS WITH WINDOWS FUNCTIONS

/*

*/


/*
    Task 1:
        - Create a MySQL query that will extract the following 
        information about *all currently employed workers* 
        registered in the *dept_emp* table:

            1. emp_no
            2. the department they are working in. 
            3. The salary they are currently being paid
            (= the salary value specified in their latest contract ) 
            4. The all-time average salary paid in the department the 
            employee is currently working in (
                =use a window function to create a field named *average_salary_per_department* 
            )

    There are only two types of contracts in the database
    regarding the current date:
        1. Contracts that have ended way before the day on which 
        this lecture has been recorded. 
        2. Contract of indefinite duration (to_date = '9999-01-01')
*/
USE employees;

SELECT SYSDATE();


SELECT 
    emp_no,
    salary,
    from_date,
    to_date
FROM 
    salaries 
WHERE to_date > SYSDATE()
LIMIT 100;

-- ERROR CODE: 1055
SELECT 
    emp_no,
    salary,
    MAX(from_date),
    to_date
FROM
    salaries
WHERE 
    to_date > SYSDATE()
GROUP BY
LIMIT 100;

-- Examples
SELECT 
    s1.emp_no, 
    s.salary,
    s.from_date,
    s.to_date
FROM 
    salaries s
JOIN 
    (
        SELECT 
            emp_no,
            MAX(from_date) AS from_date
        FROM
            salaries
        GROUP BY emp_no
    ) AS s1 ON s1.emp_no = s.emp_no
WHERE 
    s.to_date > SYSDATE()
    AND s.from_date = s1.from_date
LIMIT 100;


-- EXERCISE 1
/*
    Create a query that upon execution returns a result 
    set containing the employee numbers, contract salary 
    values, start, and end dates of the first ever contracts 
    that each employee signed for the company.
*/
SELECT 
    s1.emp_no,
    s.salary,
    s.from_date,
    s.to_date
FROM 
    salaries s
JOIN 
    (
        SELECT 
            emp_no,
            MIN(from_date) AS from_date
        FROM 
            salaries
        GROUP BY emp_no
    ) s1 ON s.emp_no = s1.emp_no
    AND s.from_date = s1.from_date
LIMIT 100;

SELECT 
    s1.emp_no,
    s.salary,
    s.from_date,
    s.to_date
FROM 
    salaries s
JOIN 
    (
        SELECT 
            emp_no,
            MIN(from_date) AS from_date
        FROM 
            salaries
        GROUP BY emp_no
    ) s1 ON s.emp_no = s1.emp_no
WHERE 
    s.from_date = s1.from_date
LIMIT 100;