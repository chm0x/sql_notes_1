# ROLLBACK AND COMMIT ISSUES EITHER WORKBENCH OR TERMINAL

## SOLUTION

```
SET @@session.autocommit = 0;
SET autocommit = 0;
SET autocommit = OFF;
```