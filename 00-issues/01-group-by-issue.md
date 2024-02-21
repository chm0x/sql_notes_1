# ISSUES OF GROUP BY

**Query Mode**: 
```
> SELECT @@sql_mode
```

Output:
```
ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION
```

## Solution

1. Terminal
```
# Error
SET 
 @@session.sql_mode='STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

# Yes
SET 
 @@session.sql_mode='STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
```

2. MySQL GUI: Turn the only_full_group_by mode off. 

## SOLUTION 2

```
set @@global.sql_mode := replac(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
```

```
select @@global.sql_mode;
```

**Reason**
```
'The latter signifies the problem of listing fields in the SELECT statement that are not included in the GROUP BY clause.'
```

## REVERT

```
set @@global.sql_mode := concat('ONLY_FULL_GROUP_BY,', @@global.sql_mode);
```
