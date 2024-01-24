# DATA MANIPULATION LANGUAGE (DML)

Its statements allows us to manipulate the data in the tables of a database. 

Commands are:

1. SELECT statement

Used to retrieve data from database objects, like tables. 

```
    SELECT * FROM table_name;
```

2. INSERT statement

Used to insert data into tables.

```
    INSERT ... INTO table_name VALUES(...),(...);
```

3. UPDATE statement

Allows you to renew existing data of your tables.

```
    UPDATE table_name SET column_name = new_value
    WHERE condition;
```

4. DELETE statement

Functions similary to the TRUNCATE statement. 

**TRUNCATE vs DELETE**

TRUNCATE allows us to remove all the records contained in a table. 

With DELETE, you can specify precisely what you would like to be removed. 

```
    -- Removing all records.
    DELETE FROM table_name;

    -- With conditions
    DELETE FROM table_name
    WHERE column_name = value;
```

