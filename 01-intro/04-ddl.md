# DATA DEFINITION LANGUAGE (DDL)

SQL's syntax comprises several types of statements that allow you to perform various commands and operations. 

A Data Definition Language is:

- a **SYNTAX**. 
- a set of statements that allow the user to define or modify data structures and objects, such as tables. 

- CREATE
- ALTER
- DROP

**Commands** : 

1. CREATE statement

Used for creating entire database and database objects as tables. 

```
    CREATE object_type object_name;
```

```
    CREATE TABLE object_name(column_name data_type);
```

2. ALTER statement

Used when altering existing objects. 

- ADD
- REMOVE 
- RENAME

```
    ALTER TABLE column
    ADD COLUMN column_name data_type;
```

3. DROP statement

Used for deleting a database objects. 

```
    DROP object_type object_name
```
```
    DROP TABLE customers;
```

4. RENAME statement

Allows you to rename an object. 

```
    RENAME object_type object_name TO new_object_name
```

```
    RENAME TABLE customers TO customer_data;
```

5. TRUNCATE statement

It **removes its data** and continue to have the table as an object in the database. 
 



