-- RANKING WITH JOINS 
USE employees;

/*
    Subtask:
        - Obtain data only about the managers from the 'employees'
        database.
        - Partition the relevant information by the department where the 
        managers . 
        - Arrange the partitions by the managers's salary contract values
        in descending order. 
        - Rank the managers according to their salaries in a certain department(
            you prefer to not lose track of the number of salary contract signed 
            within each department
        )
        - Display the start and end dates of each salary contract( call the relevant
        fields salary_from_date and salary_to_date, respectively)
        - Display the first and last date in which an employee has been an manager,
        according to the data provided in the dept_manager table(call the 
        relevant fields dept_manager_from_date and dept_manager_to_date, respectively).
*/

SELECT 
    d.dept_no,
    d.dept_name,
    dm.emp_no,
    RANK() OVER w AS department_salary_ranking, 
    s.salary,
    s.from_date AS salary_from_date,
    s.to_date AS salary_to_date,
    dm.from_date AS dept_manager_from_date,
    dm.to_date AS dept_manager_to_date
FROM
    dept_manager dm
JOIN
    salaries s ON dm.emp_no = s.emp_no
    AND s.from_date BETWEEN dm.from_date AND dm.to_date
    AND s.to_date BETWEEN dm.from_date AND dm.to_date
JOIN
    departments d ON d.dept_no = dm.dept_no
WINDOW w AS (PARTITION BY dm.emp_no ORDER BY s.salary DESC)
LIMIT 100;


---- 
-- EXERCISE 1
/*
    Write a query that ranks the salary values in descending order
    of all contracts signed by employees numbered between 10500 
    and 10600 inclusive. Let equal salary values for one and 
    the same employee bear the same rank. 
    Also, allow gaps in the ranks obtained for their 
    subsequent rows.
*/

SELECT  
    e.emp_no,
    e.first_name,
    e.last_name,
    s.salary,
    RANK() OVER w AS rank_salaries
FROM
    employees e
JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE 
    e.emp_no BETWEEN 10500 AND 10600
WINDOW w AS (PARTITION BY e.emp_no ORDER BY s.salary DESC )
LIMIT 100;


-- EXERCISE 2
/*
    Write a query that ranks the salary values in descending order 
    of the following contracts from the "employees" database:

    - contracts that have been signed by employees numbered 
    between 10500 and 10600 inclusive.

    - contracts that have been signed at least 4 full-years 
    after the date when the given employee was hired in 
    the company for the first time.

    In addition, let equal salary values of a certain employee 
    bear the same rank. Do not allow gaps in the ranks 
    obtained for their subsequent rows.
*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    s.salary,
    e.hire_date,
    s.from_date,
    DENSE_RANK() OVER w AS ranking_salaries
FROM
    employees e 
JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE 
    e.emp_no BETWEEN 10500 AND 10600
    AND TRUNCATE(DATEDIFF(CURDATE(),hire_date) / 365, 0) > 4
WINDOW w AS (PARTITION BY e.emp_no ORDER BY s.salary DESC)
LIMIT 100;

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    DENSE_RANK() OVER w AS ranking_salaries,
    s.salary,
    e.hire_date AS emp_hire_date,
    s.from_date AS salary_from_date,
    (YEAR(s.from_date) - YEAR(e.hire_date)) AS years_from_start
FROM
    employees e 
JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE 
    e.emp_no BETWEEN 10500 AND 10600
    AND YEAR(s.from_date) - YEAR(e.hire_date) >= 5
WINDOW w AS (PARTITION BY e.emp_no ORDER BY s.salary DESC)
LIMIT 100;