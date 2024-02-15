-- AGGREGATE FUNCTION 

/*
    They gather data from many rows of a table, then aggregate it into a 
    single value. 

    COUNT(): 
        - Applicable to both numeric and non-numeric data. 
        - IGNORES NULL VALUES. 
        - COUNT(*) -> returns the number of all rows of the table, NULL 
        values included. 
*/

-- "How many employee start dates are in the database?"
SELECT COUNT(DISTINCT(from_date)) 
FROM salaries;

-- "How many departments are there in the 'employees' database? "
SELECT COUNT(DISTINCT(dept_no)) FROM departments;


