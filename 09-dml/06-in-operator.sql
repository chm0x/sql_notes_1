-- IT | NOT IN OPERATOR

SELECT
    *
FROM
    employees
WHERE
    first_name IN ('Cathie', 'Mark', 'Nathan');

SELECT
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie', 'Mark', 'Nathan');


-- EXERCISE

SELECT
    *
FROM
    employees
WHERE
    first_name IN ('Denis', 'Elvis');

SELECT
    *
FROM
    employees
WHERE
    first_name NOT IN ('John', 'Mark', 'Jacob');