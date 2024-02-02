-- OPERATOR PRECEDENCE 
/*
    Logical Operator Precedence 

    An SQL rule stating that in the execution of the query, the operator AND
    is applied first, while the operator OR is applied second. 
*/

SELECT
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND (gender = 'M' OR gender = 'F');


-- EXERCISE

SELECT * FROM employees
WHERE (first_name = 'Kellie' OR first_name = 'Aruna') AND gender = 'F'