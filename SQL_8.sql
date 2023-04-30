USE logicfirst;

SELECT * FROM employee;
SELECT * FROM branch;

-- employees from chennai
SELECT * FROM employee
WHERE branch_id=(SELECT branch_id FROM branch WHERE br_name="Chennai");
-- employees with min salary
SELECT * FROM employee
WHERE salary=(SELECT MIN(salary) FROM employee);

-- EXISTS used wit subqueries

SELECT branch_id,br_name
FROM branch
WHERE EXISTS (
SELECT * FROM employee
WHERE job_desc="ADMIN" AND branch.branch_id=employee.branch_id      -- SELECT all COlumns
);


 -- ANY 
 -- branch info in which any employee gerts more than 25L
 SELECT * FROM branch
 WHERE branch_id=ANY(
 SELECT branch_id FROM employee
 WHERE salary>2500000);
 
 -- ALL
 -- employees not working in chennai and coimbatore
 SELECT * FROM employee
 WHERE branch_id <> ALL(
 SELECT branch_id FROM branch 
 WHERE br_name IN ("Chennai","Coimbatore"));