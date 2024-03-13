-- MULTIPLE ROWS

USE employees;

SELECT 
    emp_no,
    salary,
    ROW_NUMBER() OVER () AS row_num1,
    ROW_NUMBER() OVER (PARTITION BY emp_no) AS row_num2,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num3,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num4
FROM 
    salaries 
LIMIT 100;

SELECT 
    emp_no,
    salary,
    ROW_NUMBER() OVER (PARTITION BY emp_no) AS row_num2,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num3
FROM 
    salaries 
LIMIT 100;

-- Exercise 1

/*
Obtain a result set containing the salary values each 
manager has signed a contract for. To obtain the data, 
refer to the "employees" database.

Use window functions to add the following two columns to the final output:

    - a column containing the row number of each row 
    from the obtained dataset, starting from 1.

    - a column containing the sequential row numbers 
    associated to the rows for each manager, where their highest salary has been given a number equal to the number of rows in the given partition, and their lowest - the number 1.

Finally, while presenting the output, make sure that the data has 
been ordered by the values in the first of the row number columns, 
and then by the salary values for each partition in ascending order.
*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    s.salary,
    ROW_NUMBER() OVER() AS row_num,
    ROW_NUMBER() OVER(PARTITION BY e.emp_no ORDER BY s.salary DESC) AS row_num2
FROM 
    employees e
JOIN
    dept_manager m ON e.emp_no = m.emp_no
JOIN
    salaries s ON m.emp_no = s.emp_no
LIMIT 100;


-- EXERCISE 2
/*
Obtain a result set containing the salary values each 
manager has signed a contract for. To obtain the data, 
refer to the "employees" database.

Use window functions to add the following two columns to the final output:

    - a column containing the row numbers associated to 
    each manager, where their highest salary has been 
    given a number equal to the number of rows in the 
    given partition, and their lowest - the number 1.

    - a column containing the row numbers associated to 
    each manager, where their highest salary has been 
    given the number of 1, and the lowest - a value equal 
    to the number of rows in the given partition.

Let your output be ordered by the salary values associated 
to each manager in descending order.

Hint: Please note that you don't need to use an ORDER BY 
clause in your SELECT statement to retrieve the desired output.
*/

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    s.salary,
    ROW_NUMBER() OVER(PARTITION BY e.emp_no ORDER BY s.scealary) AS row_num1,
    ROW_NUMBER() OVER(PARTITION BY e.emp_no ORDER BY s.salary DESC) AS row_num1
FROM 
    employees e
JOIN 
    dept_manager m ON m.emp_no = e.emp_no
JOIN
    salaries s ON m.emp_no = s.emp_no
LIMIT 100;

