USE logicfirst;

SELECT * FROM branch;

DROP PROCEDURE IF EXISTS insertBranch;

DELIMITER $$
CREATE PROCEDURE insertBranch(
    IN id INT,
    IN bname VARCHAR(50),
    IN baddr VARCHAR(50)
)
BEGIN
INSERT INTO branch VALUES (
                              id,
                              bname,
                              baddr
                          );

SELECT * FROM branch;

END$$
DELIMITER ;