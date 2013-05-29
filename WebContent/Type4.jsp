<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Attempt type 4 Question</title>
<script type="text/javascript" src="Javascripts/timer.js"></script>
<script>
	var vrgen = new Array(); // X,Ok
	
	function back(id,status){
//	document.getElementById(id).style.display='none';
document.getElementById(id).style.visibility='hidden';
	vrgen.push(status);
	}
 
 function	checkForm(){
 
 if(vrgen.length==0){
 alert("Choose one picture which you prefer and one which you don't prefer");
 return false;
 }
 else if(vrgen.length<2) {
  if (vrgen[0]=='X'){
  alert("Also Choose one picture you  prefer");
  return false;
  }
  else{
  alert("Also choose one picture you do not prefer");
  return false;
  }
 }
 else if(vrgen.length>2 || (vrgen[0]=='X' && vrgen[1]=='X') || (vrgen[0]=='Ok' && vrgen[1]=='Ok')){
 alert("Choose one picture for selection and rejection");
 location.reload();
 return false;
 var imgAr = new Array("statusXSmall" ,"statusOkSmall");
 for(var i =1;i<5;i++)
 {
 document.getElementById(imgAr[0]+i.toString()).style.visibility='visible';
 document.getElementById(imgAr[1]+i.toString()).style.visibility='visible';
 }
 }
 else{
 return true;
 }
 }
 </script>
<style type="text/css">
img{
	float:left;
}
#container{
	position:absolute;
  margin: 2px;
  left:300px;
  height:700px;
  top:50px;
}

.wrapper{
 position:relative;
	width:500px;
	height:800px;
}
.last{
	position:absolute;
	bottom:50px;
	left:400px;
}
#header{
        margin:0px;
		padding:1px;
		position:absolute;
		left:350px
}
</style>

</head>
<body onload="begintimer()">
<div class='wrapper' >
<div id="header"><form name="form1"><input id= "ticker" type="text" name="ticker" disabled="disabled" /></form></div>
<form  name="quizform" method='post' action='scorify' onSubmit='return checkForm();' >
<input type="hidden" name="timetaken"  id="ticker1" value="">
<input type="hidden" name="answers" value="00000000000000000000" size="20">
<input type="hidden" name="qnumber" value="4" size="20">

<% 
Integer ord= (Integer)session.getAttribute("Qorder"); 
session.setAttribute("Qorder", ord-1);
  String rej= (String)session.getAttribute("reject"); 
  session.setAttribute("reject", rej+",Type4");
%>  
	<div style='text-align:center; margin-left:-15px;' id="container">
			<table class="imgSet" cellspacing="15">
          <caption>Type4</caption>
<tr>	<td><p id="paltt0" class="paltt">Going To The Office</p>
		<div id="singleImgHolder1" class="singleImgHolder"></div>
			
		<input type="hidden" name="statusHolder1" id="statusHolder1" value="0">
			<img src="Images/01-01.png" width="225" height="225" id="imgaltt0" alt="going to the office" title="going to the office"/>
			<a href="#" title="Appeals the least" alt="Appeals the least" onclick="back('statusOkSmall1','X')">
				<img src="Images/statusXSmall.gif" width="20" height="20" id="statusXSmall1" style="width:20px;" title="Appeals the least" alt="Appeals the least" />
			</a>
			<a href="#" title="Appeals most" alt="Appeals most" onclick="back('statusXSmall1','Ok')">
				<img src="Images/statusOkSmall.gif" width="20" height="20" id="statusOkSmall1" style="width:20px; left:30px;" title="Appeals most" alt="Appeals most" />
			</a>
	
		</div>
	</td>
	<td><p id="paltt1" class="paltt">Research Job</p>
		<div id="singleImgHolder2" class="singleImgHolder">
			
		<input type="hidden" name="statusHolder2" id="statusHolder2" value="0">
			<img src="Images/01-02.png" width="225" height="225" id="imgaltt1" alt="research job" title="research job"/>
			<a href="#" title="Appeals the least" alt="Appeals the least" onclick="back('statusOkSmall2','X')">
				<img src="Images/statusXSmall.gif" width="20" height="20" id="statusXSmall2" style="width:20px;" title="Appeals the least" alt="Appeals the least" />
			</a>
			<a href="#" title="Appeals most" alt="Appeals most" onclick="back('statusXSmall2','Ok')">
			<img src="Images/statusOkSmall.gif" width="20" height="20" id="statusOkSmall2" style="width:20px; left:30px;" title="Appeals most" alt="Appeals most" />
			</a>
			
		</div>
	</td>
</tr><tr>	<td><p id="paltt2" class="paltt">Construction and Engineering</p>
	<div id="singleImgHolder3" class="singleImgHolder">
			
			<input type="hidden" name="statusHolder3" id="statusHolder3" value="0">
			<img src="Images/01-03.png" width="225" height="225" id="imgaltt2" alt="construction and engineering" title="construction and engineering"/>
			<a href="#" title="Appeals the least" alt="Appeals the least" onclick="back('statusOkSmall3','X')">
			<img src="Images/statusXSmall.gif" width="20" height="20" id="statusXSmall3" style="width:20px;" title="Appeals the least" alt="Appeals the least" />
			</a>
			<a href="#" title="Appeals most" alt="Appeals most" onclick="back('statusXSmall3','Ok')">
				<img src="Images/statusOkSmall.gif" width="20" height="20" id="statusOkSmall3" style="width:20px; left:30px;" title="Appeals most" alt="Appeals most" />
			</a>
			
		</div>
	</td>
	<td><p id="paltt3" class="paltt">Creative Photography</p>
		<div id="singleImgHolder4" class="singleImgHolder">
			
		<input type="hidden" name="statusHolder4" id="statusHolder4" value="0">
			<img src="Images/01-04.png" width="225" height="225" id="imgaltt3" alt="creative photography" title="creative photography"/>
			<a href="#" title="Appeals the least" alt="Appeals the least" onclick="back('statusOkSmall4','X')">
			<img src="Images/statusXSmall.gif" width="20" height="20" id="statusXSmall4" style="width:20px;" title="Appeals the least" alt="Appeals the least" />
			</a>
			<a href="#" title="Appeals most" alt="Appeals most" onclick="back('statusXSmall4','Ok')">
				<img src="Images/statusOkSmall.gif" width="20" height="20" id="statusOkSmall4" style="width:20px; left:30px;" title="Appeals most" alt="Appeals most" />
			</a>
	
		</div>
	</td>
</tr>				
			</table>
			</div>
		<div class="last">
			
			<input type="submit" class="knop" name="submit" id="volgende_knop" value="Next"  />
			</div>
				
		 </form>	
		
			</div>


</body>
</html>