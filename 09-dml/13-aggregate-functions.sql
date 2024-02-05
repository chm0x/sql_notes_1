-- AGGREGATE FUNCTIONS 

/*
    They are applied on multiple rows of a single column of a table and 
    return an output of a single value. 

    - COUNT()
    - SUM()
    - MIN()
    - MAX()
    - AVG()

    THEY IGNORE THE NULL VALUES. 

*/

-- How many employees are registered in our database? 
SELECT COUNT(*) FROM employees;
SELECT COUNT(DISTINCT(first_name)) FROM employees;


-- EXERCISE

/*
    How many annual contracts with a value higher than or 
    equal to $100,000 have been registered in the salaries table?
*/

SELECT * FROM salaries LIMIT 3;
SELECT COUNT(salary) FROM salaries
WHERE salary >= 100000;


/*
    How many managers do we have in the 
    “employees” database? 
*/

SELECT COUNT(*) FROM dept_manager;