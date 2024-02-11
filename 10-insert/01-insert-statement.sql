-- INSERT STATEMENT


/*
INSERT INTO employees (
    emp_no, 
    birth_date, 
    first_name, 
    last_name, 
    gender, 
    hire_date
)
VALUES 
(
    999901,
    '1982-02-10',
    'Master',
    'Chief',
    'M',
    '2023-01-01'
);
*/

SELECT DISTINCT(title) FROM titles;
SELECT * FROM titles LIMIT 10;
DESC titles;

/*
INSERT INTO titles(
    emp_no, 
    title, 
    from_date
)
VALUES
(
    999903, 
    'Senior Engineer', 
    '1997-10-01'
)*/

SELECT * FROM titles
ORDER BY emp_no DESC
LIMIT 2;


SELECT * FROM dept_emp
LIMIT 2;
DESC dept_emp;

INSERT INTO dept_emp(
    emp_no, 
    dept_no, 
    from_date, 
    to_date
)
VALUES 
(
    '999903',
    'd005',
    '1997-10-01',
    '9999-01-01'
);
