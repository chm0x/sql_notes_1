-- GROUP BY

/*
    Results can be grouped according to a specific field or fields. 

    ORDER:

        SELECT column_name(s) 
        FROM table_name
        WHERE conditions
        GROUP BY column_name(s)
        ORDER BY column_name(s)


    In most cases, when you need an aggregate function, you must 
    add a GROUP BY clause in your query, too.

    Rule(s):

        - Always include the field you have grouped your results by
        in the SELECT statement. 
*/
SELECT first_name FROM employees
GROUP BY first_name;

SELECT first_name, COUNT(first_name) FROM employees
GROUP BY first_name
LIMIT 30;
