-- ROUND
/*
    Usually applied to the single values that aggregate functions return. 
*/
-- SYNTAS: ROUND(#, decimal_places)
SELECT AVG(salary) FROM salaries;
SELECT ROUND(AVG(salary)) FROM salaries;

SELECT ROUND(AVG(salary), 2) FROM salaries;


-- 
SELECT ROUND(AVG(salary), 2) FROM salaries 
WHERE from_date > '1997-01-01';



