-- CREATING TABLE 
SHOW TABLES;

DESC sales;
DESC customers;
CREATE TABLE IF NOT EXISTS sales(
    purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    date_of_purchase DATE NOT NULL, 
    customer_id INT, 
    item_code VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS customers(
    customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT
);

SELECT * FROM customers;
SELECT * FROM udemy_365career.customers;



