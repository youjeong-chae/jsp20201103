-- 144
SELECT SUM(salary) AS "�޿��Ѿ�",
       AVG(salary) AS "�޿����",
       MAX(salary) AS "�ִ�޿�",
       MIN(salary) AS "�ּұ޿�"
FROM employee;

SELECT MAX(hiredate), 
       MIN(hiredate)
FROM employee;

SELECT SUM(commission) AS "Ŀ�̼� �Ѿ�"
FROM employee;

c