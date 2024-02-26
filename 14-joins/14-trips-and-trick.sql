/*
    get data:
    dept_name,
    average_salary
*/
SELECT 
    d.dept_name,
    AVG(s.salary) AS salaries_per_departments
FROM
    employees AS e
JOIN
    current_dept_emp AS emp ON e.emp_no = emp.emp_no
JOIN
    departments AS d ON d.dept_no = emp.dept_no
JOIN
    salaries AS s ON s.emp_no = e.emp_no
GROUP BY d.dept_no;

------


SELECT 
    d.dept_name, AVG(s.salary)
FROM
    departments AS d 
JOIN
    dept_manager AS m ON d.dept_no = m.dept_no
JOIN
    salaries AS s ON m.emp_no = s.emp_no
GROUP BY d.dept_no
ORDER BY d.dept_name;

SELECT 
    d.dept_name, AVG(s.salary) AS avg_salary
FROM
    departments AS d 
JOIN
    dept_manager AS m ON d.dept_no = m.dept_no
JOIN
    salaries AS s ON m.emp_no = s.emp_no
GROUP BY d.dept_no
HAVING AVG(s.salary) >= 60000
ORDER BY avg_salary DESC;

---------------------------------------------------

SELECT 
    d.dept_name,
    AVG(s.salary) AS salaries_per_departments
FROM
    employees AS e
JOIN
    dept_emp AS demp ON e.emp_no = demp.emp_no
JOIN
    departments AS d ON d.dept_no = demp.dept_no
JOIN
    salaries AS s ON s.emp_no = e.emp_no
GROUP BY d.dept_no;


SELECT COUNT(*) FROM dept_emp;
SELECT COUNT(*) FROM current_dept_emp;

-- EXERCISE
SELECT
    e.gender,
    COUNT(e.gender) AS total_gender
FROM
    employees AS e
JOIN
    dept_manager AS m ON e.emp_no = m.emp_no
GROUP BY e.gender;

SELECT
    e.gender,
    COUNT(m.emp_no) AS total_gender
FROM
    employees AS e
JOIN
    dept_manager AS m ON e.emp_no = m.emp_no
GROUP BY e.gender;