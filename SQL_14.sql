-- ERROR Handling

USE logicfirst;

SELECT * FROM branch;

DROP PROCEDURE IF EXISTS insertBranch;

DELIMITER $$
CREATE PROCEDURE insertBranch(
IN id INT,
IN bname VARCHAR(50),
IN baddr VARCHAR(50)
)
BEGIN                                           -- EXIT // Exits the procedure if error occurs
    DECLARE duplicateInsert CONDITION FOR 1062;
    DECLARE CONTINUE HANDLER FOR duplicateInsert               -- CONTINUE // continues the procedure even if error occurs
        BEGIN                                       -- HANDLER FOR <error code> // if the error code occurs executes the code in BEGIN
            SELECT CONCAT('Duplicate Key',id,'Cannot Insert Key');
        END;
    INSERT INTO branch VALUES (
                               id,
                               bname,
                               baddr
                              );

    SELECT * FROM branch;

END$$
DELIMITER ;

CALL insertBranch(1,'Madurai','20 km Road');