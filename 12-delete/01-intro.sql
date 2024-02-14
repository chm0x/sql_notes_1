-- DELETE STATEMENT 
/*
    Syntax: 

        DELETE FROM table_name 
        WHERE conditions;

    ON DELETE CASCADE: 

        - If a specific value from the parent table's primary key has been 
        deleted, all the records from the child table referring to this value
        will be removed as well. 
*/
SET autocommit=0;
COMMIT;

SELECT * FROM employees
WHERE emp_no = 999903;

SELECT * FROM employees
ORDER BY emp_no DESC
LIMIT 10;

SELECT * FROM titles 
WHERE emp_no = 999903;

DELETE FROM employees
WHERE emp_no = 999903;


ROLLBACK;


SELECT * FROM departments;

