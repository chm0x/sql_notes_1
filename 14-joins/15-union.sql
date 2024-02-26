-- UNION vs UNION ALL
/*
    UNION ALL and UNION
        - Used to combine a few SELECT statements in a single output.
        - Tool that allows you to UNIFY tables.
        - We have to select the SAME NUMBER of COLUMNS from each table.
        - These columns should have the SAME NAME, should be in the SAME ORDER,
        and should contain RELATED DATA TYPES.
    
    DIFFERENCES BETWEEN UNION ALL AND UNION

    UNION:
        - Union displays only distinct values in the output.
        - Uses more MySQL resources (computational power and storage space)
    
    UNION ALL:
        - Union ALl retrieves the duplicate as well.
        - 
    
    Looking for Better results ? Use UNION

    Seeking to optimize performance? Opt for UNION ALL
    SYNTAX:
        SELECT 
            N columns
        FROM
            table_1
        UNION ALL 
            SELECT 
                N columns
            FROM
                table_2
*/

-- DROP TABLE IF EXISTS employees_dup;
CREATE TABLE IF NOT EXISTS employees_dup(
    emp_no INT(11),
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender ENUM('M','F'),
    hire_date DATE
);

-- Duplicate the structure of the 
-- 'employees' table. 
INSERT INTO employees_dup
SELECT 
    e.*
FROM employees AS e
LIMIT 20;


--
SELECT * FROM employees_dup;

-- INSERT ONE MORE
INSERT INTO employees_dup
VALUES 
    (
        '10001',
        '1953-09-02',
        'Georgi',
        'Facello',
        'M',
        '1986-06-26'
    );

SELECT * FROM employees_dup;

---------------------------------------------------
-- UNION ALL 
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup AS e
WHERE 
    e.emp_no = 10001
UNION ALL
SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM 
    dept_manager m;

-- UNION
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup AS e
WHERE 
    e.emp_no = 10001
UNION
SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM 
    dept_manager m;



----------------------
-- exercise
SELECT 
    *
FROM 
    (
        SELECT 
            e.emp_no,
            e.first_name,
            e.last_name,
            NULL AS dept_no,
            NULL AS from_date
        FROM
            employees AS e
        WHERE
            last_name = 'Denis'
        UNION
        SELECT 
            NULL AS emp_no,
            NULL AS first_name,
            NULL AS last_name,
            dm.dept_no,
            dm.from_date
        FROM
            dept_manager AS dm
    ) AS a
ORDER BY -a.emp_no DESC;
