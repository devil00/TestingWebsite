<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Detailed Analysis of Your performance</title>
<script type="text/javascript">
<%--
  function display(){
	<%  float [] params = {(float)1.2,(float)3.4}; %>
	var v = new Array(<%
			for(int i = 0; i < params.length; i++) {
			  out.print(params[i]);
			  if(i+1 < params.length) {
			    out.print(",");
			  }
			}
			%>);
	document.getElementById("one").innerHTML=v[1]; 
	}  
--%>

</script>
<style type="text/css">
ul
{
list-style-type:none;
margin:0;
padding:0;
}
#main a
{
display:block;
width:200px;
}
.container{
position:relative;
left:100px;
top:100px;
height:400px;
width:600px;
}

a:HOVER {
	color:#FF00FF;
}
input[type=submit]:hover
   {
  border: 1px solid buttonface;
  border-top: 1px solid #a0a0a0;
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  }
</style>
</head>
<body >
<!--  <a onclick ="display()">Click Me</a>  
<p id="one"></p>

-->
 <div class="container" style="position: relative;width:400px;height:400px;">
 <div id="main">
 <h1 style="font-family: cursive;font-style: oblique;">Choose the type of report </h1>
 <ul>
 <li><a href="report_1.jsp">Question Wise Score</a></li>
 <li><a href="report_2.jsp">Time spent on each Question</a></li>
 <li><a href="report_3.jsp">Average Score</a></li>
 </ul>
 </div>
 <div id="footer" style="position: absolute;width:200px;height:50px;right:-2px;bottom:20px;"><form action="signout"><input type="submit" value="LogOut" ></form></div>
 </div>

</body>
</html>