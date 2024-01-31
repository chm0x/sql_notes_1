-- CONSTRAINT: pRIMARY KEY

CREATE TABLE IF NOT EXISTS sales(
    purchase_number INT NOT NULL AUTO_INCREMENT, 
    date_of_purchase DATE NOT NULL, 
    customer_id INT, 
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY(purchase_number)
);

DROP TABLE customers;

CREATE TABLE IF NOT EXISTS customers ( 
    customer_id INT,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
    primary key (customer_id)
);  

CREATE TABLE IF NOT EXISTS items(
    item_code VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10,2),
    company_id VARCHAR(255),
    primary key(item_code)
);

CREATE TABLE IF NOT EXISTS companies(
    company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number INT(12),
    PRIMARY KEY(company_id)
);
