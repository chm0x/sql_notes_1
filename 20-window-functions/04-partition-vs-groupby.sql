--- PARTITION VS GROUP BY


USE employees;

SET 
 @@session.sql_mode='STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';


-- GROUP BY
SELECT 
    * 
FROM 
    salaries 
GROUP BY emp_no
LIMIT 100;

-- PARTITION
SELECT 
    emp_no,
    salary,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary ASC) AS row_num
FROM 
    salaries
LIMIT 100;

--- 
SELECT
    a.emp_no,
    MAX(salary) AS max_salary
FROM
    (
        SELECT 
            emp_no,
            salary,
            ROW_NUMBER() OVER w AS row_num
        FROM 
            salaries
        WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)
    ) AS a
GROUP BY emp_no
LIMIT 100;

SELECT 
    emp_no,
    salary,
    ROW_NUMBER() OVER w AS row_num
FROM 
    salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)
LIMIT 100;


------------------------------------------------------------
SELECT 
    a.emp_no,
    MAX(salary) AS max_salary
FROM
    (
        SELECT 
            emp_no,
            salary,
            ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) as row_num
        FROM
            salaries
    ) AS a
GROUP BY emp_no
LIMIT 100;
------------------------------------------------------------


SELECT
    a.emp_no, 
    MAX(salary) AS max_salary
FROM
    (
        SELECT  
            emp_no,
            salary
        FROM 
            salaries
    ) AS a
GROUP BY emp_no
LIMIT 100;

-- ABOVE ALL ARE 3 IDENTICAL METHODs. 

------------------------------------------------------------

/*
    This methods you can search on which
    salary is higher. The first or the second
    and so on.
*/
SELECT 
    a.emp_no,
    a.salary AS max_salary
FROM
    (
        SELECT
            emp_no,
            salary,
            ROW_NUMBER() OVER w AS row_num
        FROM
            salaries
        WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)
    ) AS a
WHERE 
    a.row_num = 1
LIMIT 10;

------------------------------------------------------------
SELECT 
    emp_no,
    salary,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_numb
FROM
    salaries
LIMIT 100;


------------------------------------------------------------
-- EXERCISE 1
/*
    Find out the lowest salary value each employee has ever 
    signed a contract for. 
    To obtain the desired output, use a subquery containing 
    a window function, as well as a window specification 
    introduced with the help of the WINDOW keyword.
*/

SELECT 
    a.emp_no,
    MIN(salary) AS min_salary
FROM
    (
        SELECT 
            emp_no,
            salary,
            ROW_NUMBER() OVER w AS row_num
        FROM
            salaries
        WINDOW w AS (PARTITION BY emp_no ORDER BY salary ASC)
    ) AS  a
GROUP BY emp_no
LIMIT 100;

------------------------------------------------------
-- EXERCISE 2
/*
    Again, find out the lowest salary value each employee has 
    ever signed a contract for. Once again, to obtain the 
    desired output, use a subquery containing a window function. 
    This time, however, introduce the window specification 
    in the field list of the given subquery.
*/
SELECT 
    a.emp_no,
    MIN(salary) AS min_salary
FROM
    (
        SELECT 
            emp_no,
            salary,
            ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary ASC ) AS row_num
        FROM
            salaries
    ) AS  a
GROUP BY emp_no
LIMIT 100;

----
--- EXERCISE 3
/*
    Once again, find out the lowest salary value each employee has 
    ever signed a contract for. This time, to obtain the desired 
    output, avoid using a window function. Just use an aggregate 
    function and a subquery.
*/
SELECT 
    a.emp_no,
    MIN(a.salary) AS min_salary
FROM
    (
        SELECT  
            emp_no,
            salary
        FROM 
            salaries
    ) AS a
GROUP BY emp_no
LIMIT 100;

--------------------------------------------------------
-- EXERCISE 4
/*
    Once more, find out the lowest salary value each employee 
    has ever signed a contract for. To obtain the desired 
    output, use a subquery containing a window function, 
    as well as a window specification introduced with 
    the help of the WINDOW keyword. Moreover, obtain 
    the output without using a GROUP BY clause in 
    the outer query.
*/
SELECT 
    a.emp_no,
    a.salary AS min_salary
FROM 
    (
        SELECT 
            emp_no,
            salary,
            ROW_NUMBER() OVER w AS row_num
        FROM
            salaries
        WINDOW w AS (PARTITION BY emp_no ORDER BY salary ASC)
    ) AS a
WHERE 
    a.row_num = 1
LIMIT 100;




--------------------------------------------------------
--- EXERCISE 5
/*
    Find out the second-lowest salary value each employee has 
    ever signed a contract for. To obtain the desired output, 
    use a subquery containing a window function, as well as a 
    window specification introduced with the help of the WINDOW keyword. 
    Moreover, obtain the desired result set without using a GROUP 
    BY clause in the outer query.
*/
SELECT 
    a.emp_no,
    a.salary
FROM 
    (
        SELECT 
            emp_no,
            salary,
            ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary ASC) as row_num
        FROM salaries
    ) AS a
WHERE a.row_num = 2
LIMIT 100;
