-- LOCAL VARIABLES
CREATE FUNCTION emp_info_2(p_first_name VARCHAR(255), p_last_name VARCHAR(255)) RETURNS DECIMAL(10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN 
    DECLARE v_max_from_date DATE;
    DECLARE v_salary DECIMAL(10,2);

    BEGIN 
        DECLARE v_salary_2 DECIMAL(10,2);
    END

    -- Thus, It cannot access the variable v_salary_2 in this scope.
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