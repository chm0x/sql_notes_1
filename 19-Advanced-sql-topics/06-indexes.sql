-- INDEXES
/*
    The data is taken from a column of the table and is stored in
    a certain order in a distinct place, called an index.

    The larger a database is, the slower the process of finding the 
    record or records you need. 

    We can use an index that will increase the speed of searches
    related to a table. 

    SYNTAX:

        ```
            CREATE INDEX index_name
            ON table_name(column_1, column_2, ...);
        ```
        The parentheses serve us to indicate the column 
        names on which our search will be based. 
        It will be speeded up and the data will be
        filtered in a quicker way. 
        The idea is to choose columns so your search 
        will be optimized.

        These must be fileds from your data table you 
        will search frequently.

        SQL specialist are always aiming for a good balance between 
        the *improvent of speed search* and the *resources used for 
        its execution*. 

        An Index occupies memory space and could be redundant 
        unless it can contribute to a quicker search.  
*/

SELECT * 
FROM employees
WHERE hire_date > '2000-01-01'
LIMIT 10;
-- Suppose the duration of the delivery: 0.500 sec. 

-- WITH INDEXES. 
CREATE INDEX i_hire_date_2000
ON employees (hire_date);

-- Same query but different duration of delivery. 
SELECT * 
FROM employees
WHERE hire_date > '2000-01-01';

-- INDEX COMPOSITE
CREATE INDEX i_composite
ON employees(first_name, last_name);

SELECT * FROM employees
WHERE first_name = 'Georgi'
AND last_name = 'Facello';


-- SHOW INDEXES
-- SYNTAX: SHOW INDEX FROM table_name [FROM database_name]
-- WHere [] are optionals. 
SHOW INDEXES FROM employees;
SHOW INDEXES FROM employees FROM employees;


-- exercise 1
-- DROP INDEX
DROP INDEX i_hire_date_2000 
ON employees;

DROP INDEX i_composite 
ON employees;

ALTER TABLE employees
DROP INDEX i_hire_date_2000;

--- exercise 2
SELECT * FROM salaries
WHERE salary > 89000;

CREATE INDEX i_salary
ON salaries(salary);


