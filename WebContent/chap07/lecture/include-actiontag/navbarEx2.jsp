<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<h1>navbarex2</h1>

request 참조 값 : <%= System.identityHashCode(request) %>

<br />
<%= request instanceof HttpServletRequest %>
<br />
<%= request instanceof ServletRequestWrapper %>
<br />

<%
Object original =((ServletRequestWrapper) request).getRequest();
out.print(System.identityHashCode(original));
%>
