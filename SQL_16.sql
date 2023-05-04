-- CURSORS

USE logicfirst;

SELECT * FROM employee;
SELECT * FROM employee_backup;

CREATE TABLE employee_backup(                                                               -- a backup table for employee using cursor
    emp_id INT PRIMARY KEY,
    ename VARCHAR(30),
    job_desc VARCHAR(20),
    salary INT,
    branch_id INT,
    CONSTRAINT FK_branchId_backup FOREIGN KEY(branch_id) REFERENCES branch(branch_id)
);

DELIMITER $$
CREATE PROCEDURE backupEmployee()
BEGIN
    DECLARE DONE INT DEFAULT 0;                                                             --  a Switch like variable if it is 0 then continues loop
    DECLARE id,salary,brid INT;                                                             -- Variables which matches the original column values
    DECLARE ename,jdesc VARCHAR(30);
    DECLARE cur cursor for SELECT * FROM employee;                                          -- DECLARING CURSOR with a name followed by the query  // IMPORTANT
    DECLARE EXIT HANDLER FOR NOT FOUND SET DONE = 1;                                        -- Handler to loop until there is no element to loop   // IMPORTANT if loop is used
    DELETE FROM employee_backup;                                                            -- DELETE if any previous elements are present in the backup_employee table
    OPEN cur;                                                                               -- OPENS the cursor to execute // IMPORTANT
    cursorloop:LOOP                                                                         -- Loop name
    IF DONE=1 THEN                                                                          -- Checks if loop needs to be terminated
        LEAVE cursorloop;
    end if;
    FETCH cur INTO id,ename,jdesc,salary,brid;                                              -- Column Identification for backup_employee
    INSERT INTO employee_backup                                                             -- Inserts the Data one row at a time in same order
        VALUES (id,ename,jdesc,salary,brid);
    END LOOP;
    CLOSE cur;                                                                              -- Closing the cursor
END$$
DELIMITER ;

CALL backupEmployee();