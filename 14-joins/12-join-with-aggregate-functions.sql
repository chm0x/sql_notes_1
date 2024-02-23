-- JOINS WITH AGGREGATE FUNCTIONS


-- EXAMPLE: Find the AVERAGE salaries of men and women in the company.
SELECT 
    e.gender, AVG(s.salary) AS average_salary
FROM 
    employees AS e
JOIN
    salaries AS s
ON 
    e.emp_no = s.emp_no
GROUP BY e.gender;