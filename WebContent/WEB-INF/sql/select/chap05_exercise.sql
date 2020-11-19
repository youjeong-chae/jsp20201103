-- 144
SELECT SUM(salary) AS "급여총액",
       AVG(salary) AS "급여평균",
       MAX(salary) AS "최대급여",
       MIN(salary) AS "최소급여"
FROM employee;

SELECT MAX(hiredate), 
       MIN(hiredate)
FROM employee;

SELECT SUM(commission) AS "커미션 총액"
FROM employee;

c