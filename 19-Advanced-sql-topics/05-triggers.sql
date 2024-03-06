-- TRIGGERS 

USE employees; 
SET @@session.sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

SELECT @@session.autocommit;
SET @@session.autocommit = 0;
COMMIT;

# BEFORE INSERT 
DELIMITER $$

CREATE TRIGGER before_salaries_insert
BEFORE INSERT ON salaries
FOR EACH ROW 
BEGIN
	IF NEW.salary < 0 THEN 
		SET NEW.salary = 0;
	END IF;
END $$

DELIMITER ;

SELECT 
	*
FROM 
	salaries 
WHERE 
	emp_no = '10001';


# Insert 
INSERT INTO salaries 
VALUES ('10001', -92891, '2024-03-04', '9999-01-01');

# Show it
SELECT * FROM salaries WHERE emp_no = '10001';

# BEFORE UPDATE
DELIMITER $$

CREATE TRIGGER before_salaries_update
BEFORE UPDATE ON salaries
FOR EACH ROW
BEGIN
	IF NEW.salary < 0 THEN
		SET NEW.salary = OLD.salary;
	END IF;
END $$

DELIMITER ;

-- Update something
UPDATE salaries 
SET 
	salary = 98765
WHERE 
	emp_no = '10001'
    AND from_date = '2024-03-04';
    

# Show them
SELECT * FROM salaries WHERE emp_no = '10001';

# Update with minus salary
UPDATE salaries 
SET 
	salary = - 3423
WHERE 
	emp_no = '10001'
    AND from_date = '2024-03-04';
    
SELECT * FROM salaries WHERE emp_no = '10001' AND from_date = '2024-03-04';



SELECT SYSDATE();
SELECT DATE_FORMAT(SYSDATE(), '%y-%m-%d') AS today;


# ------------------------------------------------------------------------
/*
	Main IDEA:
    A new employee has been promoted to a manager. 
    That means: 
		1. Annual salary should inmediately become 20,000 dollars higher than the 
        highest annual salary they'd ever earned until that moment. 
        
        2. A new record in the 'department manager' table. 
        
        3. Create a Trigger that will apply several modifications to the 'salaries' 
        table once the relevant record in the 'department manager' table has been inserted: 
			3.1 Make sure that the end date of the previously highest salary contract of that 
            employee is the one from the execution of the insert statement. 
            
            3.2 A Start date the same as the new 'from date' from the newly inserted record in 'department manager'.
            
            3.3 A salary equal to 20,000 dollars higher than their highest-ever salary. 
            
            3.4 Let that be a contract of indefinite duration. 
*/
DELIMITER $$
CREATE TRIGGER trig_ins_dept_manager
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE v_curr_salary INT;
    
    SELECT 
		MAX(salary)
	INTO 
		v_curr_salary
	FROM 
		salaries
	WHERE 
		emp_no = NEW.emp_no;
	
    IF v_curr_salary IS NOT NULL THEN 
		UPDATE salaries 
        SET 
			to_date = SYSDATE()
		WHERE 
			emp_no = NEW.emp_no AND to_date = NEW.to_date;
            
		INSERT INTO salaries
        VALUES(NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date);
	END IF;
        
END $$

DELIMITER ;
SELECT * FROM salaries WHERE emp_no = '111534';
DESC dept_manager;
INSERT INTO dept_manager VALUES('111534', 'd009', date_format(sysdate(), '%Y-%m-%d'), '9999-01-01');

SELECT * FROM dept_manager WHERE emp_no = '111534';
SELECT * FROM salaries WHERE emp_no = '111534';


-- Exercise
/*
	Create a trigger that checks if the hire date of an employee is higher 
    than the current date. If true, set this date to be the current date. 
    Format the output appropriately (YY-MM-DD).
*/
DELIMITER $$
CREATE TRIGGER trig_check_date
BEFORE INSERT ON employees
FOR EACH ROW 
BEGIN    
    IF NEW.hire_date > DATE_FORMAT(SYSDATE(), '%Y-%m-%d') THEN
        SET NEW.hire_date = DATE_FORMAT(SYSDATE(), '%Y-%m-%d');
	END IF;
END $$ 

DELIMITER ; 

INSERT INTO employees
VALUES (
	'999904','1970-01-31', 'John','Johnson', 'M', '2025-01-01'
);

SELECT * FROM employees WHERE emp_no = '999904';


