 SELECT * FROM employee;
 SELECT * FROM salgrade;
 
 SELECT * FROM employee e, salgrade s;
 SELECT * FROM employee e, salgrade s
 WHERE e.salary BETWEEN s.losal AND s.hisal;
 -- 14, 4, 5
 SELECT * FROM employee e, department d, salgrade s
 WHERE e.dno = d.dno
 AND e.salary BETWEEN s.losal AND s.hisal
 AND e.eno = 7788;
 