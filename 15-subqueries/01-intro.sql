-- INTRO: SUBQUERIES
/*
    - Subqueries are queries embedded in a query.
    - Also called "INNER QUERIES" or "NESTED QUERIES"
    - They are part of another query, called an "OUTER QUERY" 
    and "OUTER SELECT".

    1. The SQL engine starts by running the inner query.
    2. Then it uses its returned output, which is the intermediate,
    to execute the outer query.

    A SUBQUERY may return a single value(a scalar), a single row,
    a single column, or an entire table.

    You can have a lot more than one subquery in your outer query.

*/

-- Examples
SELECT * FROM dept_manager;

/*
    SELECT the first and last name from the "Employees"
    table for the same employee numbers that can be
    found in the "Department Manager" table.
*/

SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no FROM dept_manager
);

-- Examples
/*
    Extract the info about all department manager
    who were hired between the 1st of January 1990
    and the 1st of January 1995. 
*/

DESC dept_manager;
DESC employees;

SELECT * FROM dept_manager
WHERE emp_no IN (
    SELECT emp_no FROM employees
    WHERE hire_date BETWEEN '1990-01-01' AND '1995-01-01'
);