# DATA CONTROL LANGUAGE

There are two statements: GRANT and REVOKE. 

1. GRANT & REVOKE statements

Allow us to manage the rights users have in a database. 

2. GRANT statement

Gives (or grant) certain permissions to users. 

One can grant a **specific type of permission**, like *complete* or *partial access*

These rights will be assigned to a person who has a *username* registered at the 
*Local server*('localhost': IP 127.0.0.1)

```
    GRANT type_of_permission ON database_name.table_name 
    TO 'username'@'localhost';
```

```
    CREATE USER 'name'@'localhost' IDENTIFIED BY 'pass';
```

```
    -- Only SELECT to a user. 
    GRANT SELECT ON database_name.table_name TO 'user'@'localhost';

    -- Grant ALL
    GRANT ALL ON database_name.* TO 'user'@'localhost';
```

3. REVOKE clause

Used to revoke permissions and privileges of database users. 

```
    REVOKE type_of_permission ON database_name.table_name 
    FROM 'username'@'localhost';
```

## DATABASE ADMINISTRATOR

People who have the complete rights to a database.

They can grant access to users and can revoke it. 



