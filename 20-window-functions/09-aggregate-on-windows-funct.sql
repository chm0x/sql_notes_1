-- AGGREGATE FUNCTION IN THE CONTEXT OF WINDOW FUNCTIONS PART II

SELECT * FROM dept_emp LIMIT 100;
SELECT * FROM dept_emp WHERE emp_no = 10010 ORDER BY from_date;
SELECT * FROM dept_emp WHERE emp_no = 10018 ORDER BY from_date;
SELECT * FROM salaries WHERE emp_no = 10010 ORDER BY from_date;
SELECT * FROM salaries WHERE emp_no = 10018 ORDER BY from_date;


SELECT 
    de.emp_no,
    de.dept_no,
    de.from_date,
    de.to_date
FROM 
    dept_emp de
JOIN
    (
        SELECT 
            emp_no,
            MAX(from_date) AS from_date
        FROM
            dept_emp
        GROUP BY emp_no
    ) de1 ON de.emp_no = de1.emp_no 
WHERE 
    de.to_date > SYSDATE()
    AND 
    de.from_date = de1.from_date
LIMIT 100;

----------------------------
SELECT 
    de2.emp_no,
    d.dept_name,
    s2.salary,
    AVG(s2.salary) OVER w AS average_salary_per_department
FROM
    (
        SELECT 
            de.emp_no,
            de.dept_no,
            de.from_date,
            de.to_date
        FROM
            dept_emp de
        JOIN
            (
                SELECT 
                    emp_no,
                    MAX(from_date) AS from_date
                FROM
                    dept_emp
                GROUP BY emp_no
            ) de1 ON de1.emp_no = de.emp_no
        WHERE 
            de.to_date > SYSDATE()
            AND de.from_date = de1.from_date
    )  de2
JOIN
    (
        SELECT 
            s1.emp_no, 
            s.salary,
            s.from_date,
            s.to_date
        FROM 
            salaries s
        JOIN
            (
                SELECT 
                    emp_no,
                    MAX(from_date) AS from_date
                FROM
                    salaries
                GROUP BY emp_no
            ) s1 ON s.emp_no = s1.emp_no
        WHERE 
            s.to_date > SYSDATE()
            AND s.from_date = s1.from_date
    ) s2 ON s2.emp_no = de2.emp_no
JOIN
    departments d ON d.dept_no = de2.dept_no
GROUP BY de2.emp_no, d.dept_name
WINDOW w AS (PARTITION BY de2.dept_no)
ORDER BY de2.emp_no
LIMIT 100;


--- EXERCISE 1
/*
    Consider the employees' contracts that have been signed after the 1st of 
    January 2000 and terminated before the 1st of January 2002 
    (as registered in the "dept_emp" table).

    Create a MySQL query that will extract the following information 
    about these employees:

    - Their employee number

    - The salary values of the latest contracts they have signed 
    during the suggested time period.

    - The department they have been working in (as specified 
    in the latest contract they've signed during the 
    suggested time period)

    - Use a window function to create a fourth field 
    containing the average salary paid in the department 
    the employee was last working in during the 
    suggested time period. Name that field "average_salary_per_department".
*/
SELECT 
    dpt.emp_no,
    s1.previous_salary,
    dpt.dept_name,
    AVG(s1.previous_salary) OVER w AS average_salary_per_department
FROM
    (
        SELECT 
            emp_no,
            LAG(salary) OVER w1 AS previous_salary
        FROM
            salaries
        WHERE  
            from_date >= '2000-01-01'
            AND to_date <= '2002-01-01'
        WINDOW w1 AS (PARTITION BY emp_no)
    ) s1 
JOIN
    (
        SELECT
            d.emp_no,
            dept1.dept_no,
            LAG(dept1.dept_name) OVER w2 AS dept_name
        FROM
            departments dept1
        JOIN
            (
                SELECT
                    emp_no,
                    dept_no
                FROM
                    dept_emp
                WHERE 
                    from_date > '2000-01-01'
                    AND to_date < '2002-01-01'
            ) d
        WINDOW w2 AS (PARTITION BY dept1.dept_no)
    ) dpt ON dpt.emp_no = s1.emp_no
GROUP BY dpt.emp_no, dpt.dept_name, s1.emp_no
WINDOW w AS (PARTITION BY dpt.dept_no) 
ORDER BY dpt.dept_no
LIMIT 100;


SELECT  
    de2.emp_no,
    d.dept_name,
    s2.salary,
    AVG(s2.salary) OVER w AS average_salary_per_department
FROM 
    (
        SELECT 
            de.emp_no,
            de.dept_no,
            de.from_date,
            de.to_date
        FROM 
            dept_emp de
        JOIN
            (
                SELECT
                    emp_no,
                    MAX(from_date) AS from_date
                FROM
                    dept_emp
                GROUP BY emp_no
            )de1 ON de1.emp_no = de.emp_no
        WHERE 
            de.to_date < '2002-01-01'
            AND de.from_date > '2000-01-01'
            AND de.from_date = de1.from_date
    )de2
JOIN
    (
        SELECT  
            s1.emp_no,
            s.salary,
            s.from_date,
            s.to_date
        FROM
            salaries s
        JOIN
            (
                SELECT 
                    emp_no,
                    MAX(from_date) AS from_date
                FROM
                    salaries
                GROUP BY emp_no
            )s1 ON s.emp_no = s1.emp_no
        WHERE 
            s.to_date < '2002-01-01'
            AND s.from_date > '2000-01-01'
            AND s.from_date = s1.from_date
    )s2 ON s2.emp_no = de2.emp_no
JOIN
    departments d ON d.dept_no = de2.dept_no
GROUP BY de2.emp_no, d.dept_name
WINDOW w AS (PARTITION BY de2.dept_no)
ORDER BY de2.emp_no, salary
LIMIT 300;

You have an error in your SQL syntax; 
check the manual that corresponds to your MySQL server version for 
the right syntax to use near 'BBY de2.dept_no)
ORDER BY de2.emp_no, salary
LIMIT 100' at line 55