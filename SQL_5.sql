USE logicfirst;

DROP TABLE employee;

DROP TABLE branch;

CREATE TABLE branch(
branch_id INT PRIMARY KEY AUTO_INCREMENT,
br_name VARCHAR(30) NOT NULL,
addr VARCHAR(100)
);

CREATE TABLE employee (
emp_id INT PRIMARY KEY,
ename VARCHAR(30),
job_desc VARCHAR(20),
salary INT,
branch_id INT,
CONSTRAINT FK_branchId FOREIGN KEY(branch_id) REFERENCES branch(branch_id));

ALTER TABLE employee
DROP FOREIGN KEY FK_branchId;

SELECT * FROM employee;

SHOW INDEX FROM employee;

CREATE INDEX name_index ON  employee(ename);

ALTER TABLE employee
DROP INDEX name_index;

ALTER TABLE employee
ADD INDEX (ename);