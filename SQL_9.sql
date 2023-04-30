USE logicfirst;

SELECT * FROM employee;
SELECT * FROM branch;

-- VIEW
CREATE OR REPLACE VIEW employee_br 
AS 
SELECT 
    e.emp_id,
    e.ename,
    e.job_desc,
    b.br_name
FROM
    employee as e  /* alias */
        INNER JOIN
    branch as b ON e.branch_id = b.branch_id
ORDER BY e.emp_id;

SELECT * FROM employee_br;  -- view employee_br 

DROP VIEW employee_br;

