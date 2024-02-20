-- PART 2: NOTE
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM 
    dept_manager_dup AS m
INNER JOIN 
    departments_duplicate AS d
ON 
    m.dept_no = d.dept_no
ORDER BY m.dept_no;


SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM 
    dept_manager_dup AS m
INNER JOIN 
    departments_duplicate AS d
ON 
    m.dept_no = d.dept_no
ORDER BY m.dept_no;