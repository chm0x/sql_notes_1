-- INNER JOIN 
/*
    Syntax:

        SELECT 
            table_1.column_name(s), table_2.column_name(s)
        FROM 
            table_1
        INNER JOIN | JOIN
            table_2 
        ON 
            table_1.column_name = table_2.column_name;
*/

SELECT * FROM dept_manager_dup ORDER BY dept_no;

SELECT * FROM departments_duplicate ORDER BY dept_no;

DESC dept_manager_dup;
DESC departments_duplicate;

-- INNER JOIN
SELECT
    m.dept_no,
    m.emp_no,
    d.dept_name
FROM
    dept_manager_dup AS m
INNER JOIN departments_duplicate AS d 
ON 
    m.dept_no = d.dept_no;


