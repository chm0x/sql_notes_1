-- DUPLICATE RECORDS 

/*
    For a pair of duplicate records, the values in each column coincide. 

    Duplicate records are not always allowed in a database or a data table. 

        - They are sometimes encountered, especially in new, raw, or uncontrolled 
        data. 
*/

-- MORE INSERT
/*
INSERT INTO dept_manager_dup
VALUES ('110228', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO departments_duplicate 
VALUES ('d009', 'Customer Service');
*/

-- Check 'dept_manager_dup' and 'departments_duplicate'.
SELECT 
    * 
FROM 
    dept_manager_dup
ORDER BY dept_no ASC;

SELECT * FROM departments_duplicate ORDER BY dept_no ASC;

-- 

SET 
 @@session.sql_mode='STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
SELECT 
    m.dept_no, m.emp_no, d.dept_name 
FROM 
    dept_manager_dup AS m
JOIN 
    departments_duplicate AS d 
ON 
    m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY dept_no;

