-- IS NULL  |   IS NOT NULL operators

/*
    Used to extract values that are not null. 

    SELECT column_1, column_n
    FROM table_name
    WHERE condition IS NOT NULL;
*/

SELECT * FROM employees
WHERE first_name IS NOT NULL
LIMIT 20;

SELECT * FROM employees
WHERE first_name IS  NULL
LIMIT 20;

SELECT * FROM departments
WHERE dept_no IS NOT NULL;