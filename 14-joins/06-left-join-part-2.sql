-- LEFT JOIN PART 2
-- SWITCH ORDER MATTERS. 

SET 
 @@session.sql_mode='STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';


SELECT 
    m.dept_no, m.emp_no, d.dept_name 
FROM 
    departments_duplicate AS d
LEFT JOIN 
    dept_manager_dup AS m
ON 
    m.dept_no = d.dept_no 
ORDER BY m.dept_no;

SELECT 
    d.dept_no, m.emp_no, d.dept_name 
FROM 
    departments_duplicate AS d
LEFT JOIN 
    dept_manager_dup AS m
ON 
    m.dept_no = d.dept_no 
ORDER BY d.dept_no;



--- 
SELECT 
    m.dept_no, m.emp_no, d.dept_name 
FROM 
    dept_manager_dup AS m
LEFT JOIN 
    departments_duplicate AS d
ON 
    m.dept_no = d.dept_no 

WHERE m.dept_no IS NULL
-- WHERE m.dept_no IS NOT NULL
ORDER BY m.dept_no;


-- EXERCISE
DESC employees;
DESC dept_manager;

SELECT 
    e.emp_no, 
    e.first_name, 
    e.last_name,
    m.dept_no,
    m.from_date
FROM employees AS e
LEFT JOIN 
    dept_manager AS m
ON 
    e.emp_no = m.emp_no
WHERE e.last_name = 'Markovitch'
ORDER BY m.dept_no DESC, e.emp_no 
LIMIT 20;
