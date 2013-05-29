<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.ConnectionUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Progress Card</title>
<link rel="stylesheet" href="stylesheets/jqx.base.css" type="text/css" />
<script type="text/javascript" src="Javascripts/jquery-1.10.0.js"></script>
<script type="text/javascript" src="Javascripts/jqxcore.js"> </script>
<script type="text/javascript" src="Javascripts/jqxchart.js"> </script>
<script type="text/javascript" src="Javascripts/jqxdata.js"></script>
<script type="text/javascript">
function generate(){
 <% Connection conn = ConnectionUtils.getConnection();
 int userId = (Integer)session.getAttribute("userId");
 String sql= "select * from exam where id= ?";
 PreparedStatement stmt =conn.prepareStatement(sql); 
 stmt.setInt(1, userId);
 ResultSet rst =stmt.executeQuery();
    rst=stmt.executeQuery("select * from exam where id=1");
    List <Float>q_time = new ArrayList  <Float>();
    while(rst.next()){
    q_time.add(rst.getFloat("t1_time"));
    q_time.add(rst.getFloat("t2_time"));
    q_time.add(rst.getFloat("t3_time"));
    q_time.add(rst.getFloat("t4_time"));
    }
 %>
 
 var q_time = new Array(<%
			for(int i = 0; i < q_time.size(); i++) {
			  out.print(q_time.get(i));
			  if(i+1 < q_time.size()) {
			    out.print(",");
			  }
			}
			%>);
	
$(document).ready(function () {
    // prepare chart data as an array
    var  sampleData = [
       /*     { type:'Type1',q1:25},
            { type:'Type2', q2:35},
            { type:'Type3', q3:30},
            { type:'Type4', q4:45},
*/
       { type:'Type1',q1:q_time[0]},
       { type:'Type2', q2:q_time[1]},
       { type:'Type3', q3:q_time[2]},
       { type:'Type4', q4:q_time[3]},
        ];

    // prepare jqxChart settings
    var settings = {
        title: "Question wise  scorecard",
        description: "Time spent in each question",
		enableAnimations: true,
        showLegend: true,
        padding: { left: 5, top: 5, right: 5, bottom: 5 },
        titlePadding: { left: 90, top: 0, right: 0, bottom: 10 },
        source: sampleData,
        categoryAxis:
            {
                dataField: 'type',
                showGridLines: true
            },
        colorScheme: 'scheme05',
        seriesGroups:
            [
                {
                    type: 'column',
                    columnsGapPercent: 50,
                    seriesGapPercent: 0,
                    valueAxis:
                    {
                        unitInterval: 10,
                        minValue: 0,
                        maxValue: 100,
                        displayValueAxis: true,
                        description: 'Time in Seconds',
                        axisSize: 'auto',
                        tickMarksColor: '#888888'
                    },
                    series: [
                            { dataField: 'q1'},
                            { dataField: 'q2'},
                            { dataField: 'q3'},
                            {dataField:'q4' }
                        ]
                }
            ]
    };
    
    // setup the chart
    $('#jqxChart').jqxChart(settings);

}); }

</script>
</head>
<body >
    <div class="container" style="height:630px;width:700px;position: relative;">
     <div style="position: absolute;width:600px;height:100px;left:150px;top:20px;">   
   <a onclick="generate()" style="font-family: cursive;text-decoration: underline;">Click to generate time based analysis</a></div>
	<div style='height: 600px; width: 682px;'>
    <div id='host' style="margin: 0 auto; width:680px; height:400px;">
	<div id='jqxChart' style="width:680px; height:400px; position: relative; left: 150px; top: 50px;">
	</div>
	</div>
    </div>
   <div id="footer" style="position: absolute;width:200px;height:50px;right:-2px;bottom:20px;"><a href="report.jsp"><span>Check More Reports</span></a></div>
   </div>

</body>
</html>