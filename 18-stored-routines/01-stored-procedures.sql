-- STORED PROCEDURES

/*
    SYNTAX:
        DELIMITER $$
        CREATE PROCEDURE procedure_name(parameters_1, parameters_2,...,parameters_n)
        BEGIN
            SELECT * FROM  employees        <-- Body of the procedure
            LIMIT 20;
        END$$
*/