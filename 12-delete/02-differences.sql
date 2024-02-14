-- DROP VS TRUNCATE VS DELETE

/*
    DROP 

        - You won't be able to roll back to its initial state, or to the last 
        COMMIT statement.
        - Use DROP TABLE only when you are sure you aren't going to use the 
        table in question anymore. 


    TRUNCATE 

        - Remove all records from the table. 
        - WHen truncating, auto-increment values will be reset. 

    DELETE 

        - Removes Records row by row. 
    
    SQL Optimizer: 

        - TRUNCATE delivers the output much quicker than DELETE. 
        - AUTO_INCREMENT values are not reset with DELETE. 
            
*/