USE logicfirst;

DROP TABLE employee;

CREATE TABLE employee(
emp_id INT PRIMARY KEY AUTO_INCREMENT,
ename VARCHAR(30) NOT NULL,
job_desc VARCHAR(30) DEFAULT 'unassigned',
salary INT,
PAN VARCHAR(10) UNIQUE,
CHECK (salary>100000));

INSERT INTO employee(ename,salary) 
VALUES ("Ramya",300000);

SELECT * FROM employee;

CREATE TABLE employee (
emp_id INT PRIMARY KEY,
ename VARCHAR(30),
job_desc VARCHAR(20),
salary INT );

-- ADD not null constraint to ename column
ALTER TABLE employee 
MODIFY ename VARCHAR(30) NOT NULL;

-- DROP not null constraint from ename column
ALTER TABLE employee 
MODIFY ename VARCHAR(30);

-- ADD default constraint
ALTER TABLE employee
ALTER job_desc SET DEFAULT 'Unassigned';

-- DROP default constraint
ALTER TABLE employee
ALTER job_desc DROP DEFAULT;

-- ADD check constraint
ALTER TABLE employee
ADD CONSTRAINT chk_salary CHECK (salary>100000);

-- DROP check constraint
ALTER TABLE employee
DROP CHECK chk_salary;


