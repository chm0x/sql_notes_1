-- HAVING 

/*
    SYNTAX:

        SELECT column_name(s)
        FROM table_name
        WHERE conditions
        GROUP BY column_name(s)
        HAVING conditions
        ORDER BY column_name(s)

    HAVING is like WHERE but applied to the GROUP BY and AGGREGATE FUNCTIONS. 
*/

-- EXAMPLES
SELECT * FROM employees
WHERE hire_date > '2000-01-01';
SELECT * FROM employees
HAVING hire_date > '2000-01-01';


-- 
SELECT first_name, COUNT(first_name) AS names_count
FROM employees
GROUP BY first_name
HAVING COUNT(first_name) > 290
ORDER BY first_name;


-- EXERCISE
SET @@global.sql_mode = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';




SELECT emp_no, AVG(salary) AS avg_salary
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

--- NOPE, IT DOES NOT OPERATE THE AVG.
SELECT emp_no,AVG(salary)
FROM salaries
WHERE salary > 120000
GROUP BY emp_no
ORDER BY emp_no;



SELECT emp_no, first_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no FROM salaries
    GROUP BY emp_no
    HAVING AVG(salary) > 120000
);


