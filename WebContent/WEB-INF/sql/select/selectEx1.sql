SELECT * FROM employee;
SELECT * FROM bonus;
SELECT * FROM department;
SELECT * FROM salgrade;

SELECT  ename FROM employee;
SELECT  eno, ename FROM employee;
SELECT  ename, eno  FROM employee;
SELECT  ename, salary FROM employee;
SELECT  ename, salary, salary * 12 FROM employee; 
SELECT  ename, salary / 100 FROM employee;
SELECT  ename, salary + 100 FROM employee;
SELECT  ename, salary - 100 FROM employee; 
SELECT  ename, salary, salary*12 AS 연봉 FROM employee;
SELECT  ename, salary, salary*12 연봉 FROM employee;
--  한 줄 주석
/*
    여러줄 주석
*/
SELECT * FROM employee;
SELECT ename, salary, commission, salary + commission FROM employee;
SELECT ename, salary, commission, NVL(commission, 0) FROM employee;
SELECT ename, salary + NVL(commission, 0) FROM employee;
SELECT ename, salary + NVL(commission, 0) 합 FROM employee;

SELECT distinct(dno) FROM employee;
SELECT 
  distinct dno 
FROM employee;

select 
  distinct DNO 
from EMPLOYEE;

/*
SELECT [DISTINCT] {*|column[alia]...}
*/