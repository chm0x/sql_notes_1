-- NOT NULL CONSTRAINT 

CREATE TABLE IF NOT EXISTS companies(
    company_id INT AUTO_INCREMENT NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    headquarters_phone_number VARCHAR(255) ,
    PRIMARY KEY(company_id),
    UNIQUE KEY (headquarters_phone_number)
);

ALTER TABLE companies
MODIFY company_name VARCHAR(255) NOT NULL;

ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

----------------------------------------------------------------
ALTER TABLE companies 
MODIFY headquarters_phone_number VARCHAR(255) NULL;

ALTER TABLE companies
MODIFY headquarters_phone_number VARCHAR(255) NOT NULL;

ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number
headquarters_phone_number VARCHAR(255) NOT NULL;