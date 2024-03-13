# MYSQL WINDOW FUNCTIONS

They are an advanced SQL tool performing a calculation for every record in the data set, using other records associated with the specified one from the table.

*Data set* is an entire table from a database or a part of a table or a result set obtained by using tools such as join. 

*every record in the data set* also know **the current row**.

In other words, using **Window Functions** is similar yet not identical to using Aggregate Functions. 


There are two main types of window functions 

1. Aggregate Window Functions.
2. NonAggregate Window Functions. 
    1. Ranking Window Functions. 
    2. Value Window Functions. 

Syntax:
```
ROW_NUMBER(); <-Window Function is a RANKING NUMBER FUNCTION
```


## WINDOW SPECIFICATION

WINDOW SPECIFICATION: | ACTION:|
---|---|
None = an empty OVER clause | ROW_NUMBER() will perform the relevant evaluations on ALL QUERY ROWS. |
Containing PARTITION BY column_name | The data will be organized into partitions. | 
Containing ORDER BY | Arrange the values (in a ascending or descending order) |
--- | --- |




