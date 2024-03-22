-- LAG() and LEAD() Value Window Functions 

/*
    As opposed to ranking window functions, value window
    functions *return a value that can be found in the database*.

    LAG: 
        - Returns the value from a specified field of a record that 
        precedes the current row. 

    LEAD:
        - Returns the value from a specified field of a record that
        follows *(the value that leads the current value) the current row.

*/

/*  
    USE CASES:
        - The salary values from all contract that employee 10001 had
        ever signed while working for the company(in ascending order).
        - A column showing the PREVIOUS salary value from our ordered list.
        - A column showing the NEXT salary value from our ordered list. 
        - A column displaying the DIFFERENCE between the CURRENT and PREVIOUS salary
        of a given record from the list. 
        - A column displaying the DIFFERENCE between the NEXT and the CURRENT salary 
        of a given record from the list. 
*/

SELECT 
    LAG(salary) OVER  w AS previous_salary,
    salary AS current_salary,
    LEAD(salary) OVER w AS next_salary,
    salary - LAG(salary) OVER w AS diff_salary_current_previous,
    LEAD(salary) OVER w - salary AS diff_salary_next_current
FROM
    salaries
WHERE emp_no = 10002
WINDOW w AS (ORDER BY salary ASC)
LIMIT 100;


-- EXERCISE 1
/*
    Write a query that can extract the following information 
    from the "employees" database:

    - the salary values (in ascending order) of the contracts 
    signed by all employees numbered between 10500 and 10600 inclusive

    - a column showing the previous salary from the given ordered list

    - a column showing the subsequent salary from the given ordered list

    - a column displaying the difference between the current salary 
    of a certain employee and their previous salary

    - a column displaying the difference between the next salary 
    of a certain employee and their current salary

    Limit the output to salary values higher than $80,000 only.

    Also, to obtain a meaningful result, partition the data by employee number.
*/
SELECT 
    s.emp_no,
    s.salary AS current_salary,
    LAG(s.salary) OVER w AS previous_salary,
    LEAD(s.salary) OVER w AS next_salary,
    (s.salary - LAG(s.salary) OVER w ) AS diff_current_previous_salary,
    ( LEAD(s.salary) OVER w - s.salary ) AS diff_next_current_salary 
FROM salaries s
WHERE 
    s.emp_no BETWEEN 10500 AND 10600
    AND s.salary > 80000
WINDOW w AS (PARTITION BY s.emp_no ORDER BY salary ASC)
LIMIT 100;



-- EXERCISE 2
/*
    The MySQL LAG() and LEAD() value window functions can have a second argument, 
    designating how many rows/steps back (for LAG()) or 
    forth (for LEAD()) we'd like to refer to with respect to a given record.

    With that in mind, create a query whose result set contains 
    data arranged by the salary values associated to each employee 
    number (in ascending order).
    Let the output contain the following six columns:

    - the employee number

    - the salary value of an employee's contract 
    (i.e. which we’ll consider as the employee's current salary)

    - the employee's previous salary

    - the employee's contract salary value preceding their previous salary

    - the employee's next salary

    - the employee's contract salary value subsequent to their next salary
*/
SELECT 
    emp_no,
    salary AS current_salary,
    LAG(salary) OVER w AS previous_salary,
    LAG(salary,2) OVER w AS 1_before_previous_salary,
    LEAD(salary) OVER w AS next_salary,
    LEAD(salary,2) OVER w AS after_next_salary
FROM
    salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary ASC)
LIMIT 100;

