
-- MODIFY
ALTER TABLE companies
MODIFY company_name VARCHAR(255) NOT NULL;

-- CHANGE
-- You can change column's name. 
ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

-- DROP
ALTER TABLE departments_duplicate
DROP COLUMN dept_manager;
