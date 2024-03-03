# FUnctions Issues 

Message: 
```
This function has none of DETERMINISTIC, NO SQL, or READS SQL DATA in its declaration and binary logging is enabled 
```

## Solution

```
SET GLOBAL log_bin_trust_function_creators = 1;
SET @@global.log_bin_trust_function_creators := 1;
```
On `mysql.ini` config. 
```
log_bin_trust_function_creators = 1;
```

Link:
```
https://stackoverflow.com/questions/26015160/deterministic-no-sql-or-reads-sql-data-in-its-declaration-and-binary-logging-i
```