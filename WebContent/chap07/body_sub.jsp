<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<br />
name 파라미터 값 목록:
<ul>
<%
String[] names = request.getParameterValues("name");
for (String name : names) {
%>
  <li><%= name %></li>
<%
}
%>
</ul>