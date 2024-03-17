-- MYSQL RANK() AND DENSE_RANK() window functions. 
/*
    Assign the same rank to records representing identical 
    values. 
*/


USE employees;

SELECT 
    emp_no,
    salary,
    ROW_NUMBER() OVER w AS row_num
FROM 
    salaries 
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)
LIMIT 50;


SELECT 
    emp_no,
    salary,
    ROW_NUMBER() OVER w AS row_num
FROM 
    salaries 
WHERE emp_no = 10001
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)
LIMIT 50;


SELECT 
    emp_no,
    (COUNT(salary) - COUNT(DISTINCT salary)) AS diff
FROM 
    salaries
GROUP BY emp_no
HAVING 
    diff > 0
ORDER BY emp_no
LIMIT 50;


---------------------------------------------
/*
    Use of the Ranks functions:
    ```
    What if some of the salary values were identical?

    What if an employee had signed two or morew contracts
    of the same value, albeit related to different period?
    ```
*/

SELECT 
    * 
FROM 
    salaries
WHERE 
    emp_no = 10560;
    -- emp_no = 11839;

--------------------------------------------------------
-- With RANK()
SELECT 
    emp_no,
    salary,
    RANK() OVER w AS rank_num
FROM 
    salaries 
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

--------------------------------------------------------
/*
    What rank values are assigned to the records subsequent 
    to the records with an identical value? 
*/
-- With DENSE_RANK()
-- Best option
SELECT 
    emp_no,
    salary,
    DENSE_RANK() OVER w AS rank_num
FROM 
    salaries 
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);


----------------------------------------------------------
/*
    EXERCISE 1:
    Write a query containing a window function to 
    obtain all salary values that employee number
    10560 has ever signed a contract for.

    Order and display the obtained salary values
    from highest to lowest.
*/
SELECT 
    emp_no,
    salary,
    ROW_NUMBER() OVER w AS row_num
FROM
    salaries 
WHERE emp_no = 10560 
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)
LIMIT 20;

/*
    EXERCISE 2:
    Write a query that upon execution, displays the number 
    of salary contracts that each manager has ever 
    signed while working in the company.
*/
SELECT 
    dm.emp_no,
    (COUNT(s.salary)) AS no_of_salary_contracts
FROM 
    dept_manager dm
JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY emp_no
ORDER BY emp_no
LIMIT 50;


/*
    EXERCISE 3:
    Write a query that upon execution retrieves
    a result set containing all salary values
    that employee 10560 has ever signed a contract for. 
    Use a window function to rank all salary values 
    from highest to lowest in a way that equal salary 
    values bear the same rank and that gaps in 
    the obtained ranks for subsequent rows are allowed.
*/
SELECT 
    emp_no,
    salary,
    RANK() OVER w AS row_rank
FROM 
    salaries 
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)
LIMIT 20;

/*
    EXERCISE 4:
    Write a query that upon execution retrieves 
    a result set containing all salary values
    that employee 10560 has ever signed a contract for. 
    Use a window function to rank all salary values 
    from highest to lowest in a way that equal salary 
    values bear the same rank and that gaps in 
    the obtained ranks for subsequent rows are not allowed.
*/
SELECT 
    emp_no,
    salary,
    DENSE_RANK() OVER w AS den_rank
FROM 
    salaries
WHERE emp_no = 10560
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)
LIMIT 20;
