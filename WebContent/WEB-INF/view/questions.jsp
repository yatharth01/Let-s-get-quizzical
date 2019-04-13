<%@page import="com.morphosis.quiz.CalScore"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.morphosis.quiz.DatabaseConnection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions

</title>



<body >
<%


response.setContentType("text/html");


String ques="loading...";
int count=0;
int score=0;
String option_A = "loading..";
String option_B = "loading..";
String option_C = "loading..";
String option_D = "loading..";
//String correct=null;

try {
	Statement s=DatabaseConnection.getConnection();
	Statement s2=DatabaseConnection.getConnection();
	Statement s3=DatabaseConnection.getConnection();
	Statement s4=DatabaseConnection.getConnection();
	
	Statement s6=DatabaseConnection.getConnection();
	ResultSet rs2= s2.executeQuery("select Count from counter");
	if(rs2.next())
	count=rs2.getInt(1);
	
	count++;
	int rows= s3.executeUpdate("UPDATE counter SET Count=" + count);
	System.out.println("connection established\n");
	System.out.println(count);
	ResultSet rs= s.executeQuery("select ques from options where flag="+count);
	ResultSet rs3= s4.executeQuery("select A,B,C,D from options where flag="+count);
	
	
	ResultSet rs6= s6.executeQuery("select score from score");
    if(rs6.next())
  	  score=rs6.getInt(1);
    
   
    //System.out.println(correct);
	
	if(rs3.next()) {
		option_A=rs3.getString("A");
		option_B=rs3.getString("B");
		option_C=rs3.getString("C");
		option_D=rs3.getString("D");

	}
	
	if(rs.next())
	{
	ques=rs.getString(1);
	// response.setIntHeader("Refresh", 30);
	}
	else ques="Quiz has ended. Wait for the results...";
	//System.out.println(ques);
	
	
	
	//DatabaseConnection.getCloseConnection();
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>

<p><%=ques%></p>
<br></br>
<form name="options">
  <input type="radio" name="answer" value="<%=option_A %>" ><%=option_A %><br>
  <input type="radio" name="answer" value="<%=option_B %>"> <%=option_B%><br>
  <input type="radio" name="answer" value="<%=option_C %>"> <%=option_C %><br>
  <input type="radio" name="answer" value="<%=option_D %>"> <%=option_D %><br>
  <br>

</form>

<script type="text/javascript">
        window.onload=function(){
            window.setTimeout('document.options.submit()', 10)
        }
    </script>

<% String answer = request.getParameter("answer");
   
   if(answer!=null)
    {
	   CalScore.calScore(count,answer);
	
     
     /* System.out.println(answer);
      
	    if(answer.equals(correct))
	    {
	    	score=score+5;
	    }
	    System.out.println(score);
	    Statement s4=DatabaseConnection.getConnection();
	    int rs4= s4.executeUpdate("update score set score="+score);
	    
	  
*/
	    

    }
   
	    %>

</body>
</html>