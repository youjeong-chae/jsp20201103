<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
request.setAttribute("name", "최범균");
%>

<!DOCTYPE html>
<html>
<head>

</head>
<body>
요청 URI : ${pageContext.request } <br />
request의 name 속성: ${requestScope.name } <br />
code 파라미터 : ${param.code } <br />

<%= request.getParameter("code") %> <br />
</body>
</html>