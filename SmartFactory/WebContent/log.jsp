<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="log.LogDAO"%>

<%
    Connection conn = LogDAO.getConnection();
    Statement st = conn.createStatement();
    String sql = "select * from error";
    ResultSet rs = st.executeQuery(sql);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>smart factory 웹 사이트</title>
</head>
<body>
	<%
		String userID=null;
		if(session.getAttribute("userID") != null)
		{
			userID=(String)session.getAttribute("userID");
		}
		int pageNumber =1;
		if(request.getParameter("pageNumber")!=null)
		{
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">Smart Factory 웹 사이트</a>
		</div>
		<div class = "collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class = "nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
			</ul>
			
			<ul class = "nav navbar-nav">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">실시간 체크</a>
					<ul class="dropdown-menu">
                 	    <li><a href="check.jsp">line 1</a></li>
                    	<li><a href="check2.jsp">line 2</a></li>
               		</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">로그 기록</a>
					<ul class="dropdown-menu">
                 	    <li class= "active"><a href="log.jsp">line 1</a></li>
                    	<li><a href="log2.jsp">line 2</a></li>
               		</ul>
				</li>
			</ul>
			
			<%
				if(userID == null) //로그인 안했으면
				{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('로그인 후 이용하실 수 있습니다.')");
					script.println("location.href = 'login.jsp'");
					script.println("</script>");
				}
				else //로그인 돼있으면
				{
			%>	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>		
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
	<h1> 로그 기록</h1>
	<h4> LINE 1</h4><br/>
	</div>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">ID</th>
						<th style="background-color: #eeeeee; text-align: center;">모듈 타입</th>
						<th style="background-color: #eeeeee; text-align: center;">모듈 ID</th>
						<th style="background-color: #eeeeee; text-align: center;">날짜</th>
						<th style="background-color: #eeeeee; text-align: center;">image</th>
					</tr>
				</thead>
				<tbody>
				<%while(rs.next()) //검색된 결과가 존재하면 true
				{
				%>
					<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(5)%></td>
					<td><img src="images/<%=rs.getString(2)%>.jpg" style="width: 200px; height:auto;"></td>
					</tr>
				<% 
				}
				%>
				</tbody>
			</table>
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>