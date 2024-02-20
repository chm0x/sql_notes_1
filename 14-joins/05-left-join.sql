-- LEFT JOIN
/*
    1. All matching values of the two tables. 
    2. All values from the left table that match no values from 
    the right table. 
*/
/*
DELETE FROM dept_manager_dup
WHERE emp_no='110228';

DELETE FROM departments_duplicate 
WHERE dept_no = 'd009';

-- ADD 
INSERT INTO dept_manager_dup 
VALUES ('11028', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO departments_duplicate
VALUES ('d009', 'Customer Service');

*/

-- Left join's query. 
SELECT 
    m.dept_no, m.emp_no, d.dept_name 
FROM 
    dept_manager_dup AS m
LEFT JOIN 
    departments_duplicate AS d
ON 
    m.dept_no = d.dept_no 
GROUP BY m.emp_no
ORDER BY m.dept_no;