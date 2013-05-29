package com;
import com.ConnectionUtils;
import com.mysql.jdbc.Statement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

/**
 * Servlet implementation class Randomizer
 */
@WebServlet("/Randomizer")
public class Randomizer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static LinkedList<String> order;
	private Integer range; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Randomizer() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out= response.getWriter();
		RequestDispatcher rd ;
	     order = new LinkedList<String>();
	    Random rand= new Random();
	    HttpSession session =request.getSession();
	   range = (Integer) session.getAttribute("Qorder");
	   int userId=(int) session.getAttribute("userId");
	   // out.print(range);
	    ServletContext sc =getServletContext(); 
		String[] ques = sc.getInitParameter("Question").split(",");
		for(String q : ques){	
			order.add(q);
		}
        if (range==4){
        	
        	rd=request.getRequestDispatcher(order.get(rand.nextInt(4))+".jsp");
        	rd.forward(request, response);
        }
        
        else if (range>0 && range <4){
        String [] indices =	((String)session.getAttribute("reject")).split(",");
            for(String index : indices ){
            	//out.print(index.getClass() + " " + index);
            	order.remove(index);
            	}	
       	     
           /* for(String index : order ){
            	out.println(index);
            }*/
            
           rd=request.getRequestDispatcher(order.get(rand.nextInt(range))+".jsp");
          rd.forward(request, response);
        }
        
        else{
        	Connection  conn=null;
        	try {
        		out.print("yes");
				conn = ConnectionUtils.getConnection();
				String sql = "select * from exam where id = ?";
				PreparedStatement stmt =conn.prepareStatement(sql);
				ResultSet rst =null; 
				stmt.setInt(1, userId);
				rst =stmt.executeQuery();
				float avg,total;
				while(rst.next()){	
				total=rst.getFloat("T1_score")+rst.getFloat("T2_score")+rst.getFloat("T3_score")+rst.getFloat("T4_score");
				avg=(float)(total+((rst.getFloat("noa")-1)*rst.getFloat("average_score")))/(rst.getFloat("noa"));
				out.print(total + " " + avg);
				PreparedStatement psmt= conn.prepareStatement("update exam set score=? , average_score = ? where id = ?");
				psmt.setFloat(1, total);
				psmt.setFloat(2, avg);
				psmt.setInt(3, userId);
				psmt.executeUpdate();
				}
				} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			        	
      	    rd=request.getRequestDispatcher("/report.jsp");
        	rd.forward(request, response);
        }
        
		//out.print(order.get(2));
	}

}
