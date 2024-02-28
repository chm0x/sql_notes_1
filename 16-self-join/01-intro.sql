-- SELF JOIN
/*
    Applied when a table must join itself. 
*/

-- Example
/*
    Task:
        From the emp_manager table, extract the record
        data only of those employees who are managers 
        as well.
*/
SELECT * 
FROM emp_manager
ORDER BY emp_manager.emp_no;

-- MANY DUPLICATES
SELECT e1.*
FROM
    emp_manager e1
JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;

-- There are 2 solutions

-- 1st Solution
SELECT DISTINCT (e1.emp_no),e1.dept_no, e2.manager_no 
FROM
    emp_manager e1
JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;



-- 2nd Solution
SELECT 
    e1.*
FROM
    emp_manager e1
JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE 
    e2.emp_no IN (
        SELECT manager_no 
        FROM emp_manager 
    );