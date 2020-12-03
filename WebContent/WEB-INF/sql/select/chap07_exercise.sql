-- 189p SCOTT와 동일한 부서에서 근무하는 사원 출력하기
SELECT ename, dno
FROM employee 
WHERE dno = (SELECT dno
                FROM employee 
                WHERE ename='SCOTT');

-- 190p 최소 급여를 받는 사원의 이름, 담당 업무, 급여 출력하기
SELECT ename, JOB, salary
FROM employee
WHERE salary = (SELECT MIN(salary)
                FROM employee);
                
-- 190p 메일 쿼리에 HAVING 절 사용하기
SELECT dno, MIN(salary)
FROM employee 
GROUP BY dno
HAVING MIN(salary) > (SELECT MIN(salary)
                    FROM employee
                    WHERE dno=30);

-- 192p 다중 행 연산자인 IN 사용하기
SELECT eno, ename
FROM employee
WHERE salary IN (SELECT MIN(salary)
                FROM employee
                GROUP BY dno);

-- 193p ANY 연산자 사용하기
SELECT eno, ename, JOB, salary
FROM employee
WHERE salary < ANY (SELECT salary
                    FROM employee
                    WHERE JOB='SALESMAN')
AND JOB <> 'SALESMAN';

-- 194p ALL 연산자 사용하기
SELECT eno, ename, JOB, salary
FROM employee
WHERE salary < ALL (SELECT salary
                    FROM employee
                    WHERE JOB='SALESMAN')
AND JOB <> 'SALESMAN';