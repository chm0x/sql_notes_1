-- RIGHT JOIN
/*
    LEFT and RIGHT joins are perfect examples of 
    ONE-TO-MANY relationship.
*/
SELECT 
    m.dept_no,
    m.emp_no,
    d.dept_name
FROM 
    dept_manager_dup AS m
RIGHT JOIN 
    departments_duplicate AS d
ON 
    m.dept_no = d.dept_no 
ORDER BY d.dept_no;