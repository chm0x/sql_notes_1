-- AVG (Average)

/*
    Extracts the average value of all non-null values in a field. 
*/

-- "Which is the average annual salary the company's employee received?"
SELECT AVG(salary) FROM salaries;

-- "What is the average salary paid to employees who 
-- started after the 1st of January 1997?"
SELECT * FROM salaries limit 2;
SELECT AVG(salary) FROM salaries 
WHERE from_date > '1997-01-01';