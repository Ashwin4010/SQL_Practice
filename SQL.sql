USE logicfirst;

CREATE TABLE employee(
emp_id INT PRIMARY KEY, -- primary key unique
ename VARCHAR(30),
job_desc VARCHAR(30),
salary INT
);

INSERT INTO employee VALUES(1,'Ram','ADMIN',1000000);
INSERT INTO employee VALUES(2,'Harini','MANAGER',2500000);
INSERT INTO employee VALUES(3,'George','SALES',2000000);
INSERT INTO employee VALUES(4,'Ramya','SALES',1300000);
INSERT INTO employee VALUES(5,'Meena','HR',2000000);
INSERT INTO employee VALUES(6,'Ashok','MANAGER',3000000);
INSERT INTO employee VALUES(7,'Abdul','HR',2000000);
INSERT INTO employee VALUES(8,'Ramya','ENGINEER',1000000);
INSERT INTO employee VALUES(9,'Raghu','CEO',8000000);
INSERT INTO employee VALUES(10,'Arvind','MANAGER',2800000);
INSERT INTO employee VALUES(11,'Akshay','ENGINEER',1000000);
INSERT INTO employee VALUES(12,'John','ADMIN',2200000);
INSERT INTO employee VALUES(13,'Abinaya','ENGINEER',2100000);

SELECT * FROM employee WHERE ename<>"Ramya"; -- <> is NOT equal to

SELECT * FROM employee 
WHERE salary<2600000 AND job_desc="MANAGER"; 

SELECT * FROM employee 
WHERE job_desc IN ("HR","SALES");  -- shows everyone with HR or sales or both

SELECT * FROM employee
WHERE job_desc NOT IN ("HR","SALES"); -- Shows everyone wxcept HR and SALES 

SELECT * FROM employee
WHERE salary BETWEEN 2000000 AND 3000000;  -- shows values between range specified

SELECT * FROM employee  
LIMIT 5;   -- limits the number of rows shown in the output

SELECT * FROM employee
WHERE ename LIKE '%i%';  -- LIKE( selects the pattern ) %(zero or more characters) __(one character)

SELECT * FROM employee
WHERE ename LIKE '__I%';  -- Selects if "I" is present at third location 

SELECT * FROM employee
WHERE ename LIKE '__I\%';  -- \(escape character)  searches for % in table

UPDATE employee
SET job_desc="ANALYST" WHERE job_desc="ENGINEER";

DELETE FROM employee
WHERE emp_id=12;

SELECT DISTINCT job_desc
FROM employee;

-- order by

SELECT * FROM employee
ORDER BY salary;

SELECT * FROM employee
ORDER BY salary DESC;  -- Descending order

SELECT * FROM employee
ORDER BY salary,ename; -- sorts by salary(first) and sorts by name(second)

SELECT * FROM employee
WHERE job_desc="MANAGER"  -- selects manager and sorts by salary in descending order
ORDER BY salary DESC;

SELECT * FROM employee
ORDER BY (CASE job_desc
WHEN 'CEO' THEN 1
WHEN 'MANAGER' THEN 2            -- CASE is used for giving specif sort priorities
WHEN 'HR' THEN 3
WHEN 'ANALYST' THEN 4
WHEN 'SALES' THEN 5
ELSE 100 END                     -- ELSE is used with CASE(used to sort other elements that aren't specified in the CASE)
),ename;

