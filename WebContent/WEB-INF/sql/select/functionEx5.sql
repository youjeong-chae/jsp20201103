SELECT * FROM employee;
SELECT ename, salary, commission, salary + commission as sum
FROM employee;
SELECT ename, commission, NVL(commission, 0) FROM employee;

SELECT ename, salary, commission,
       NVL(commission, 0),
       salary*12 + NVL(commission, 0)
FROM employee
ORDER BY job;

SELECT ename, commission, NVL2(commission, commission, 0)
FROM employee;

SELECT nullif('a', 'a') from dual;
SELECT nullif('a', 'b') from dual;


SELECT COALESCE('a', 'b', null, 'c') FROM dual;
SELECT COALESCE(null, 'b', null, 'c') FROM dual;
SELECT COALESCE(null, null, 'd', 'c') FROM dual;

SELECT ename, salary, commission, COALESCE(commission, salary, 0)
FROM employee
ORDER BY job;


SELECT ename, dno, DECODE(dno, 10, 'ACC', 20, 'RES', 'DEF')
FROM employee;

SELECT ename, salary, CASE WHEN salary >= 3000 THEN 'HIGH'
                           WHEN salary >= 0 THEN 'LOW'
                           ELSE '0'
                      END
FROM employee;
                         