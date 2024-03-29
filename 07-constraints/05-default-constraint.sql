-- DEFAULT CONSTRAINT 

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0; 


-- DROP DEFAULT 

ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT;

CREATE TABLE IF NOT EXISTS companies(
    company_id VARCHAR(255),
    company_name VARCHAR(255) DEFAULT 'X',
    headquarters_phone_number VARCHAR(255) ,
    PRIMARY KEY(company_id),
    UNIQUE KEY (headquarters_phone_number)
);

DROP TABLE companies;