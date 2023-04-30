-- FUNCTIONS

USE logicfirst;

SELECT * FROM branch;
SELECT * FROM employee;
DELIMITER $$
CREATE FUNCTION getBranchAddr(id INT)                                           -- FUNCTION declaration with parameter
returns VARCHAR(50)                                                             -- RETURNS <data type> // what kind of output is expected
DETERMINISTIC                                                                   -- DETERMINISTIC // optimises the query, if same value is given again and again it store it in cache. default is NOT DETERMINISTIC
    BEGIN
        DECLARE fulladdress VARCHAR(50);                                        -- Variable declaration // variable to store the output of the function query
        SELECT CONCAT(addr,' ',br_name) INTO fulladdress                        -- Query
        FROM branch
        WHERE branch_id=id;
        RETURN fulladdress;                                                     -- RETURN the variable (stored output of the query)
    END$$
DELIMITER ;

SELECT ename,getBranchAddr(branch_id)
FROM employee;



