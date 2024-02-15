-- SUM()

SELECT SUM(salary) FROM salaries;
SELECT CONCAT('$',SUM(salary)) FROM salaries;

SELECT * FROM salaries LIMIT 5;
SELECT SUM(salary) FROM salaries 
WHERE from_date > '1997-01-01';