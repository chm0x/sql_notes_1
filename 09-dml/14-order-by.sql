-- ORDER BY

SELECT * FROM employees 
ORDER BY first_name ASC
LIMIT 30;

SELECT * FROM employees
ORDER BY first_name DESC 
LIMIT 20;

SELECT * FROM employees
ORDER BY first_name, last_name ASC
LIMIT 20;

-- EXERCISE
SELECT * FROM employees
ORDER BY hire_date DESC
LIMIT 30;