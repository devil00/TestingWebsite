<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attempt type 3 Question</title>
<style type="text/css">
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
#hide{
position:absolute;
width:100px;
height:50px;
top:50px;
}
#que_hide{

position: absolute;
top:150px;
width:600px;
height:400px;
display:none;
}
.container{
    position:relative;
    margin:0px;
    width:800px;
	 height:700px;	
	 left:100px;
}
#infer{
	position: absolute;
	width:500px;
	height:50px;
	top:5px;
}

</style>
<script type="text/javascript" src="Javascripts/timer3.js"></script>
</head>
<body onload="begintimer()">
<div class="container">

<div id="header"><form name="form1"><input id= "ticker" type="text" name="ticker"  disabled="true" readonly="true"/></form></div>

<div id="main">
<div id="infer"><p> Observe this <span style="background-color: red;">list</span> carefully , questions will be asked on this list .</p></div>
<div id="hide"><p> [1,4,80,45,1,99,100,3,54,77,1,1000,24,67,78] </p></div>
<div id="que_hide">
<form name="quizform" action='scorify' method='post'>
<input type="hidden" name="timetaken"  id="ticker1">
<input type="hidden" name="answers" value="00000000000000000000" size="20">
<input type="hidden" name="qnumber" value="3" size="20">
<%   Integer ord= (Integer)session.getAttribute("Qorder"); 
session.setAttribute("Qorder", ord-1);
  String rej= (String)session.getAttribute("reject"); 
  session.setAttribute("reject", rej+",Type3");
%>

<table class='front' width='100%' border='0' cellspacing="0" cellpadding="1">
<tr>
<th class='front' align='left'>&nbsp;Online QUIZ</th>
</tr>
<tr>
<td class='front' colspan='2'>
<br>
<table><tr><td valign='top'><b>&nbsp;Type3.1. </td><td valign='top'><b> How many times number '1' appears in the list ? .<b></td></tr>
</table><br>
<table border='0'>
<tr><td valign='top'><input type='radio' name='quiz' id='1' value='1' /></td><td><label for='1'>3</label></td></tr>
<tr><td valign='top'><input type='radio' name='quiz' id='2' value='2' /></td><td><label for='2'>2</label></td></tr>
<tr><td valign='top'><input type='radio' name='quiz' id='4' value='4' /></td><td><label for='4'>1</label></td></tr>
<tr><td valign='top'><input type='radio' name='quiz' id='3' value='3' /></td><td><label for='3'>0</label></td></tr>
</table>
<br>
<table><tr><td valign='top'><b>&nbsp;Type3.2 </td><td valign='top'><b>How many numbers were greater than 80?<b></td></tr></table><br>
<table border='0'>
<tr><td valign='top'><input type='radio' name='quiz1' id='1' value='1' /></td><td><label for='1'>0</label></td></tr>
<tr><td valign='top'><input type='radio' name='quiz1' id='2' value='2' /></td><td><label for='2'>3</label></td></tr>
<tr><td valign='top'><input type='radio' name='quiz1' id='4' value='4' /></td><td><label for='4'>1</label></td></tr>
<tr><td valign='top'><input type='radio' name='quiz1' id='3' value='3' /></td><td><label for='3'>2</label></td></tr>
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

</div>
</body>
</html>