<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ConnectionUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Progress Card</title>
</head>
<body>
<div style="position: relative;left:150px;width:300px;height:200px;">
<table border="2" style="border-color: olive;">
	<caption>Question-wise Score</caption>
	<thead >
	<tr style=""bgcolor="#ADD8E6"><th>Composite Score</th> <th>Average Score</th></tr></thead>
	<tbody >
<% Connection conn = ConnectionUtils.getConnection(); 
int userId = (Integer)session.getAttribute("userId");
String sql= "select * from exam where id= ?";
PreparedStatement stmt =conn.prepareStatement(sql); 
stmt.setInt(1, userId);
ResultSet rst =stmt.executeQuery();
float avg,total;
if(rst.next()){
total=rst.getFloat("T1_score")+rst.getFloat("T2_score")+rst.getFloat("T3_score")+rst.getFloat("T4_score");
avg=(float)(total+((rst.getFloat("noa")-1)*rst.getFloat("average_score")))/(rst.getFloat("noa"));
%>
<tr style="background-color: olive;"><td><%= total %></td><td><%= avg %></td></tr>
<%} %>
</tbody>
	</table>
	<div id="footer" style="position: absolute;width:200px;height:50px;right:-2px;bottom:20px;"><a href="report.jsp"><span>Check More Reports</span></a></div>
	</div>
</body>
</html>