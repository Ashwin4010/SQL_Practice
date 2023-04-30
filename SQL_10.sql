USE logicfirst;
DROP PROCEDURE IF EXISTS getbranches;
SELECT * FROM branch;

DELIMITER $$   -- changes the ending symbol from ; to //
CREATE PROCEDURE getbranches()
BEGIN
	SELECT * FROM branch;  -- Delimiter is used to prevent 
END$$
DELIMITER ;

SHOW CREATE PROCEDURE getbranches;

CALL getbranches();

-- DROP PROCEDURE IF EXISTS getbranches;

-- VARIABLE
SELECT COUNT(emp_id) FROM employee;

DROP procedure IF EXISTS employeecount;

DELIMITER $$
CREATE PROCEDURE employeecount(
				IN jdesc varchar(10),      -- copies the value of the input parameter passed ('Admin)
				OUT total INT)				-- output parameter doesn't copy output values from parameter
BEGIN
    		-- set the default value to 0 instead of null
	SELECT COUNT(emp_id)		  -- Query which returns the value which again stored under total variable
	    INTO total
    FROM employee
	WHERE job_desc=jdesc;			 -- ## IMPORTANT ## Shows the value in the variable or else shows nothing when the procedure is called.
END$$
DELIMITER ;

CALL employeecount;

SET @total = 10;
CALL employeecount('ADMIN',@total);-- @varname is a session variable(@ is must) is used to communicate with procedure to get output, it can be accessed throughout the session
SELECT @total;
CALL employeecount('CEO',@total);
SELECT @total;
/*
PARAMETERS TYPE

IN      -- for giving input to the procedure
OUT     -- for Output from procedure
INOUT   -- for both input and output to the procedure
*/

DELIMITER $$
CREATE PROCEDURE IncrCounter(
INOUT counter INT,
IN incr INT
)			-- output parameter doesn't copy output values from parameter
BEGIN
	SET counter=counter+incr;				 -- ## IMPORTANT ## Shows the value in the variable or else shows nothing when the procedure is called.
END$$
DELIMITER ;

SET @counter=5;
CALL IncrCounter(@counter,2);  	-- @counter is a INOUT variable it is both input and output
SELECT @counter;
CALL IncrCounter(@counter,3);
SELECT @counter;