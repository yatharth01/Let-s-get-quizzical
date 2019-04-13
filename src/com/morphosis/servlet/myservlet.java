package com.morphosis.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.morphosis.quiz.DatabaseConnection;

@WebServlet("/myservlet")

public class myservlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String answer = request.getParameter("answer");
	    int count=0;
	    int score=0;
	    String correct=null;
	    try {
	    Statement s=DatabaseConnection.getConnection();
	    Statement s2=DatabaseConnection.getConnection();
	    Statement s3=DatabaseConnection.getConnection();
	    Statement s4=DatabaseConnection.getConnection();
	    ResultSet rs2= s2.executeQuery("select count from counter");
       if(rs2.next())
       {
    	   count =rs2.getInt(1);
       }
	    ResultSet rs= s.executeQuery("select answer from options where flag="+count);
	    if(rs.next())
	    {
	    	correct=rs.getString(1);
	    }
	    ResultSet rs3= s3.executeQuery("select score from score");
      if(rs3.next())
    	  score=rs3.getInt(1);
	    
	    if(answer.equals(correct))
	    {
	    	score=score+5;
	    }
	    System.out.println(score);
	    int rs4= s4.executeUpdate("update score set score="+score);

	    }
	    catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	 
	}
}
}


