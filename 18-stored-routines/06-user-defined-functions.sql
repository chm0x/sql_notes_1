-- USER-DEFINED FUNCTIONS
/*
    DIFFERENCE between Stored Procedures and Functions. 


    SYNTAX: 
        DELIMITER $$
        CREATE FUNCTION function_name(parameter data_type) RETURNS data_type
        DETERMINISTIC NO SQL READS SQL DATA
        DECLARE variable_name data_type

        BEGIN
            SELECT ...
        
            RETURN variable_name
        END $$
*/

USE employees;
SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION IF EXISTS f_emp_avg_salary;
-- lower case matters
DROP function IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
    
	DECLARE v_avg_salary DECIMAL(10,2);
    
    SELECT 
        AVG(s.salary)
    INTO 
        v_avg_salary 
    FROM    
        salaries s
    WHERE 
        s.emp_no = p_emp_no;

    RETURN v_avg_salary;
END $$ 

DELIMITER ;

SELECT f_emp_avg_salary(11300); 


-- EXERCISE
/*
Create a function called ‘emp_info’ that takes for parameters the first and 
last name of an employee, and returns the salary from the 
newest contract of that employee.
*/
USE employees;
DELIMITER $$
CREATE FUNCTION f_emp_info(p_first_name VARCHAR(12), p_last_name VARCHAR(16)) RETURNS DECIMAL(10,2)
DETERMINISTIC READS SQL DATA
BEGIN
	DECLARE v_salary DECIMAL(10,2);
    
	SELECT 
		s.salary
		INTO
			v_salary
	FROM 
		employees e 
	JOIN 
		salaries s ON e.emp_no = s.emp_no
	WHERE 
		e.first_name = p_first_name AND e.last_name = p_last_name
        AND s.from_date = (
							SELECT MAX(from_date) FROM salaries 
                            WHERE emp_no = (
								SELECT emp_no FROM employees
                                WHERE first_name = p_first_name 
                                AND last_name = p_last_name
							)
						);
	
    RETURN v_salary;
END $$

DELIMITER ;
SET @output_emp_info_1 = 0;
SELECT f_emp_info('Georgi','Facello');



DROP FUNCTION IF EXISTS emp_info_2;
DELIMITER $$
CREATE FUNCTION emp_info_2(p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN 
    DECLARE v_max_from_date DATE;
    DECLARE v_salary DECIMAL(10,2);

    SELECT  
        MAX(s.from_date) INTO v_max_from_date
    FROM
        employees e
    JOIN
        salaries s ON e.emp_no  = s.emp_no
    WHERE 
        e.first_name = p_first_name AND e.last_name = p_last_name;

    SELECT 
        s.salary INTO v_salary
    FROM 
        employees e 
    JOIN
        salaries s ON e.emp_no = s.emp_no
    WHERE 
        e.first_name = p_first_name AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
    
    RETURN v_salary;
END $$

DELIMITER ;

SELECT emp_info_2('Georgi','Facello');









