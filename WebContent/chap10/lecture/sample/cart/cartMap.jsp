<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
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

<h1>장바구니 보기 (map)</h1>
<ul>
<%
Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cartMap");
if (cart != null && cart.size() > 0) {
  // loop
  for (Map.Entry<String, Integer> entry : cart.entrySet()) {
%>
    <li><%= entry.getKey() %> : <%= entry.getValue() %></li>
<%  	
  }
} else {
  // 없음 
%>
  <li>비어있음</li>
<%
}
%>
</ul>
</body>
</html>