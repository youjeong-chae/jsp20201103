<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>lotto</title>
</head>
<body>
<%
java.util.Set<Integer> lotto = new java.util.HashSet<>();
while (lotto.size() < 6) {
  int rand = (int) (Math.random() * 45 + 1);
  lotto.add(rand); 
}
%>
<ul>

	<% for (Integer lottoNum : lotto) { %>
	<li> <%= lottoNum %> </li>
	<%
	};
	%>
</ul>

</body>
</html>