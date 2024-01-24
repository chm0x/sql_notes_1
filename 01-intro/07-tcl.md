# TRANSACTION CONTROL LANGUAGE

Not every change you make to a database is saved automatically. 

1. COMMIT statement


Related to INSERT, DELETE, and UPDATE statements. 

Saves the transaction in the database. 
Commit will save the changes you've made. 

Changes cannot be undone. 

And will let other users have access to the modified version of the database. 

Committed states can accrue. For DBA, these are very used in many times to save the data and the past data. 


```
    -- Example, as DBA.

    UPDATE customers
    SET last_name = 'Johnson'
    WHERE customer_id = 4
    COMMIT;
```

2. ROLLBACK clause

It will let you make a step back. 

Allows us to **UNDO** any changes you have made but don't want to be saved permanently. 

```
    -- Example, as DBA.

    UPDATE customers
    SET last_name = 'Johnson'
    WHERE customer_id = 4
    COMMIT;

    ROLLBACK;
```