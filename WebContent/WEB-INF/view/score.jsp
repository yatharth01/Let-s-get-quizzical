<%@page import="com.morphosis.quiz.CalScore"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Score is</title>
</head>
<body>
<%
   String answer3 = request.getParameter("answer3");
   

   if(answer3!=null)
   {
	   CalScore.calScore(3,answer3);

   }
   
   
	    %>
	 Your score is ::   <%=CalScore.getScore() %>
</body>
</html>