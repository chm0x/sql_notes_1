-- FOREIGN KEYS 

/*
    points to a column of another table and links the two tables. 
*/
SHOW TABLES;

Drop table sales;
DESC sales;



CREATE TABLE IF NOT EXISTS sales(
    purchase_number INT NOT NULL AUTO_INCREMENT, 
    date_of_purchase DATE NOT NULL, 
    customer_id INT, 
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY(purchase_number),
    FOREIGN KEY(customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE
);

/*
    ON DELETE CASCADE

    If a specific value from the parent table's primary key has been deleted, 
    all the records from the child table referring to this value will be removed as well. 
*/

-- 3 OPTIONS for update the table 
-- 1. drop table 
-- 2. Alter table
-- 3. WITH Workbench UI.

ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

-- DROP FOREIGN KEY with ALTER
ALTER TABLE sales
DROP FOREIGN KEY sales_ibfk_1;

-- NEXT LESSON
DROP TABLE sales, customers, items, companies;