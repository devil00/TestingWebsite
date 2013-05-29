<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attempt Type 1 Question</title>
<script type="text/javascript" src="Javascripts/timer.js"></script>

<style type="text/css">
.container{
    position:relative;
    margin:0px;
    width:800px;
	 height:500px;	
	 left:100px;
}

#main{
		position:absolute;
		top:20px;
		left:300px;;
	}	
#header{
        margin:0px;
		padding:2px;
		position:absolute;
		right:20px
}
</style>

</head>
<body onload="begintimer()">
<div class="container">

<div id="header"><form name="form1"><input id= "ticker" type="text" name="ticker"  disabled="true" readonly="true"/></form></div>

<div id="main">
<form name="quizform" action='scorify' method='post'>
<input type="hidden" name="timetaken"  id="ticker1" >
<input type="hidden" name="answers" value="00000000000000000000" size="20">
<input type="hidden" name="qnumber" value="1" size="20">
<% 
  Integer ord= (Integer)session.getAttribute("Qorder"); 
  session.setAttribute("Qorder", ord-1);
  String rej= (String)session.getAttribute("reject"); 
  session.setAttribute("reject", rej+",Type1");
%>

<table class='front' width='100%' border='0' cellspacing="0" cellpadding="1">
<tr>
<th class='front' align='left'>&nbsp;Online QUIZ</th>
</tr>
<tr>
<td class='front' colspan='2'>
<br>
<table><tr><td valign='top'><b>&nbsp;Type1. </td><td valign='top'><b>Which one is the capital of USA?<b></td></tr>
</table><br>
<table border='0'>
<tr><td valign='top'><input type='radio' name='quiz' id='1' value="1" /></td><td><label for='1'>Oslo</label></td></tr>
<tr><td valign='top'><input type='radio' name='quiz' id='2' value="2" /></td><td><label for='2'>Washington</label></td></tr>
<tr><td valign='top'><input type='radio' name='quiz' id='4' value="4" /></td><td><label for='4'>New York</label></td></tr>
<tr><td valign='top'><input type='radio' name='quiz' id='3' value="3" /></td><td><label for='3'>London</label></td></tr>
</table>
<br>
&nbsp;<input type='submit' value=' Next '>
<br><br>
</td>
</tr>
<tr>
<th class='front' align='left'>&nbsp;Total 4 questions</th>
</tr></table>
</form>
</div>

</div>
</body>
</html>