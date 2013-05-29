package com;
import com.ConnectionUtils;
import com.Computation;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.management.modelmbean.RequiredModelMBean;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class scorify
 */
@WebServlet("/scorify")
public class scorify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public scorify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd1=request.getRequestDispatcher("Randomizer");
		PrintWriter out =response.getWriter();
		 HttpSession session = request.getSession();
		 int userId=(int) session.getAttribute("userId"); 
		int question = Integer.parseInt(request.getParameter("qnumber"));
	 	out.print(question);
		if(question==1){
			 
		  String answer=request.getParameter("quiz");
		  String time= request.getParameter("timetaken");
		  String sql="update exam set T1_score=? ,t1_time=?  where id = ?";
		  Float score =(float) 0;
		  Float t=(float) 0;
		//  out.print(answer + " " + time );
          if (answer !=null){ 		  
		  if (answer.equals("2"))
		  {score=(float) 1.0;
		  }
		  else{
			  score=(float) -0.25;
			  }
		  }
          else{
        	  score=(float) 0;
          }
		  try {
			    out.print("yes");
			    String splitTime [] = time.split(":");
			    if (splitTime.length>1 && splitTime!=null){
			    t=(float) (Integer.parseInt(splitTime[0]) * 60 + Integer.parseInt(splitTime[1]));	
			    }
			   
				Connection conn = ConnectionUtils.getConnection();
				PreparedStatement psmt  =null;
				psmt=conn.prepareStatement(sql);
				psmt.setFloat(1, score);
				psmt.setFloat(2, (90-t));
				psmt.setInt(3, userId);
				psmt.executeUpdate();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  }
		
		else if (question==2){
			 String [] answer=request.getParameterValues("quiz");
			  String time= request.getParameter("timetaken");
			  String sql="update exam set T2_score=? ,t2_time=?  where id = ?";
			  Float score = (float) 0;
		 out.println(answer[0] + " " + time + " " + answer.length);
			if(answer !=null)
			{	
			   if(answer.length==2){
				
				if(answer[0].equals("2") && answer[1].equals("3")){score=(float) 1;}
				else{for(String ans : answer){if(ans.equals("2") || ans.equals("3")){score=(float) 0.25;}}
				if (score==0){score=(float) -0.25;}
				
				}	
			}
			else{
				if(answer[0].equals("2") || answer[0].equals("3"))
					score = (float) 0.50;
				else
				 score=(float) -.1;
			}}
			
			Connection conn;
			try {
				String splitTime [] = time.split(":");
				Float t =(float) 0;
			    if (splitTime.length>1 && splitTime!=null)
			    t=(float) (Integer.parseInt(splitTime[0]) * 60 + Integer.parseInt(splitTime[1]));
				conn = ConnectionUtils.getConnection();
				PreparedStatement psmt  =null;
				psmt=conn.prepareStatement(sql);
				psmt.setFloat(1, score);
				psmt.setFloat(2, (90-t));
				psmt.setInt(3, userId);
				psmt.executeUpdate();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
		
		else if(question==3){
			 String time= request.getParameter("timetaken");
			 String sql="update exam set T3_score=? ,t3_time=?  where id = ?";
			 String answer=request.getParameter("quiz");
			 String answer1 = request.getParameter("quiz1");
			Float score =(float) 0;
			if (answer==null && answer1 ==null){score =(float) 0;}
			else{
				Computation co = new Computation(); 
				score=score+co.calculateScore(answer,"1") + co.calculateScore(answer1,"2");	
			}
			out.print(score);
			Connection conn;
			try {
				String splitTime [] = time.split(":");
				Float t =(float) 0;
			    if (splitTime.length>1 && splitTime!=null)
			    t=(float) (Integer.parseInt(splitTime[0]) * 60 + Integer.parseInt(splitTime[1]));
				conn = ConnectionUtils.getConnection();
				PreparedStatement psmt  =null;
				psmt=conn.prepareStatement(sql);
				psmt.setFloat(1, score);
				psmt.setFloat(2, (90-t));
				psmt.setInt(3, userId);
				psmt.executeUpdate();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else{
			String sql="update exam set T4_score=6 , t4_time = ? where id = ?";
			String time= request.getParameter("timetaken");
			Float t = (float) 0;
			String splitTime [] = time.split(":");
		    if (splitTime.length>1 && splitTime!=null){
		    t=(float) (Integer.parseInt(splitTime[0]) * 60 + Integer.parseInt(splitTime[1]));	
		    }
			Connection conn;
			try {
				conn = ConnectionUtils.getConnection();
				PreparedStatement psmt  =null;
				psmt=conn.prepareStatement(sql);
				psmt.setFloat(1, (90-t));
				psmt.setInt(2, userId);
				psmt.executeUpdate();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		rd1.forward(request, response);	
	}

}
