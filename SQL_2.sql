USE logicfirst;

-- Function - performs a specific task
-- Aggregate functions

SELECT * FROM employee;

SELECT COUNT(*) total  -- COUNTS the number of rows (if wanted any any other name instead of COUNT in output use it after the COUNT (e.g COUNT total shows toa
FROM employee;

SELECT count(*) no_of_managers FROM employee  -- counting number of manager and showing it as no_of_manager
WHERE job_desc="MANAGER";

SELECT AVG(salary) FROM employee     -- Average of salary
WHERE job_desc="MANAGER";

SELECT SUM(salary) FROM employee  -- SUM of salary
WHERE job_desc="ANALYST";

SELECT MAX(salary) FROM employee;   -- MAX salary

SELECT MIN(salary) FROM employee;   -- MIN salary

-- String Functions

SELECT ucase(ename) name ,salary FROM employee;  -- uppercase name and alias "name"

SELECT ename, char_length(ename) char_count FROM employee;  -- counting character length

SELECT ename,CONCAT('RS.',salary)         -- CONCAT(used to add characters in the specified table without modifing it)
FROM employee;

SELECT ename,CONCAT('RS.',FORMAT(salary,0)) salary  -- FORMAT used for comma seperated vales (only numbers) '0' represents digit to round off. 
FROM employee;

SELECT ename,LEFT(job_desc,3)  -- LEFT(column_name,3) selects first 3 letter of the row
FROM employee;

-- Date Function

ALTER TABLE employee ADD COLUMN Hire_date DATE;   -- adds DATE datatype default(YYYY-MM-DD)

SELECT * FROM employee;

UPDATE employee
SET Hire_date="2014-07-23";

UPDATE employee
SET Hire_date="2015-07-20"
WHERE job_desc="ANALYST";

SELECT * FROM employee;

SELECT NOW();

SELECT DATE (NOW());

SELECT CURDATE();

SELECT date_format(CURDATE(),"%D/%M/%Y") AS date;  -- changes date format show %D %d for date(alphabetic and digit format)

SELECT DATEDIFF(CURDATE(),"2021/02/03") AS days;   -- Shows how many days difference between given dates

SELECT date_add(curdate(),INTERVAL 1 WEEK) AS 'After one WEEK';