-- PROCEDURES WITH AN OUTPUT PARAMETERS
/*
    with OUT parameter, use the SELECT-INTO query structure.
*/
USE employees;
-- EXAMPLES
DROP PROCEDURE IF EXISTS emp_avg_salary_out;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(in p_emp_no INTEGER, out p_avg_salary DECIMAL(10,2))
BEGIN
    SELECT
        AVG(s.salary)
    INTO
        p_avg_salary
    FROM
        employees e
    JOIN
        salaries s ON e.emp_no = s.emp_no
    WHERE 
        e.emp_no = p_emp_no
    GROUP BY e.emp_no;
END $$
DELIMITER ;

CALL emp_avg_salary_out(11300, @p_avg_salary);
CALL emp_avg_salary_out(11300);

-- Exercise
USE employees;
DROP PROCEDURE IF EXISTS emp_info;

DELIMITER $$
CREATE PROCEDURE emp_info(in p_first_name VARCHAR(14), in p_last_name VARCHAR(16) )
BEGIN
	SELECT 
		emp_no,
        birth_date,
        first_name,
        last_name,
        gender,
        hire_date
	FROM 
		employees 
	WHERE 
		first_name LIKE p_first_name AND last_name LIKE p_last_name;
END $$
DELIMITER ;



