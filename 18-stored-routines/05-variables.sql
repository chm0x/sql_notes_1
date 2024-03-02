-- VARIABLES
/*

    CREATE PROCEDURE ... (input)argument -> (output)variable

    Use the prefix of 'v' as variable
    ```
    SET @v_variable_name
    ```

    Process: 
    1. Create a variable
    2. Extract a value that will be assigned to the newly created variable (call the procedure)
    3. Ask the software to display the output of the procedure. 
*/

USE employees;
SET @v_avg_salary = 0;
CALL emp_avg_salary_out(11300, @v_avg_salary);

SELECT @v_avg_salary;


-- Exercise 
DROP PROCEDURE IF EXISTS emp_info_2;

DELIMITER $$
CREATE PROCEDURE emp_info_2(in p_first_name VARCHAR(14), in p_last_name VARCHAR(16), out p_emp_no INT)
BEGIN
	SELECT 
		emp_no
	INTO
		p_emp_no
	FROM 
		employees 
	WHERE first_name LIKE p_first_name AND last_name LIKE p_last_name;
END $$

DELIMITER ;

SET @v_emp_no = 0;
CALL emp_info_2('Aruna', 'Journel', @v_emp_no);
SELECT @v_emp_no;





