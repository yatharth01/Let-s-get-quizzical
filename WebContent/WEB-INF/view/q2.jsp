<%@page import="com.morphosis.quiz.CalScore"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.morphosis.quiz.DatabaseConnection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Question 2</title>
<script language="JavaScript" type="text/javascript"> 
var t = setTimeout("document.options.submit();",10000); //2 seconds measured in miliseconds
</script>

</head>
<body>
<h1>Question 2</h1>


<%
String answer1 = request.getParameter("answer1");

if(answer1!=null)
    {
	   CalScore.calScore(1,answer1);

	    

    }
%>


<%
String ques="loading..";

String option_A = "loading..";
String option_B = "loading..";
String option_C = "loading..";
String option_D = "loading..";

try {
	Statement s=DatabaseConnection.getConnection();
	Statement s2=DatabaseConnection.getConnection();
	
	ResultSet rs= s.executeQuery("select ques from options where flag=2");
	ResultSet rs2= s2.executeQuery("select A,B,C,D from options where flag=2");
	
	if(rs.next())
	{
	ques=rs.getString(1);
	
	}
	
	if(rs2.next()) {
		option_A=rs2.getString("A");
		option_B=rs2.getString("B");
		option_C=rs2.getString("C");
		option_D=rs2.getString("D");

	}
	DatabaseConnection.getCloseConnection();
	
	
}catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


%>


<p><%=ques%></p>
<br></br>
<form name="options" action="q3">
  <input type="radio" name="answer2" value="<%=option_A %>" ><%=option_A %><br>
  <input type="radio" name="answer2" value="<%=option_B %>"> <%=option_B%><br>
  <input type="radio" name="answer2" value="<%=option_C %>"> <%=option_C %><br>
  <input type="radio" name="answer2" value="<%=option_D %>"> <%=option_D %><br>
  <br>

</form>



</body>
</html>