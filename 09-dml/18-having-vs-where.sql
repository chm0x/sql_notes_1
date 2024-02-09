-- HAVING VS WHERE
/*
"Extract a list of all names that are encountered less than 200 times. 
Let the data refer to people hired after the 1st of January 1999."
*/

SELECT first_name, COUNT(first_name) AS names_count 
FROM employees
WHERE hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC
LIMIT 10;

-- EXERCISE 
SELECT emp_no
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;