USE logicfirst;

SELECT * FROM branch;

DELIMITER $$
CREATE PROCEDURE GetState(
IN id INT
)
BEGIN
    IF id=1 OR id=2 THEN                -- IF checks the condition THEN is MUST
        SELECT 'Tamil Nadu';            -- Prints the Value
    ELSEIF id=3 THEN                    -- ELSEIF
        SELECT 'Maharashtra';
    ELSE
        SELECT 'Andra Pradesh';
    END IF;                             -- END IF // ends the if statement
END$$
DELIMITER ;

CALL GetState(4);

DELIMITER $$
CREATE PROCEDURE GetState2(
    IN id INT
)
BEGIN
    CASE id                             -- Switch case
        WHEN 3 THEN                     -- WHEN // checks the conditions
            SELECT 'Maharashtra';
        WHEN 4 THEN
            SELECT 'Andra pradesh';
        ELSE
            SELECT 'Tamil Nadu';
    END CASE;                           -- END CASE // Ends the case
END$$
DELIMITER ;

CALL GetState2(3);