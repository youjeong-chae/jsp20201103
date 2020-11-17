-- ȥ���غ���
-- 1. �޿� $300 �λ��ϱ�
SELECT ename, salary, salary + 300 from employee; 

-- 2. �Ѽ��� ��(������ ���� �ͺ��� �۾�������)
SELECT ename, salary, salary*12+100 from employee ORDER BY salary*12+100 DESC;

--3. �޿� ��(�޿��� ���� �ͺ��� �۾�������)
SELECT ename, salary from employee WHERE salary > 2000 ORDER BY salary DESC;

--4. �����ȣ�� 7788�� ��� ����ϱ�
SELECT ename, dno FROM employee WHERE eno = 7788;

--5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ��� ����ϱ�
SELECT ename, salary FROM employee WHERE salary NOT BETWEEN 2000 AND 3000;

--6.1981�� 2�� 20�Ϻ��� 1981�� 5�� 1�� ���̿� �Ի��� ��� ����ϱ�
SELECT ename, job, hiredate FROM employee WHERE hiredate BETWEEN '81/02/20' and '8/05/01';  

--7. �μ� 20 �� 30�� ���� ��� ����ϱ�
SELECT ename, dno FROM employee WHERE dno IN(20, 30) ORDER BY ename;

--8. �޿��� 2000���� 3000 ���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ��� ����ϱ�
SELECT ename, salary, dno FROM employee WHERE salary BETWEEN 2000 and 3000 and dno IN(20, 30) ORDER BY ename;

--9. 1981�⵵�� �Ի��� ��� ����ϱ�
SELECT ename, hiredate FROM employee WHERE hiredate LIKE '81%';

--10. �����ڰ� ���� ��� ����ϱ�
SELECT ename, job FROM employee WHERE manager is null;

--11. Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ��� ����ϱ�
SELECT ename, salary, commission FROM employee WHERE commission is not null ORDER BY salary, commission;

--12. �̸��� �� ���� ���ڰ� R�� ��� ���
SELECT ename FROM employee WHERE ename LIKE '__R%';

--13. �̸��� A�� E�� ��� �����ϰ� �ִ� ��� ���
SELECT ename FROM employee WHERE ename LIKE '%A%' and ename like '%E%';

--14. �繫�� �Ǵ� ��������̸鼭 �޿��� $1600, $950 �Ǵ� $1300�� �ƴ� ��� ��� 
SELECT ename, job, salary FROM employee WHERE job IN('CLERK', 'SALESMAN') and salary NOT IN(1600, 950, 1300); 

--15. Ŀ�̼��� $500 �̻��� ��� ���
SELECT ename, salary, commission FROM employee WHERE commission>=500;
