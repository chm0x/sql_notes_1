/*
    Select the first and last name, the hire date, and the 
    job title of all employees whose first name is “Margareta” 
    and have the last name “Markovitch”.
*/

DESC employees;
DESC titles;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title
FROM 
    employees AS e
INNER JOIN
    titles AS t
ON
    e.emp_no = t.emp_no
WHERE 
    e.first_name = 'Margareta'
    AND 
    e.last_name = 'Markovitch'
ORDER BY e.emp_no;