<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="chap14.*" %>

<% request.setCharacterEncoding("utf-8"); %>
<%
String eno = request.getParameter("eno");
String sql = "SELECT e.eno, e.ename, e.job, m.ename " 
           + " , e.hiredate, e.salary, d.dname, s.grade "
           + "FROM employee e, employee m, department d, salgrade s "
           + "WHERE e.manager = m.eno(+)" 
           + " AND e.dno = d.dno "
           + " AND e.salary BETWEEN s.losal AND s.hisal "
           + " AND e.eno = ?";
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String id = "c##mydbms";
String pw = "admin";
Connection con = DriverManager.getConnection(url, id, pw);
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, Integer.valueOf(eno));
ResultSet rs = pstmt.executeQuery();
Employee emp = null;
if (rs.next()) {
  int col = 1;
  emp = new Employee();
  emp.setEno(rs.getInt(col++));
  emp.setEname(rs.getString(col++));
  emp.setJob(rs.getString(col++));
  emp.setManagerName(rs.getString(col++));
  emp.setHireDate(rs.getTimestamp(col++).toLocalDateTime());
  emp.setSalary(rs.getInt(col++));
  emp.setDname(rs.getString(col++));
  emp.setGrade(rs.getInt(col++));
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h1>사원정보</h1>
  <ul>
    <li>사번 : <%= emp.getEno() %></li>
    <li>이름 : <%= emp.getEname() %></li>
    <li>업무 : <%= emp.getJob() %></li>
    <li>입사일 : <%= emp.getHireDate() %></li>
    <li>매니저 : <%= emp.getManagerName() %></li>
    <li>월급 : <%= emp.getSalary() %></li>
    <li>등급 : <%= emp.getGrade() %></li>
    <li>부서 : <%= emp.getDname() %></li>
  </ul>
</div>

</body>
</html>