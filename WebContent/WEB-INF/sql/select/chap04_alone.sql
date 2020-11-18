-- ȥ���غ���
-- 1. �Ի�⵵�� �� ����ϱ�
SELECT SUBSTR(hiredate, 1, 2) �⵵,
       SUBSTR(hiredate, 4, 2) ��
FROM employee;

-- 2. 4���� �Ի��� ��� ���
SELECT * FROM employee WHERE SUBSTR(hiredate, 4, 2)='04';

-- 3. ����� ¦���� ��� 
SELECT * FROM employee WHERE MOD(eno, 2) = 0;

-- 4. �Ի��� 
SELECT hiredate, TO_CHAR(hiredate, 'YY/MON/DD DY') FROM employee;

-- 5. ���� ��ĥ�� ��������
SELECT TRUNC(SYSDATE-TO_DATE('2020/01/01', 'YYYY/MM/DD')) FROM dual;

-- 6. ����� ���
SELECT eno, ename, NVL2(manager, manager, 0) AS MANAGER FROM employee;

-- 7. �޿� �λ�
SELECT eno, ename, job, salary, 
    DECODE (job, 'ANAIYSY', salary+200,
                 'SALESMAN', salary+180,
                 'MANAGER', salary+150,
                 'CLERK', salary+100,
                 salary) AS update_salary
FROM employee;