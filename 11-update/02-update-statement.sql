-- UPDATE STATEMENT
/*
    Used to update the values of existing records in a table. 

    Syntax: 
        UPDATE table_name
        SET column_1 = value_1, column_2 = value_2, ...
        WHERE conditions;
    
    
*/
SELECT * FROM employees
ORDER BY emp_no DESC 
LIMIT 10;

SELECT * FROM employees
WHERE emp_no = 999901;

UPDATE employees 
SET 
    hire_date = '2024-02-11'
WHERE 
    emp_no = 99901;





-- EXERCISE 
SELECT * FROM departments;
UPDATE departments
SET 
    dept_name = 'Data Analysis'
WHERE 
    dept_no = 'd010';


    
