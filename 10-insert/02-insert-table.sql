-- INSERT DATA INTO A NEW TABLE. 
-- INSERT INTO SELECT 

/*
    Syntax:

        INSERT INTO table_name_2 (columns_1,...,column_n)
        SELECT column_1, ..., column_n
        FROM table_name_1
        WHERE conditions;
*/

CREATE TABLE IF NOT EXISTS departments_duplicate(
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);
DESC departments_duplicate;
DESC departments;
SELECT * FROM departments_duplicate;


-- COPIAR LA TABLA A LA TABLA DUPLICADA
INSERT INTO departments_duplicate(
    dept_no, 
    dept_name
)
SELECT *
FROM departments;

-- EXERCISES

INSERT INTO departments(dept_no, dept_name)
VALUES (
    'd010',
    'Business Analysis'
);



