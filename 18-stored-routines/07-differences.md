# Differences


## Technical Differences

Stored Procedure | User-defined function | 
---|---|
Does not return a value | returns a value |
CALL procedure | SELECT function | 
--- | --- | 

## Conceptual Differences

Stored Procedure | User-defined function | 
---|---|
Can have multiple OUT parameters. | Can return a single value only. | 
Can use INSERT, UPDATE, DELETE statement | It cannot. |
Including a proc in SELECT is impossible. | You can easily include a function as one of the columns inside a SELECT statement as show the 'function_on_select.png' image  |
---|---|

