<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%=new java.util.Date() %>
<%@ page import="java.io.PrintWriter" %>    
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="log.LogDAO"%>


<%
    Connection conn = LogDAO.getConnection();
    Statement st = conn.createStatement();
    String sql = "select * from error where error_time>SUBDATE(NOW(),INTERVAL 1 day) order by error_time desc";
    ResultSet rs = st.executeQuery(sql);
%>

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
				<% }%>
				</tbody>
			</table>
		</div>
	</div>