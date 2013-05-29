var limit="1:30" ;
if (document.images){
var parselimit=limit.split(":") ;
parselimit=parselimit[0]*60+parselimit[1]*1 ;
}
function begintimer(){
if (parselimit==1){
//window.location="http://localhost:8089/Randomizer";
//document.location.href="/TestingSite/Randomizer" ;
 //document.getElementById("quizform").submit();
document.forms["quizform"].submit();
	}
 else{ 
parselimit-=1;
curmin=Math.floor(parselimit/60);
cursec=parselimit%60;

if(parselimit/30==2){
	document.getElementById("que_hide").style.display='inline' ;
	document.getElementById("hide").style.display='none';
}

if (curmin!=0){
curtime=curmin+" minutes and "+cursec+" seconds left";
document.form1.ticker.value=curmin + ":" + cursec ;
document.quizform.ticker1.value=curmin + ":" + cursec ;
}
else{
curtime=cursec+" seconds left";
document.form1.ticker.value="00" + ":" +cursec ;
document.quizform.ticker1.value="00" + ":" +cursec ;
}
window.status=curtime;
setTimeout("begintimer()",1000);
}
}