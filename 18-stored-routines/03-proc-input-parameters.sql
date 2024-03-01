-- STORED PROCEDURED with INPUT PARAMETERS.
/*
    A STORED ROUTINE can perform a calculation that transforms an 
    input value in an output value.

    A STORED PROCEDURES can take an *input* value and then use it in
    the query, or queries, written in the body of the procedure. 

    - This value is represented by the IN parameter

    SYNTAX:
        DELIMTER $$
        CREATE PROCEDURE procedure_name(in parameter)
        BEGIN
            SELECT * FROM EMPLOYEES
            LIMIT 1000;
        END$$
        DELIMITER ;
*/

-- EXAMPLES
USE employees;

DELIMITER $$

CREATE PROCEDURE emp_salary_1(IN p_emp_no INTEGER)
BEGIN
    SELECT 
        e.first_name, e.last_name, s.salary, s.from_date, s.to_date
    FROM
        employees e
    JOIN
        salaries s ON e.emp_no = s.emp_no
    WHERE 
        e.emp_no = p_emp_no;
END $$

DELIMITER ;

DELIMITER $$
DROP PROCEDURE p_emp_avg_salary_1;
CREATE PROCEDURE p_emp_avg_salary_1(IN p_emp_no INTEGER)
BEGIN
	SELECT 
		e.first_name,
        e.last_name,
        AVG(s.salary) AS avg_salary
	FROM 
		employees e
	JOIN
		salaries s ON e.emp_no = s.emp_no
	WHERE
		e.emp_no = p_emp_no
	GROUP BY e.emp_no;
END $$
DELIMITER ;


CALL emp_salary_1(10001);
CALL emp_salary_1(11300);

CALL p_emp_avg_salary_1(11300);
