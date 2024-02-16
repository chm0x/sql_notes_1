-- IFNULL and COALESCE

/*
    IFNULL(expression_1, expression_2)
        Returns the first of the two indicated values if the data 
        value found in the table is not null, and returns the second 
        value if there is a null value. 

        LIMITATION: Cannot contain more than two parameters. 
*/

ALTER TABLE departments_duplicate 
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

ALTER TABLE departments_duplicate
MODIFY dept_name VARCHAR(40) NULL;

INSERT INTO departments_duplicate(dept_no)
VALUES('d010'), ('d011');

SELECT * FROM departments_duplicate
ORDER BY dept_no;

SELECT 
    dept_no, 
    IFNULL(dept_name, 'Department not provided') AS dept_name,
    IFNULL(dept_manager, 'Not Assigned') AS dept_manager
FROM departments_duplicate;


--------------------------------------------------------------
-- COALESCE

/*
    COALESCE(expression_1, expression_2, ..., expression_N)
    Allows you to insert N arguments in the parentheses. 

    - Think of COALESCE() as IFNULL() with more than two parameters. 
    - COALESCE will always return a single value of the ones we have
*/

SELECT 
    dept_no, 
    COALESCE(dept_name, 'Department Not Provided') AS dept_name
FROM departments_duplicate;

SELECT 
    dept_no,
    COALESCE(dept_name, NULL), 
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM departments_duplicate;


-- PART 2
SELECT 
    dept_no, 
    dept_name, 
    COALESCE('department manager name') AS fake_col
FROM departments_duplicate;

-- EXERCISE
/*
    Select the department number and name from the ‘departments_dup’
    table and add a third column where you name the department number
    (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, 
    use ‘dept_name’.
*/
SELECT 
    dept_no, 
    dept_name,
    -- IFNULL(dept_no, dept_name) AS dept_info
    COALESCE(dept_no, dept_name)
FROM departments_duplicate
ORDER BY dept_no ASC;

/*
    Modify the code obtained from the previous exercise in the 
    following way. 
    Apply the IFNULL() function to the values from the 
    first and second column, so that ‘N/A’ is displayed whenever a 
    department number has no value, and ‘Department name not 
    provided’ is shown if there is no value for ‘dept_name’.
*/
SELECT 
    IFNULL(dept_no, 'N/A'),
    IFNULL(dept_name, 'Deoartment Name Not Provided'),
    COALESCE(dept_no, dept_name) AS dept_info
FROM departments_duplicate;
