-- SUBQUERIES WITH EXISTS AND NO-EXISTS nested inside WHERE

/*
    EXISTS operator:

        - checks whether certain row values are found within a subquery.
        - this check is conducted row by row.
        - It returns a Boolean value.
*/
/*
    EXISTS vs IN operators

    Differences:

    EXISTS operator:
        1. Test row values for existence
        2. Quicker in retrieving LARGE AMOUNTS of data.

    IN operator:
        1. Searches among values
        2. Faster with SMALLER datasets. 
*/

-- Example
SELECT 
    e.first_name, e.last_name
FROM employees e
WHERE 
    EXISTS(
        SELECT * FROM dept_manager dm
        WHERE dm.emp_no = e.emp_no
    );



-- With ORDER BY
SELECT 
    e.first_name,
    e.last_name
FROM 
    employees e
WHERE 
    EXISTS(
        SELECT * FROM dept_manager dm
        WHERE dm.emp_no = e.emp_no
        ORDER BY emp_no
    );

-- PART 2: PROFESSIONAL
SELECT 
    e.first_name,
    e.last_name
FROM
    employees e
WHERE 
    EXISTS (
        SELECT * FROM dept_manager dm
        WHERE dm.emp_no = e.emp_no
    )
ORDER BY emp_no;

-- EXERCISE
/*
    Select the entire information for all employees whose
    job title is "Assistant Engineer"
*/

DESC titles;
SELECT DISTINCT(title) FROM titles;

SELECT e.* FROM employees e
WHERE e.emp_no IN (
    SELECT t.emp_no FROM titles t
    WHERE t.title = 'Assistant Engineer'
);

-- Option 2
SELECT e.* FROM employees e
WHERE EXISTS (
    SELECT t.* FROM titles t
    WHERE t.emp_no = e.emp_no
    AND t.title = 'Assistant Engineer'
);



