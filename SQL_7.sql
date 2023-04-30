USE logicfirst;

DROP TABLE IF EXISTS clients;  

CREATE TABLE clients(
client_id INT PRIMARY KEY AUTO_INCREMENT,
location VARCHAR(30) NOT NULL,
addr VARCHAR(60)
);

INSERT INTO clients VALUES(1,"NewYork","25 10th Block");
INSERT INTO clients VALUES(2,"Coimbatore","120 15th Block");
INSERT INTO clients VALUES(3,"London","21 ABC Road");

SELECT * FROM clients;
SELECT * FROM branch;

SELECT * FROM branch  # union removes duplicate rows
UNION
SELECT * FROM clients;

SELECT * FROM clients # UNION ALL doesn't remove duplicate rows
UNION ALL
SELECT * FROM branch;