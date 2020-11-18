-- 혼자해보기
-- 1. 입사년도와 달 출력하기
SELECT SUBSTR(hiredate, 1, 2) 년도,
       SUBSTR(hiredate, 4, 2) 달
FROM employee;

-- 2. 4월에 입사한 사원 출력
SELECT * FROM employee WHERE SUBSTR(hiredate, 4, 2)='04';

-- 3. 사번이 짝수인 사원 
SELECT * FROM employee WHERE MOD(eno, 2) = 0;

-- 4. 입사일 
SELECT hiredate, TO_CHAR(hiredate, 'YY/MON/DD DY') FROM employee;

-- 5. 올해 며칠이 지났는지
SELECT TRUNC(SYSDATE-TO_DATE('2020/01/01', 'YYYY/MM/DD')) FROM dual;

-- 6. 상관의 사번
SELECT eno, ename, NVL2(manager, manager, 0) AS MANAGER FROM employee;

-- 7. 급여 인상
SELECT eno, ename, job, salary, 
    DECODE (job, 'ANAIYSY', salary+200,
                 'SALESMAN', salary+180,
                 'MANAGER', salary+150,
                 'CLERK', salary+100,
                 salary) AS update_salary
FROM employee;