<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>smart factory 웹 사이트</title>
</head>
<body>
	<%
			session.invalidate(); //세션을 빼앗음
	%>
	<script>
		location.href='login.jsp';
	</script>
</body>
</html>