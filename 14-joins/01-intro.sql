-- JOINS
/*
    The SQL tool that allow us to construct a relationship between 
    objects. 
*/

SELECT * FROM departments_duplicate;

DESC departments_duplicate;

ALTER TABLE departments_duplicate
DROP COLUMN dept_manager;

ALTER TABLE departments_duplicate
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;


INSERT INTO departments_duplicate
VALUES 
('d012', 'Public Relations');

DELETE FROM departments_duplicate
WHERE dept_no = 'd002';

UPDATE departments_duplicate
SET 
    dept_no = NULL 
WHERE dept_no = 'd012';

---------------------------------------------

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE IF NOT EXISTS dept_manager_dup(
    emp_no INT(11) NOT NULL, 
    dept_no CHAR(4) NULL, 
    from_date DATE NOT NULL, 
    to_date DATE NULL
);

INSERT INTO dept_manager_dup
SELECT * FROM dept_manager;

INSERT INTO
    dept_manager_dup (emp_no, from_date)
VALUES
    (999904, '2017-01-01'),
    (999905, '2017-01-01'),
    (999906, '2017-01-01'),
    (999907, '2017-01-01');

SELECT * FROM dept_manager_dup;

DELETE FROM dept_manager_dup 
WHERE dept_no = 'd001';