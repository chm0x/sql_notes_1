-- STORED PROCEDURES

/*
    SYNTAX:
        DELIMITER $$
        DROP PROCEDURE IF EXISTS procedure_name;
        CREATE PROCEDURE procedure_name(parameters_1, parameters_2,...,parameters_n)
        BEGIN
            SELECT * FROM  employees        <-- Body of the procedure
            LIMIT 20;
        END$$
        DELIMITER ;
*/

-- Example 1
-- Return the first 1000 rows from the 'employees' table
USE employees;
DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
    SELECT * FROM employees LIMIT 1000;
END$$ 
DELIMITER ;

-- CALL a procedure
CALL employees.select_employees();

CALL select_employees();

-- EXERCISE
/*
	Create a procedure that will provide the average salary of all employees.
	Then, call the procedure.
*/
DROP PROCEDURE IF EXISTS avg_salary_employees;
DELIMITER $$
CREATE PROCEDURE avg_salary_employees()
BEGIN
	SELECT ROUND(AVG(s.salary),2) FROM salaries s;
END$$
DELIMITER ;
-- All is possible. Choose One
CALL avg_salary_employees();
CALL avg_salary;
CALL avg_salary();
CALL employees.avg_salary;
CALL employees.avg_salary();
