<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="car" class="chap08.Car"></jsp:useBean>
<%
//car.setName("kia");
%>
<jsp:setProperty name="car" property="name" value="kia"></jsp:setProperty>
<jsp:setProperty name="car" property="speed" value="90" />
<%--
 <jsp:setProperty name="car" property="stop" value="false" />
 --%>

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
<%= car.getName() %> <br />
<%= car.getSpeed() %>
</body>
</html>
