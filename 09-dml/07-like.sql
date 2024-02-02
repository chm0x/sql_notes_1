-- LIKE | NOT LIKE operator

-- TO FIND A PATTERN

SELECT
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar%');

SELECT
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar_');


-- NOT LIKE

SELECT
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('Mar_');


-- EXERCISE

SELECT * FROM employees
WHERE first_name LIKE ('Mark%');


/*
    Retrieve a list with all employees who have been hired in the year 2000.
*/
SELECT * FROM employees 
WHERE YEAR(hire_date) = 2000; 

SELECT * FROM employees 
WHERE hire_date LIKE('%2000%');

/*
    Retrieve a list with all employees whose employee number is 
    written with 5 characters, and starts with “1000”. 
*/
SELECT * FROM employees
WHERE emp_no LIKE('1000_');

