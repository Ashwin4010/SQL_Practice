-- ERROR HANDLING USING SIGNAL

USE logicfirst;

SELECT * FROM branch;

DROP PROCEDURE IF EXISTS insertBranchWithCustomError;

DELIMITER $$
CREATE PROCEDURE insertBranchWithCustomError(
    IN id INT,
    IN bname VARCHAR(50),
    IN baddr VARCHAR(50)
)
BEGIN
    DECLARE CONTINUE HANDLER FOR 1062
       -- RESIGNAL SET MESSAGE_TEXT = 'Duplicate key';
        BEGIN
            SELECT CONCAT('Duplicate ID',id,' cannot be inserted');
        END;
    IF CHAR_LENGTH(bname)<4 THEN
        signal sqlstate '45000'
        SET MESSAGE_TEXT ='branch name too short';
    end if;
    INSERT INTO branch VALUES (
                              id,
                              bname,
                              baddr
                          );

    SELECT * FROM branch;

END$$
DELIMITER ;

CALL insertBranchWithCustomError(4,'mad','XYZ')