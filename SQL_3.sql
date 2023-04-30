USE logicfirst;

SELECT *
FROM employee
ORDER BY job_desc; 

SELECT job_desc,AVG(salary) FROM employee
GROUP BY job_desc;

SELECT job_desc,COUNT(emp_id) FROM employee
GROUP BY job_desc;

SELECT job_desc,COUNT(emp_id) FROM employee
GROUP BY job_desc
HAVING COUNT(emp_id)>1
ORDER BY job_desc DESC;

-- WHERE filters row
-- HAVING filters Group

SELECT job_desc,COUNT(emp_id) FROM employee
GROUP BY job_desc
HAVING COUNT(emp_id)>1
ORDER BY job_desc DESC;

SELECT job_desc,COUNT(emp_id) FROM employee
WHERE salary > 1500000
GROUP BY job_desc
HAVING COUNT(emp_id)>1
ORDER BY job_desc DESC;