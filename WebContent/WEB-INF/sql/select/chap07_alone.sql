-- 195P 혼자해보기
-- 01
SELECT ename, JOB
FROM employee
WHERE JOB = (SELECT JOB 
             FROM employee 
             WHERE eno = 7788);
             
-- 02
SELECT ename, JOB
FROM employee 
WHERE salary > ANY (SELECT salary 
                   FROM employee
                   WHERE eno = 7499);
                   
-- 03
SELECT ename, JOB, salary
FROM employee
WHERE salary = (SELECT 
                MIN(salary)
                FROM employee);
                
-- 04

