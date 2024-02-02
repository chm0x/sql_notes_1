-- OR OPERATOR
/*
    AND operator : Conditions set on *different* columns

    OR operator : Conditions set on the *same* column.
*/
SELECT
    *
FROM
    employees
WHERE
    first_name = 'Denis' OR first_name = 'Elvis';

-- EXERCISE

SELECT
    *
FROM
    employees
WHERE
    first_name = 'Kellie' OR first_name = 'Aruna';

