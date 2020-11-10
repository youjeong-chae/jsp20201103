<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
Cookie cookie1 = new Cookie("path1", URLEncoder.encode("경로:/chap09/path1", "utf-8"));
cookie1.setPath(request.getContextPath() + "/chap09/path1");
response.addCookie(cookie1);
Cookie cookie2 = new Cookie("path2", URLEncoder.encode("경로:", "utf-8"));
response.addCookie(cookie2);
Cookie cookie3 = new Cookie("path3", URLEncoder.encode("경로:/", "utf-8"));
cookie3.setPath(request.getContextPath() + "/");
response.addCookie(cookie3);
Cookie cookie4 = new Cookie("path4", URLEncoder.encode("경로:/chap09/path2", "utf-8"));
cookie4.setPath(request.getContextPath() + "/chap09/path2");
response.addCookie(cookie4);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>쿠키 경로 지정</title>
</head>
<body>
<%= cookie1.getName() %>=<%= cookie1.getValue() %>[<%= cookie1.getPath() %>] <br />
<%= cookie2.getName() %>=<%= cookie2.getValue() %>[<%= cookie2.getPath() %>] <br />
<%= cookie3.getName() %>=<%= cookie3.getValue() %>[<%= cookie3.getPath() %>] <br />
<%= cookie4.getName() %>=<%= cookie4.getValue() %>[<%= cookie4.getPath() %>] <br />
</body>
</html>
