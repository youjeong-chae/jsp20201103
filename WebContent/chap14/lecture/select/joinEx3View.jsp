<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
String eno = request.getParameter("eno");
String sql = "SELECT e.ename, s.grade " 
           + "FROM employee e, salgrade s "
           + "WHERE e.salary BETWEEN s.losal AND s.hisal "
           + "AND e.eno = ?";
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String id = "c##mydbms";
String pw = "admin";
Connection con = DriverManager.getConnection(url, id, pw);
PreparedStatement stmt = con.prepareStatement(sql);
stmt.setInt(1, Integer.parseInt(eno));
ResultSet rs = stmt.executeQuery();
int salgrade = 0;
String ename = "";
if (rs.next()) {
  ename = rs.getString(1);
  salgrade = rs.getInt(2); 
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
<h1><%= ename %>의 등급은 <%= salgrade %> 입니다.</h1>
</body>
</html>