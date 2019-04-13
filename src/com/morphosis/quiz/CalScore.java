package com.morphosis.quiz;

import java.sql.ResultSet;
import java.sql.Statement;

public class CalScore {
           public static void calScore(int count,String answer)
           {
        	   Statement s5,s6;
        	   String correct=null;
        	    int score=0;
			try {
				s5 = DatabaseConnection.getConnection();
				s6=DatabaseConnection.getConnection();
				ResultSet rs5= s5.executeQuery("select answer from options where flag="+count);
				ResultSet rs6= s6.executeQuery("select score from score");
				
				if(rs6.next())
				{
					score=rs6.getInt(1);
				}
				 if(rs5.next())
				    {
				    	correct=rs5.getString(1);
				    }
				 
				 
				 if(answer.equals(correct))
				    {
				    	score=score+5;
				    }
				    System.out.println(score);
				    Statement s4=DatabaseConnection.getConnection();
				    int rs4= s4.executeUpdate("update score set score="+score);
				    
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	   
           }
           public static int getScore()
           {
        	   int score=0;
        	 try {  Statement s6=DatabaseConnection.getConnection();
        	   ResultSet rs6= s6.executeQuery("select score from score");
        	   if(rs6.next())
        	   {
        		   score=rs6.getInt(1);
        	   }
        	 }
        	 catch (Exception e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}
        	 return score;
         	   
        	   
           }
}
