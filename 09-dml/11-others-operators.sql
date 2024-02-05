-- OTHERS COMPARISON OPERATORS

/*
    =       Equal to
    >       Greater than
    >=      Greater than or Equal to
    <       Less Than
    <=      Less than or Equal to
    <>      Not equal, different from
    !=      Not equal, different from.

*/

SELECT * FROM employees
WHERE first_name != 'Mark'
LIMIT 20;

SELECT * FROM employees
WHERE hire_date > '2000-01-01'
LIMIT 30;

-- oUTPUT 12
SELECT COUNT(*) FROM employees
WHERE hire_date > '2000-01-01';

-- Output 13
SELECT COUNT(*) FROM employees
WHERE hire_date >= '2000-01-01';


-- EXERCISE
-- 1
SELECT * FROM employees
WHERE gender = 'F' 
AND hire_date >= '2000-01-01';

--2
SELECT * FROM salaries
WHERE salary > 150000;
