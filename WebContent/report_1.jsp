<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.ConnectionUtils"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Progress Card</title>
</head>
<body bgcolor= "#F0FFFF">
<div class="container" style="position: relative;width:600px;height:500px">
<div id="head" style="position: absolute;left:300px;"> <p style="font-family: fantasy;font-size:x-large; ">Total score in each questions</p> </div>
<div id="host" style="position: absolute;left:300px;width:400px;height: 300px;top:100px;">
<table border="2" style="border-color: olive;">
	<caption>Question-wise Score</caption>
	<thead >
	<tr style=""bgcolor="blue"><th>Question Type</th> <th>Score</th></tr></thead>
	<tbody >

<% Connection conn = ConnectionUtils.getConnection(); 
int userId = (Integer)session.getAttribute("userId");
String sql= "select * from exam where id= ?";
PreparedStatement stmt =conn.prepareStatement(sql); 
stmt.setInt(1, userId);
ResultSet rst =stmt.executeQuery();
while(rst.next()){
%>
	<tr><td>Type1</td><td><%= rst.getFloat("T1_score") %></td></tr>
	<tr><td>Type2</td><td><%= rst.getFloat("T2_score") %></td></tr>
	<tr><td>Type3</td><td><%= rst.getFloat("T3_score") %></td></tr>
	<tr><td>Type4</td><td><%= rst.getFloat("T4_score") %></td></tr>
	<tr style="font-family: sans-serif;font-size: large;"><td>Total</td><td><%= (rst.getFloat("T4_score")+rst.getFloat("T3_score")+rst.getFloat("T2_score")+rst.getFloat("T1_score")) %></td></tr>
	<%} %>
	</tbody>
	</table>
</div>
<div id="footer" style="position: absolute;width:200px;height:50px;right:-2px;bottom:20px;"><a href="report.jsp"><span>Check More Reports</span></a></div>
</div>
</body>
</html>