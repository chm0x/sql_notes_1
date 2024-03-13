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