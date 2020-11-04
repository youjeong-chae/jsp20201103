<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
gugudan  : <%= request.getParameter("gugudan") %> <br />

for(int i = 1; i <= 9; i++) {

<% String gugudan = request.getParameter("gugudan");
int gugu = 0;
if(gugudan != null) {
	gugu = Integer.valueOf(gugudan);
}
%>

<!-- a.btn.btn-secondary -->
<a href="requestEx5Form.jsp" class="btn btn-secondary">뒤로</a>
</body>
</html>