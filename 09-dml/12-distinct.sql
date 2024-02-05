-- DISTINCT 

SELECT DISTINCT(gender) FROM employees;


SELECT * FROM employees LIMIT 3;

SELECT DISTINCT(hire_date) FROM employees
LIMIT 30;

SELECT COUNT(DISTINCT(hire_date)) FROM employees;
