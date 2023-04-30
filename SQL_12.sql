-- LOOPS
USE logicfirst;

DROP PROCEDURE IF EXISTS LoopDemoIF;
DROP PROCEDURE IF EXISTS LoopDemoWhile;
DROP PROCEDURE IF EXISTS LoopDemoRepeat;

-- IF Loop

DELIMITER $$
CREATE PROCEDURE LoopDemoIF()
BEGIN
    DECLARE i INT;
    DECLARE str varchar(50);
    SET i=1;
    SET str = '';                           -- <name>:LOOP // gives the loop a name
looplabel:LOOP                              -- if loop // use THEN in If loop to give conditions
    IF i>10 THEN
        LEAVE looplabel;                    -- LEAVE // Breaks the loop
    END IF;
    SET str = CONCAT(str,i,' ');
    SET i=i+1;
END LOOP;                                   -- END LOOP // Ends the loop
SELECT str;
END$$
DELIMITER ;

CALL LoopDemoIF;

-- WHILE Loop

DELIMITER $$
CREATE PROCEDURE LoopDemoWhile()
BEGIN
    DECLARE i INT;
    DECLARE str varchar(50);
    SET i=1;
    SET str = '';
    WHILE i<10 DO                       -- WHILE loop // while loop use DO to give conditions
        SET str = CONCAT(str,i,' ');
        SET i = i+1;                    -- END LOOP // Ends the loop
    end while;
    SELECT str;
END$$
DELIMITER ;

CALL LoopDemoWhile;

-- REPEAT loop

DELIMITER $$
CREATE PROCEDURE LoopDemoRepeat()
BEGIN
    DECLARE i INT;
    DECLARE str varchar(50);
    SET i=1;
    SET str = '';
    REPEAT                        -- WHILE loop // while loop use DO to give conditions
        SET str = CONCAT(str,i,' ');
        SET i = i+1;
    UNTIL i>10
    END REPEAT;         -- END LOOP // Ends the loop
    SELECT str;
END$$
DELIMITER ;

CALL LoopDemoRepeat;