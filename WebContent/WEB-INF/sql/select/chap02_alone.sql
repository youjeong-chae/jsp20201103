-- 혼자해보기
-- 1. 급여 $300 인상하기
SELECT ename, salary, salary + 300 from employee; 

-- 2. 총수입 순(수입이 많은 것부터 작아지도록)
SELECT ename, salary, salary*12+100 from employee ORDER BY salary*12+100 DESC;

--3. 급여 순(급여가 많은 것부터 작아지도록)
SELECT ename, salary from employee WHERE salary > 2000 ORDER BY salary DESC;

--4. 사원번호가 7788인 사원 출력하기
SELECT ename, dno FROM employee WHERE eno = 7788;

--5. 급여가 2000에서 3000사이에 포함되지 않는 사원 출력하기
SELECT ename, salary FROM employee WHERE salary NOT BETWEEN 2000 AND 3000;

--6.1981년 2월 20일부터 1981년 5월 1일 사이에 입사한 사원 출력하기
SELECT ename, job, hiredate FROM employee WHERE hiredate BETWEEN '81/02/20' and '8/05/01';  

--7. 부서 20 및 30에 속한 사원 출력하기
SELECT ename, dno FROM employee WHERE dno IN(20, 30) ORDER BY ename;

--8. 급여가 2000에서 3000 사이에 포함되고 부서번호가 20 또는 30인 사원 출력하기
SELECT ename, salary, dno FROM employee WHERE salary BETWEEN 2000 and 3000 and dno IN(20, 30) ORDER BY ename;

--9. 1981년도에 입사한 사원 출력하기
SELECT ename, hiredate FROM employee WHERE hiredate LIKE '81%';

--10. 관리자가 없는 사원 출력하기
SELECT ename, job FROM employee WHERE manager is null;

--11. 커미션을 받을 수 있는 자격이 되는 사원 출력하기
SELECT ename, salary, commission FROM employee WHERE commission is not null ORDER BY salary, commission;

--12. 이름의 세 번재 문자가 R인 사원 출력
SELECT ename FROM employee WHERE ename LIKE '__R%';

--13. 이름에 A와 E를 모두 포함하고 있는 사원 출력
SELECT ename FROM employee WHERE ename LIKE '%A%' and ename like '%E%';

--14. 사무원 또는 영업사원이면서 급여가 $1600, $950 또는 $1300가 아닌 사원 출력 
SELECT ename, job, salary FROM employee WHERE job IN('CLERK', 'SALESMAN') and salary NOT IN(1600, 950, 1300); 

--15. 커미션이 $500 이상인 사원 출력
SELECT ename, salary, commission FROM employee WHERE commission>=500;
