<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags/lecture" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>절대 경로 사용하여 자원 읽기</title>
</head>
<body>
<%
char[] buff = new char[128];
int len = -1;

String filePath = "C:||apache-tomcat-8.0.21||wdbapps||chap05"+"||message||notice.txt";
try(InputStreamReader fr = new InputStreamReader(
        new FileInputStream(filePath), "UTF-8")) {
    while((len =fr.read(buff)) != -1) {
        out.print(new String(buff, 0, len));
    }
}   catch(IOException ex) {
    out.println("익셉션 발생: "+ex.getMessage());
}

%>


</body>
</html>